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
