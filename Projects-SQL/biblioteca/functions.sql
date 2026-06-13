CREATE FUNCTION fn_quantidade_alugueis_cliente (@id_cliente INT)
RETURNS INT
AS
BEGIN
	DECLARE @resultado INT
	
	SELECT @resultado = COUNT(*)  
	FROM alugar_livro
	WHERE id_cliente = @id_cliente
	
	RETURN @resultado  
END

CREATE FUNCTION fn_calcular_multa(@id_alugarlivro int) -- declarando minha variavel
RETURNS DECIMAL(10,2) -- retornar decimal
AS
BEGIN
    DECLARE @multa decimal(10,2) = 0 -- inicializa com 0 para seguranca
    DECLARE @dias_atraso int

    SELECT @dias_atraso = DATEDIFF(DAY, DATEADD(DAY, dias_contratados, data_emprestimo),ISNULL(data_devolucao, GETDATE()))
    FROM alugar_livro
    WHERE id_alugarlivro = @id_alugarlivro

    IF @dias_atraso > 0
        SET @multa = @dias_atraso * 2.50 -- 2.50 por dia   

    Return @multa -- caso o cliente tenha devolvido no prazo, retorna 0 ao inves de NULL
END;
GO
