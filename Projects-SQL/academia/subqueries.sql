-- Lista aparelhos que nunca geraram custo de reparo.
SELECT nomeAparelho, marcaAparelho 
FROM aparelho a
WHERE NOT EXISTS (
    SELECT 1 
    FROM manutencaoAparelho m 
    WHERE m.id_aparelho = a.id_aparelho
);

-- Lista os alunos que possuem uma quantidade de treinos cadastrados acima da média da academia.
SELECT NomeAluno 
FROM aluno 
WHERE id_aluno IN (
    SELECT id_aluno 
    FROM treino 
    GROUP BY id_aluno 
    HAVING COUNT(id_treino) > (
        SELECT AVG(TotalTreinos) 
        FROM (SELECT COUNT(id_treino) AS TotalTreinos FROM treino GROUP BY id_aluno) AS Sub
    )
);

-- Busca o nome do aluno que realizou a entrada mais recente na academia.
SELECT NomeAluno 
FROM aluno 
WHERE id_aluno = (
    SELECT TOP 1 id_aluno 
    FROM presenca 
    ORDER BY data_entrada DESC
);

-- Busca alunos com contrato vencendo em breve e que não possuem matrículas futuras
SELECT NomeAluno, Telefone_Aluno, M.data_fim
FROM aluno A
INNER JOIN matricula M ON A.id_aluno = M.id_aluno
WHERE M.data_fim <= DATEADD(day, 30, GETDATE())
AND M.status = 'Ativa'
AND A.id_aluno NOT IN (
    SELECT id_aluno FROM matricula WHERE data_inicio > M.data_fim
);

-- Aparelhos onde o total gasto em consertos já passou de 30% do valor de compra
SELECT nomeAparelho, valor, 
    (SELECT SUM(custo_reparo) FROM manutencaoAparelho WHERE id_aparelho = a.id_aparelho) AS Gasto_Total
FROM aparelho a
WHERE (
    SELECT SUM(custo_reparo) 
    FROM manutencaoAparelho 
    WHERE id_aparelho = a.id_aparelho
) > (a.valor * 0.30);

-- Alunos ativos que não registram presença há mais de 15 dias
SELECT NomeAluno, Email_Aluno
FROM aluno
WHERE id_aluno IN (
    SELECT id_aluno FROM matricula WHERE status = 'Ativa'
)
AND id_aluno NOT IN (
    SELECT id_aluno FROM presenca WHERE data_entrada > DATEADD(day, -15, GETDATE())
);
