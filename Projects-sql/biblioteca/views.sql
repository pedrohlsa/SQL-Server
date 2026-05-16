CREATE OR ALTER VIEW v_estoquebaixo AS 
    SELECT id_livro, nomelivro, estoque
    FROM livro
    WHERE estoque <= 10;
GO

CREATE OR ALTER VIEW v_alugueis_pendentes AS
    SELECT
        c.id_cliente,
        c.nomecliente,
        l.id_livro,
        l.nomelivro,
        a.data_emprestimo 
    FROM alugar_livro a
    INNER JOIN cliente c ON a.id_cliente = c.id_cliente
    INNER JOIN livro l ON a.id_livro = l.id_livro
    WHERE a.livro_devolvido = 'N' AND a.data_emprestimo < DATEADD(day, -7, GETDATE()); 
GO

CREATE OR ALTER VIEW v_vitrine_livros AS
    SELECT 
        l.nomelivro,
        CONCAT(a.nomeautor, ' ', a.sobrenomeautor) AS nome_autor,
        ass.nomeAssunto,
        l.preco,
        l.sinopse
    FROM livro l
    INNER JOIN assunto ass ON l.id_assunto = ass.id_assunto
    INNER JOIN livro_autor au ON l.id_livro = au.id_livro
    INNER JOIN autor a on a.id_autor = au.id_autor;
GO

CREATE OR ALTER VIEW v_rankingvendas_semana AS
    SELECT
        f.id_funcionario,
        CONCAT(f.nomefunc, ' ', f.sobrenomefunc) as nome_funcionario,
        COUNT(v.id_venda) as total_vendas
    FROM funcionario f
    INNER JOIN venda v on f.id_funcionario = v.id_funcionario
    WHERE v.data_venda >= DATEADD(day, -7, GETDATE())
    GROUP BY f.id_funcionario, f.nomefunc, f.sobrenomefunc;
GO

CREATE OR ALTER VIEW v_rankingvendas_mensal AS
    SELECT
        f.id_funcionario,
        CONCAT(f.nomefunc, ' ', f.sobrenomefunc) as nome_funcionario,
        COUNT(v.id_venda) as total_vendas
    FROM funcionario f
    INNER JOIN venda v on f.id_funcionario = v.id_funcionario
    WHERE v.data_venda >= DATEADD(day, -30, GETDATE())
    GROUP BY f.id_funcionario, f.nomefunc, f.sobrenomefunc;
GO

CREATE OR ALTER VIEW v_faturamentovendas_mensal AS
SELECT 
    (SELECT ISNULL(SUM(iv.preco_pago_unitario * iv.quantia), 0) 
     FROM item_venda iv 
     JOIN venda v ON iv.id_venda = v.id_venda
     WHERE v.status_venda = 'Concluida' 
       AND v.data_venda >= DATEADD(day, -30, GETDATE())) AS venda_mensal,

    (SELECT ISNULL(SUM(al.valor_aluguel), 0)
     FROM alugar_livro al 
     WHERE al.livro_devolvido = 'S' 
       AND al.data_emprestimo >= DATEADD(day, -30, GETDATE())) AS aluguel_mensal,

    (SELECT ISNULL(SUM(iv.preco_pago_unitario * iv.quantia), 0) 
     FROM item_venda iv 
     JOIN venda v ON iv.id_venda = v.id_venda
     WHERE v.status_venda = 'Concluida' 
       AND v.data_venda >= DATEADD(day, -30, GETDATE()))
    +
    (SELECT ISNULL(SUM(al.valor_aluguel), 0)
     FROM alugar_livro al 
     WHERE al.livro_devolvido = 'S' 
       AND al.data_emprestimo >= DATEADD(day, -30, GETDATE())) AS total_geral_mensal;
GO

CREATE OR ALTER VIEW v_faturamentovendas_total AS 
SELECT 
    (SELECT ISNULL(SUM(iv.preco_pago_unitario * iv.quantia), 0) 
     FROM item_venda iv 
     JOIN venda v ON iv.id_venda = v.id_venda 
     WHERE v.status_venda = 'Concluida') AS venda_totais,

    (SELECT ISNULL(SUM(al.valor_aluguel), 0) 
     FROM alugar_livro al 
     WHERE al.livro_devolvido = 'S') AS aluguel_totais,

    (SELECT ISNULL(SUM(iv.preco_pago_unitario * iv.quantia), 0) 
     FROM item_venda iv 
     JOIN venda v ON iv.id_venda = v.id_venda 
     WHERE v.status_venda = 'Concluida') 
    + 
    (SELECT ISNULL(SUM(al.valor_aluguel), 0) 
     FROM alugar_livro al 
     WHERE al.livro_devolvido = 'S') AS total_geral;
GO
CREATE OR ALTER VIEW v_faturamento_unitario AS
    SELECT DISTINCT --evitar duplicatas 
        iv.id_livro,
        l.nomelivro,
        iv.preco_pago_unitario AS preco_venda, 
        c.preco_unitario AS preco_custo
    FROM item_venda iv
    JOIN compra c ON iv.id_livro = c.id_livro
    JOIN venda v ON iv.id_venda = v.id_venda
    JOIN livro l ON iv.id_livro = l.id_livro
    WHERE v.status_venda = 'Concluida';
GO
 
CREATE OR ALTER VIEW v_faturamentoliquido AS 
SELECT 
    
    (SELECT ISNULL(SUM(iv.quantia * iv.preco_pago_unitario), 0) FROM item_venda iv
     JOIN venda v ON iv.id_venda = v.id_venda WHERE v.status_venda = 'Concluida')
    +
    (SELECT ISNULL(SUM(valor_aluguel), 0) FROM alugar_livro WHERE livro_devolvido = 'S')
    AS total_entradas,

    
    (SELECT ISNULL(SUM(quantia * preco_unitario), 0) FROM compra)
    +
    (SELECT ISNULL(SUM(valor_pago), 0) FROM pagamento_func)
    +
    (SELECT ISNULL(SUM(valor_gasto), 0) FROM manutencao_gastos)
    AS total_saidas,

    
    (
        (SELECT ISNULL(SUM(iv.quantia * iv.preco_pago_unitario), 0) FROM item_venda iv
         JOIN venda v ON iv.id_venda = v.id_venda WHERE v.status_venda = 'Concluida') +
        (SELECT ISNULL(SUM(valor_aluguel), 0) FROM alugar_livro WHERE livro_devolvido = 'S')
    ) - (
        (SELECT ISNULL(SUM(quantia * preco_unitario), 0) FROM compra) +
        (SELECT ISNULL(SUM(valor_pago), 0) FROM pagamento_func) +
        (SELECT ISNULL(SUM(valor_gasto), 0) FROM manutencao_gastos)
    ) AS lucro_real;
GO
