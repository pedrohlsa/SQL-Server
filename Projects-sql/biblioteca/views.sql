CREATE OR ALTER VIEW v_estoquebaixo AS 
    SELECT id_livro, nomelivro, estoque
    FROM livro
    WHERE estoque <= 10;
GO

CREATE OR ALTER VIEW v_alugueis_pendetes AS
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
        iv.id_livro,
        l.nomelivro,
        SUM(iv.quantia) as unidades_vendidas,
        COUNT(DISTINCT v.id_venda) as qtd_transacoes,
        SUM(iv.quantia * iv.preco_pago_unitario) as faturamento_total
    FROM item_venda iv
    INNER JOIN livro l on iv.id_livro = l.id_livro
    INNER JOIN venda v on iv.id_venda = v.id_venda
    WHERE v.status_venda = 'Concluida' 
      AND v.data_venda >= DATEADD(day, -30, GETDATE()) 
    GROUP BY iv.id_livro, l.nomelivro;
GO

CREATE OR ALTER VIEW v_faturamentovendas_total AS 
    SELECT 
        iv.id_livro,
        l.nomelivro,
        SUM(iv.quantia) as total_unidades_vendidas,
        SUM(iv.quantia * iv.preco_pago_unitario) as faturamento_historico
    FROM item_venda iv
    INNER JOIN livro l on iv.id_livro = l.id_livro
    INNER JOIN venda v on iv.id_venda = v.id_venda
    WHERE v.status_venda = 'Concluida'
    GROUP BY iv.id_livro, l.nomelivro;
GO
