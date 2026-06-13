CREATE VIEW v_AlunosAtivos AS
SELECT A.NomeAluno, P.NomePlano, M.data_fim
FROM aluno A
JOIN matricula M ON A.id_aluno = M.id_aluno
JOIN planoAluno P ON M.id_plano = P.id_plano
WHERE M.status = 'Ativa';

--------------------------

CREATE View v_AlunosInadimplentes AS
SELECT 
	A.NomeAluno,
	A.Telefone_Aluno,
	M.data_inicio as Inicio_Matricula,
	P.NomePlano
FROM Aluno A
inner join matricula M ON A.id_aluno = M.id_aluno
inner join planoAluno P ON M.id_plano = P.id_plano
left join pagamento PG ON M.id_matricula = PG.id_matricula
WHERE PG.id_pagamento IS NULL 
AND M.status ='Ativa';

CREATE VIEW v_SalarioPagoFunc AS
SELECT 
		F.NomeFuncionario,
		F.salario AS Salario_Base,
		PF.bonus_comissao AS Bonus,
		(F.salario + PF.bonus_comissao) AS Total_Recebido,
		PF.date_pagamento AS Dia_Pagamento,
		PF.mes_referencia AS Mes_Referente
FROM funcionario F
JOIN pagamentoFuncionario PF ON F.id_funcionario = PF.id_funcionario;

--------------------------

CREATE VIEW v_InvestimentoAparelhos AS
SELECT 
    SUM(a.valor) AS Gasto_Compra,
    ISNULL(SUM(m.total_manutencao), 0) AS Gasto_Manutencao,
    SUM(a.valor) + ISNULL(SUM(m.total_manutencao), 0) AS Investimento_Total
FROM aparelho a
LEFT JOIN (
    SELECT id_aparelho, SUM(custo_reparo) AS total_manutencao 
    FROM manutencaoAparelho 
    GROUP BY id_aparelho
) m ON a.id_aparelho = m.id_aparelho;

--------------------------

CREATE VIEW v_FaturamentoAlunos AS
SELECT 
    SUM(valor_pago) AS Arrecadacao_Total
FROM pagamento;
GO

--------------------------

CREATE VIEW v_AnaliseAcademia AS 
SELECT 
	INV.Investimento_Total,
	FAT.Arrecadacao_Total,
	(FAT.Arrecadacao_Total - INV.Investimento_TOTAL) AS Saldo_Atual
FROM v_InvestimentoAparelhos INV, v_FaturamentoAlunos FAT;

