-- NÍVEL 1 - BÁSICO (WHERE com =, >, IN)

-- 1. Jogador mais velho
SELECT * FROM jogadores
WHERE data_nasc = (
    SELECT MIN(data_nasc) FROM jogadores
);

-- 2. Jogador mais novo
SELECT * FROM jogadores
WHERE data_nasc = (
    SELECT MAX(data_nasc) FROM jogadores
);

-- 3. Jogadores nascidos depois de 1995
SELECT * FROM jogadores
WHERE data_nasc > '1995-12-31';

-- 4. Torneios que aconteceram depois do IEM Katowice 2024
SELECT * FROM torneios
WHERE data_inicio > (
    SELECT data_inicio 
    FROM torneios 
    WHERE nome_torneio = 'IEM Katowice 2024'
);

-- 5. Torneios com prêmio acima da média
SELECT * FROM torneios
WHERE premio_total > (
    SELECT AVG(premio_total) FROM torneios
);

-- 6. Jogadores que participaram de torneios com prêmio > 800k
SELECT DISTINCT nickname
FROM participacoes p
JOIN jogadores j ON p.id_jogador = j.id_jogador
WHERE p.id_torneio IN (
    SELECT id_torneio FROM torneios WHERE premio_total > 800000
);

-- INTERMEDIÁRIO (HAVING + AGREGAÇÃO)

-- 7. Jogadores com kills acima da média de TODOS
SELECT 
    j.nickname, 
    SUM(p.kills) AS total_kills
FROM jogadores j
JOIN participacoes p ON j.id_jogador = p.id_jogador
GROUP BY j.id_jogador, j.nickname
HAVING SUM(p.kills) > (
    SELECT AVG(kills) FROM participacoes
);

-- 8. Jogadores com kills acima da média do FalleN (id=1)
SELECT
    j.nickname,
    SUM(p.kills) AS total_kills
FROM jogadores j
JOIN participacoes p ON j.id_jogador = p.id_jogador 
GROUP BY j.id_jogador, j.nickname
HAVING SUM(p.kills) > (
    SELECT AVG(kills)
    FROM participacoes 
    WHERE id_jogador = 1
);

-- 9. Jogadores que ganharam mais prêmio que a média do time FURIA
SELECT 
    j.nickname,
    SUM(p.premio_ganho) AS premio_total
FROM jogadores j
JOIN participacoes p ON j.id_jogador = p.id_jogador
GROUP BY j.id_jogador, j.nickname
HAVING SUM(p.premio_ganho) > (
    SELECT AVG(premio_ganho)
    FROM participacoes
    WHERE id_time = (
        SELECT id_time
        FROM times
        WHERE nome_time = 'FURIA Esports'
    )
);

-- 10. Jogadores com kills acima da média do time NAVI (id_time = 2)
SELECT
    j.nickname,
    SUM(p.kills) AS total_kills
FROM jogadores j
JOIN participacoes p ON j.id_jogador = p.id_jogador
GROUP BY j.id_jogador, j.nickname
HAVING SUM(p.kills) > (
    SELECT AVG(kills)
    FROM participacoes
    WHERE id_time = 2
);

-- 11. Jogadores com participações acima da média
SELECT 
    j.nickname,
    COUNT(p.id_participacao) AS total_participacao
FROM jogadores j
JOIN participacoes p ON j.id_jogador = p.id_jogador
GROUP BY j.id_jogador, j.nickname
HAVING COUNT(p.id_participacao) > (
    SELECT AVG(total) 
    FROM (
        SELECT COUNT(id_participacao) AS total
        FROM participacoes
        GROUP BY id_jogador
    ) AS media_participacao
);

-- AVANÇADO (SUBQUERY NO SELECT E FROM)

-- 12. Jogadores com total de torneios e máximo global
SELECT 
    j.nickname,
    COUNT(p.id_torneio) AS torneios_jogados,
    (SELECT MAX(torneios) FROM (
        SELECT COUNT(id_torneio) AS torneios
        FROM participacoes
        GROUP BY id_jogador
    ) AS sub) AS max_torneios_no_db
FROM jogadores j
JOIN participacoes p ON j.id_jogador = p.id_jogador
GROUP BY j.id_jogador, j.nickname;

-- 13. Times com mais jogadores que a média
SELECT 
    t.nome_time,
    COUNT(p.id_jogador) AS quantia_jogadores
FROM participacoes p
JOIN times t ON t.id_time = p.id_time
GROUP BY t.id_time, t.nome_time
HAVING COUNT(p.id_jogador) > (
    SELECT AVG(contagem) 
    FROM (
        SELECT COUNT(id_jogador) AS contagem
        FROM participacoes
        GROUP BY id_time
    ) AS subquery
);

-- 14. Jogadores que participaram de MAIS torneios que a média de participações
SELECT 
    j.nickname,
    p.quantia_torn
FROM jogadores j
INNER JOIN (
    SELECT 
        id_jogador,
        COUNT(id_torneio) AS quantia_torn
    FROM participacoes 
    GROUP BY id_jogador 
    HAVING COUNT(id_torneio) > (
        SELECT AVG(quantia_torn)
        FROM (
            SELECT COUNT(id_torneio) AS quantia_torn
            FROM participacoes
            GROUP BY id_jogador
        ) AS subquery
    )
) AS p ON j.id_jogador = p.id_jogador;


-- TOP E PERFORMANCES

-- 15. Melhor participação acima da média (TOP 1)
SELECT TOP 1 * FROM participacoes 
WHERE kills > (
    SELECT AVG(kills) FROM participacoes
)
ORDER BY kills DESC;

-- 16. Performance completa do FalleN (sem arredondamento)
SELECT 
    j.nickname,
    SUM(p.kills) AS total_kills,
    SUM(p.deaths) AS total_deaths,
    AVG(p.colocacao) AS media_colocacao
FROM participacoes p
JOIN jogadores j ON j.id_jogador = p.id_jogador
WHERE j.id_jogador = 1 
GROUP BY j.nickname;

-- 17. Performance do FalleN (com arredondamento e contagem)
SELECT 
    j.nickname,
    COUNT(p.id_participacao) AS participacoes,
    SUM(p.kills) AS total_kills,
    SUM(p.deaths) AS total_deaths,
    ROUND(AVG(p.colocacao), 2) AS media_colocacao
FROM participacoes p
JOIN jogadores j ON j.id_jogador = p.id_jogador
WHERE j.id_jogador = 1
GROUP BY j.nickname;
