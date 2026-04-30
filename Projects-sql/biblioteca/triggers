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
	select id_funcionario, id_departamento, concat(nomefunc,' ',sobrenomefunc) as nome, cpffunc as cpf, data_nasc as nascimento, salario, rua, numero, complemento, bairro, cidade, estado, cep
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
