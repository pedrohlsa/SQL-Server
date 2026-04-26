SELECT *FROM v_balanco;

SELECT *FROM v_proximodamedalha 
ORDER BY level_conta DESC, xp_atual DESC;

SELECT *FROM v_faltapegar
ORDER BY xp_atual DESC;

SELECT
	nome_usuario,
	status_conta,
	CONVERT(VARCHAR, data_fim, 103) + ' ' + Convert(VARCHAR, data_fim, 108) AS Data_Liberdade,
	DATEDIFF(hour, GETDATE(), data_fim) / 24 AS Dias,
	DATEDIFF(hour, GETDATE(), data_fim) % 24 AS Horas_Restantes
FROM v_contasbanidas
WHERE data_fim > GETDATE()
ORDER BY data_fim ASC;
