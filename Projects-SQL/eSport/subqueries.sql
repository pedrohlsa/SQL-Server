-- 1. Jogadores com mais de 25 anos
SELECT nickname, elo
FROM jogadores
WHERE DATEDIFF(YEAR, data_nasc, GETDATE()) >= 25;

-- 2. Times fundados em 2015 ou depois
SELECT * FROM times
WHERE ano_fundacao >= 2015;

-- 3. Torneios de 2024 com prêmio >= 800k
SELECT * FROM torneios
WHERE data_inicio >= '2024-01-01' 
AND premio_total >= 800000.00;

-- 6. Performance do FalleN (sem arredondamento)
SELECT 
    j.nickname,
    SUM(p.kills) AS total_kills,
    SUM(p.deaths) AS total_deaths,
    AVG(p.colocacao) AS media_colocacao
FROM participacoes p
JOIN jogadores j ON j.id_jogador = p.id_jogador
WHERE j.id_jogador = 1 
GROUP BY j.nickname;

-- 7. Performance do FalleN (com arredondamento e contagem)
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
