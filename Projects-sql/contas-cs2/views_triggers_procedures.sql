-- Views line 6 until 36 
-- Triggers line 37 until 169
-- Procedures line 171 until 216

-- Contas que ainda faltam pegar a caixa
CREATE OR ALTER VIEW  v_faltapegar AS
SELECT nome_usuario, status_drop_semanal
FROM contas
WHERE status_drop_semanal = 'N' AND status_conta = 'Livre';
GO
	
-- Contas proximas do level 40
CREATE OR ALTER VIEW v_proximodamedalha AS
SELECT nome_usuario, level_conta, xp_atual 
FROM contas
WHERE level_conta >= 30;
GO
	
-- Calcula o ROI fazendo a comparacao dos gastos com prime vs vendas
CREATE OR ALTER VIEW v_balanco AS 
SELECT 
	(SELECT SUM(preco_prime) FROM contas) as Investimento_Total,
	(SELECT SUM(valor_liquido) FROM vendas_lote) as Retorno_Total,
	(SELECT SUM(valor_liquido) FROM vendas_lote) - (SELECT SUM(preco_prime) FROM contas) as Lucro_Prejuizo;
GO
	
--Contas banidas temp 
CREATE OR ALTER VIEW v_contasbanidas AS
SELECT 
	c.nome_usuario, c.status_conta, h.tipo_ban, h.data_inicio, h.data_fim
FROM contas c
LEFT JOIN historico_status H ON c.id_conta = h.id_conta
WHERE status_conta <> 'Livre';
GO

----------------------------------
-- Bom para conferir se voce nao deixou faltar nada
CREATE OR ALTER TRIGGER trg_VisualizarContas

ON contas

AFTER INSERT

AS

BEGIN

    SELECT * FROM inserted;

END;

GO


-- Atualiza automaticamente assim que voce cadastra a conta no drops
CREATE OR ALTER TRIGGER trg_PegoCaixa

ON drops

AFTER INSERT

AS

BEGIN 

    UPDATE c

    SET c.status_drop_semanal = 'S'

    FROM contas c

    INNER JOIN inserted i ON c.id_conta = i.id_conta;

END;

GO


-- Previne confusao para caso voce tente inserir um drop semanal em uma conta banida 
CREATE OR ALTER TRIGGER trg_ValidarDrop

ON drops

INSTEAD OF INSERT 

AS 

BEGIN 

    IF EXISTS (

        SELECT 1 

        FROM contas c

        INNER JOIN inserted i ON c.id_conta = i.id_conta

        WHERE c.status_conta <> 'Livre'

    )

    BEGIN 

        RAISERROR('ERRO: Você está tentando registrar um drop em uma conta BANIDA!', 16, 1);

    END

    ELSE

    BEGIN 

        INSERT INTO drops (id_conta, caixa_nome, item_nome, data_drop)

        SELECT id_conta, caixa_nome, item_nome, data_drop FROM inserted;

    END

END;

GO


-- Registra automaticamente o período de banimento no histórico
CREATE OR ALTER TRIGGER trg_LogBanimento

ON contas

AFTER UPDATE

AS BEGIN

    IF UPDATE(status_conta)

    BEGIN

        INSERT INTO historico_status(id_conta, tipo_ban, data_inicio, data_fim)

        SELECT 

            i.id_conta,

            i.status_conta,

            GETDATE(),

            CASE

                WHEN i.status_conta = '1D' THEN DATEADD(day, 1, GETDATE())

                WHEN i.status_conta = '7D' THEN DATEADD(day, 7, GETDATE())

                WHEN i.status_conta = '30D' THEN DATEADD(day, 30, GETDATE())

                WHEN i.status_conta = '365D' THEN DATEADD(day, 365, GETDATE())

            END

        FROM inserted i

        WHERE i.status_conta <> 'Livre';

    END

END;

GO


-----------------------------------------------------

CREATE OR ALTER PROCEDURE p_RedefinirDrop 

AS

BEGIN

    UPDATE contas 

    SET status_drop_semanal = 'N';

    

    PRINT 'Status de todas as contas resetado para N.';

END;
GO
	
CREATE PROCEDURE p_atualizar_level_xp
	@nomeconta varchar(50),
	@level int,
	@xp int
AS
BEGIN
	UPDATE contas
	SET level_conta = @level,
		xp_atual = @xp
	WHERE nome_usuario = @nomeconta
END;

CREATE PROCEDURE p_insert_drop
    @nomeconta VARCHAR(60),
    @caixa_nome VARCHAR(60),
    @item_nome VARCHAR(60),
    @dia DATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO drops (id_conta, caixa_nome, item_nome, data_drop)
    SELECT id_conta, @caixa_nome, @item_nome, @dia
    FROM contas
    WHERE nome_usuario = @nomeconta;


END;
GO
