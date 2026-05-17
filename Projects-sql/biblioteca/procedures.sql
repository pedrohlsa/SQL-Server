CREATE OR ALTER PROCEDURE pr_registrar_venda
	@id_cliente int,
	@id_funcionario int,
	@id_formapgto int,
	@id_livro int,
	@quantia int
AS
BEGIN 
	SET NOCOUNT ON;

	DECLARE @id_venda_gerado INT;
	DECLARE @preco_atual DECIMAL(10,2);

	SELECT @preco_atual = preco
	FROM livro
	WHERE id_livro = @id_livro;

	IF @preco_atual IS NULL
	BEGIN
		RAISERROR('Livro não encontrado', 16, 1);
		RETURN;
	END;

	INSERT INTO venda (id_formapgto, id_funcionario, data_venda, status_venda)
	VALUES (@id_formapgto, @id_funcionario, GETDATE(), 'Concluida');

	SET @id_venda_gerado = SCOPE_IDENTITY();

	INSERT INTO item_venda(id_venda, id_livro, preco_pago_unitario, quantia)
	VALUES (@id_venda_gerado, @id_livro, @preco_atual, @quantia);

	PRINT 'Venda registrada com sucesso! ID da Venda: ' + CAST(@id_venda_gerado AS VARCHAR);

END;
GO

CREATE OR ALTER PROCEDURE pr_realizar_aluguel
	@id_livro int,
	@id_cliente int,
	@valor_aluguel decimal(10,2)
AS 
BEGIN 
	SET NOCOUNT ON;

	IF EXISTS(
		SELECT 1
		FROM alugar_livro
		WHERE id_cliente = @id_cliente 
			AND livro_devolvido = 'N'
		)
		BEGIN 
			RAISERROR('Cliente com livro já alugado!', 16, 1);
			RETURN;
		END
		
	INSERT INTO alugar_livro(id_livro, id_cliente,  valor_aluguel, data_emprestimo, livro_devolvido)
	VALUES(@id_livro, @id_cliente, @valor_aluguel, GETDATE(), 'N');

	PRINT 'Aluguel realizado com sucesso!';
	END;
GO

CREATE OR ALTER PROCEDURE pr_devolver_livro
	@id_alugarlivro int
AS
BEGIN 
	SET NOCOUNT ON;

	UPDATE alugar_livro
	SET livro_devolvido = 'S',
		data_devolucao = GETDATE()
	WHERE id_alugarlivro = @id_alugarlivro;

	PRINT 'Devolução registrada com sucesso';
END;
GO

CREATE OR ALTER PROCEDURE pr_aplicar_reajuste_preco
	@id_assunto INT,
	@porcentagem_aumento DECIMAL (5,2)
AS
BEGIN
	SET NOCOUNT ON;
	
	UPDATE livro
	SET preco = preco * (1 + (@porcentagem_aumento / 100))
	WHERE id_assunto = @id_assunto;

	PRINT 'Preço reajustados com sucesso!';
END;
GO

CREATE OR ALTER PROCEDURE pr_demitir_funcionario
    @id_funcionario int,
	@motivo_demissao VARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;

	IF NOT EXISTS( 
	SELECT 1 
	FROM funcionario 
	WHERE id_funcionario = @id_funcionario
	)
	BEGIN
		RAISERROR('Erro: Funcionario não encontrado no sistema!', 16, 1);
		RETURN;
	END

		UPDATE funcionario 
		SET status_funcionario = 'Inativo',
			salario = 0
		WHERE id_funcionario = @id_funcionario

		UPDATE info_func 
		SET data_demissao = GETDATE(),
			motivo_desligamento = @motivo_demissao
		WHERE id_funcionario = @id_funcionario

		PRINT 'Funcionario demitido e ficha atualizada com sucesso!';
END;
GO

CREATE OR ALTER PROCEDURE pr_cancelar_venda 
	@id_venda int
AS 
BEGIN 
	SET NOCOUNT ON;

	IF NOT EXISTS(
	SELECT 1
	FROM venda
	WHERE id_venda = @id_venda
	)
	BEGIN
		RAISERROR('Erro: id de venda não encontrada!', 16, 1);
		RETURN;
	END

	UPDATE venda
	SET status_venda = 'Cancelada'
	WHERE id_venda = @id_venda

	PRINT 'Venda cancelada com sucesso!';
END;
GO

