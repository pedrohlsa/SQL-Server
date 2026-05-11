-- Basic triggers until line 133.

CREATE OR ALTER TRIGGER trg_listarAssuntos
ON assunto
AFTER UPDATE
AS
BEGIN
	select id_assunto, nomeAssunto 
	FROM inserted;
END;
GO

CREATE OR ALTER TRIGGER trg_listarAutores
ON autor
AFTER UPDATE
AS
	BEGIN
	select id_autor, concat(nomeautor, ' ',sobrenomeautor) as Nome 
	FROM inserted;
END;
GO

CREATE OR ALTER TRIGGER trg_listarLivroAutor
on livro_autor
after update
as 
	begin
	select ins.id_livroautor, ins.id_livro, l.nomeLivro as livro, ins.id_autor, a.nomeautor
	from inserted ins
	join livro L ON ins.id_livro = l.id_livro
	join autor a ON ins.id_autor = a.id_autor 
END;
GO

CREATE OR ALTER TRIGGER trg_listarLivros
on livro 
after update 
as 
	BEGIN
	select id_livro, nomelivro as nome, ISBN13, estoque, paginas, idioma, data_lanc as lancamento, preco, sinopse, id_assunto assunto, id_editora as editora
	from inserted;
END;
GO

CREATE OR ALTER TRIGGER trg_listarDepartamento
on departamento
after update 
as 
begin
	select id_departamento, nomeDepartamento
	FROM inserted;
END;
GO

CREATE OR ALTER TRIGGER trg_listarFormaPagamento
on forma_pgto
after update
as 
begin 
	select id_formapgto, forma_pgto 
	FROM inserted;
END;
GO

CREATE OR ALTER TRIGGER trg_listarFuncionario
on funcionario 
after update 
as
begin 
	select id_funcionario, id_departamento, concat(nomefunc,' ',sobrenomefunc) as nome, cpffunc as cpf, data_nasc as nascimento, salario
	from inserted;
end;
GO

CREATE OR ALTER TRIGGER trg_listarVenda
on venda
after update 
as begin 
	select ins.id_venda, fp.forma_pgto As Metodo_pago, ins.id_funcionario, f.nomefunc as Vendedor, ins.data_venda, ins.status_venda
	from inserted ins
	inner join forma_pgto fp on ins.id_formapgto = fp.id_formapgto
	inner join funcionario f on ins.id_funcionario = f.id_funcionario
END;
GO

CREATE OR ALTER TRIGGER trg_listarPagamentoFuncionario
ON pagamento_func
after update 
as 
begin
	select ins.id_pagamento, fp.forma_pgto, f.nomeFunc, ins.mes_referente, ins.valor_pago, ins.dia_pgto, ins.prox_pgto, ins.status_pgto
	from inserted ins
	inner join forma_pgto fp on ins.id_formapgto = fp.id_formapgto
	inner join funcionario f on ins.id_funcionario = f.id_funcionario
END;
GO

CREATE OR ALTER TRIGGER trg_listarCliente
ON cliente
after update 
as 
begin 
	select id_cliente, concat(nomecliente, ' ',sobrenomecliente) as nome, cpfcliente as cpf, data_nasc as nascimento
	from inserted;
END
GO

CREATE OR ALTER TRIGGER trg_listaritem_venda
on item_venda
after update 
as 
begin 
	select ins.id_itemvenda, ins.id_venda, l.nomelivro, ins.preco_pago_unitario, ins.quantia
	from inserted ins
	inner join livro l on ins.id_livro = l.id_livro
END;
GO

CREATE OR ALTER TRIGGER trg_listar_aluguel
ON alugar_livro
AFTER INSERT
AS 
BEGIN
    SELECT 
        l.nomelivro, 
        c.nomecliente, 
        i.data_emprestimo, 
        i.livro_devolvido
    FROM inserted i
    INNER JOIN livro l ON l.id_livro = i.id_livro
    INNER JOIN cliente c ON c.id_cliente = i.id_cliente;
END;
GO
	
----------------------------------------------------

CREATE OR ALTER TRIGGER trg_estoque_venda
ON item_venda
AFTER INSERT
AS
BEGIN
    UPDATE l
    SET l.estoque = l.estoque - i.quantia
    FROM livro l
    INNER JOIN inserted i ON l.id_livro = i.id_livro;
END;
GO

CREATE OR ALTER TRIGGER trg_estoque_aluguel
ON alugar_livro 
AFTER INSERT 
AS 
BEGIN 
    UPDATE l
    SET l.estoque = l.estoque - 1
    FROM inserted i
    inner join livro l on l.id_livro = i.id_livro;
END;
GO

CREATE OR ALTER TRIGGER trg_estoque_devolucao
ON alugar_livro
AFTER UPDATE
AS
BEGIN
    UPDATE l
    SET l.estoque = l.estoque + 1
    FROM livro l
    INNER JOIN inserted i ON l.id_livro = i.id_livro
    INNER JOIN deleted d ON d.id_alugarlivro = i.id_alugarlivro
    WHERE i.livro_devolvido = 'S' AND d.livro_devolvido = 'N'; 
END;
GO

CREATE OR ALTER TRIGGER trg_block_formapgto
ON forma_pgto
AFTER INSERT 
AS 
BEGIN 
    ROLLBACK TRANSACTION;

    PRINT 'Erro: A tabela forma_pgto não pode ser inserida nenhum valor novo.';
END;
GO

CREATE OR ALTER TRIGGER trg_preco_historico 
ON livro
AFTER UPDATE
AS 
BEGIN
    SET NOCOUNT ON;
    IF UPDATE(preco)
    BEGIN
        INSERT INTO preco_historico (id_livro, preco_antigo, preco_novo, data_alteracao)
        SELECT
            d.id_livro,
            d.preco,
            i.preco,
            GETDATE()
        FROM inserted i
        JOIN deleted d ON i.id_livro = d.id_livro
        WHERE i.preco <> d.preco;
    END
END;
GO

CREATE OR ALTER TRIGGER trg_estoquenegativo
ON item_venda
AFTER INSERT
AS
BEGIN 
    SET NOCOUNT ON;
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN livro l ON i.id_livro = l.id_livro
        WHERE l.estoque < 0 
    )
    BEGIN
        RAISERROR ('Estoque insuficiente para realizar a venda!', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

-- Logs 

CREATE OR ALTER TRIGGER trg_log_livro ON livro AFTER UPDATE, INSERT, DELETE AS BEGIN
    SET NOCOUNT ON;
    IF EXISTS(SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
        INSERT INTO logs(tabela_afestada, id_registro, acao, valor_atual)
        SELECT 'livro', id_livro, 'INSERT', nomelivro FROM inserted;
    
    IF EXISTS(SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
        INSERT INTO logs(tabela_afestada, id_registro, acao, valor_antigo, valor_atual)
        SELECT 'livro', i.id_livro, 'UPDATE', d.nomelivro, i.nomelivro
        FROM inserted i JOIN deleted d ON i.id_livro = d.id_livro;
    
    IF NOT EXISTS(SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
        INSERT INTO logs(tabela_afestada, id_registro, acao, valor_antigo)
        SELECT 'livro', id_livro, 'DELETE', nomelivro FROM deleted;
END;
GO

CREATE OR ALTER TRIGGER trg_alugaron ON alugar_livro AFTER UPDATE, INSERT, DELETE AS BEGIN
    SET NOCOUNT ON;
    IF EXISTS(SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
        INSERT INTO logs(tabela_afestada, id_registro, acao, valor_atual, valor_novo_secundario)
        SELECT 'alugar_livro', id_alugarlivro, 'INSERT', CAST(id_livro AS VARCHAR), CAST(id_cliente AS VARCHAR) FROM inserted;

    IF EXISTS(SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
        INSERT INTO logs(tabela_afestada, id_registro, acao, valor_antigo, valor_antigo_secundario, valor_atual, valor_novo_secundario)
        SELECT 'alugar_livro', i.id_alugarlivro, 'UPDATE', CAST(d.id_livro AS VARCHAR), CAST(d.id_cliente AS VARCHAR), CAST(i.id_livro AS VARCHAR), CAST(i.id_cliente AS VARCHAR)
        FROM inserted i JOIN deleted d ON i.id_alugarlivro = d.id_alugarlivro;

    IF NOT EXISTS(SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
        INSERT INTO logs(tabela_afestada, id_registro, acao, valor_antigo, valor_antigo_secundario)
        SELECT 'alugar_livro', id_alugarlivro, 'DELETE', CAST(id_livro AS VARCHAR), CAST(id_cliente AS VARCHAR) FROM deleted;
END;
GO

CREATE OR ALTER TRIGGER trg_log_venda ON venda AFTER UPDATE AS BEGIN
    SET NOCOUNT ON;
    IF UPDATE(status_venda)
        INSERT INTO logs(tabela_afestada, id_registro, acao, valor_antigo, valor_atual)
        SELECT 'venda', i.id_venda, 'UPDATE_STS', d.status_venda, i.status_venda
        FROM inserted i JOIN deleted d ON i.id_venda = d.id_venda;
END;
GO

CREATE OR ALTER TRIGGER trg_log_pgto_func ON pagamento_func AFTER INSERT, UPDATE AS BEGIN
    SET NOCOUNT ON;
    INSERT INTO logs(tabela_afestada, id_registro, acao, valor_atual)
    SELECT 'pagamento_func', id_pagamento, 'REGISTRO', CAST(valor_pago AS VARCHAR) FROM inserted;
END;
GO

CREATE OR ALTER TRIGGER trg_manutencao_alterarstatus ON manutencao_gastos AFTER INSERT AS BEGIN
    SET NOCOUNT ON;
    UPDATE manutencao_chamado
    SET status_resolvido = 'S', data_resolucao = GETDATE()
    FROM manutencao_chamado m
    JOIN inserted i ON i.id_chamado = m.id_chamado;
END;
GO

CREATE OR ALTER TRIGGER trg_manutencao_blockupdategasto ON manutencao_gastos AFTER UPDATE AS BEGIN
    SET NOCOUNT ON;
    IF UPDATE(valor_gasto)
    BEGIN
        IF EXISTS (SELECT 1 FROM inserted i JOIN manutencao_chamado c ON i.id_chamado = c.id_chamado WHERE c.status_resolvido = 'S')
        BEGIN
            RAISERROR('Erro! Não é possível alterar o valor gasto de um chamado já resolvido.', 16, 1);
            ROLLBACK TRANSACTION;
        END
    END
END;
GO

