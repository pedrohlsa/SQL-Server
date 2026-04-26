-- Contas que ainda faltam pegar a caixa
CREATE VIEW v_faltapegar AS
SELECT nome_usuario, status_drop_semanal
FROM contas
WHERE status_drop_semanal = 'N' AND status_conta = 'Livre';

-- Contas proximas do level 40
CREATE VIEW v_proximodamedalha AS
SELECT nome_usuario, level_conta, xp_atual 
FROM contas
WHERE level_conta >= 30;

-- ROI
CREATE VIEW v_balanco AS 
SELECT 
	(SELECT SUM(preco_prime) FROM contas) as Investimento_Total,
	(SELECT SUM(valor_liquido) FROM vendas_lote) as Retorno_Total,
	(SELECT SUM(valor_liquido) FROM vendas_lote) - (SELECT SUM(preco_prime) FROM contas) as Lucro_Prejuizo;

-- Contas banidas temp 
CREATE OR ALTER VIEW v_contasbanidas AS
SELECT 
	c.nome_usuario, c.status_conta, h.tipo_ban, h.data_inicio, h.data_fim
FROM contas c
LEFT JOIN historico_status H ON c.id_conta = h.id_conta
WHERE status_conta <> 'Livre';
