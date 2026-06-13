INSERT INTO jogadores (nickname, nome_completo, pais, data_nasc, elo) VALUES
('FalleN', 'Gabriel Toledo', 'Brasil', '1991-05-30', 'Global Elite'),
('NiKo', 'Nikola Kovač', 'Bósnia', '1997-02-16', 'Global Elite'),
('s1mple', 'Oleksandr Kostyliev', 'Ucrânia', '1997-10-02', 'Global Elite'),
('ZywOo', 'Mathieu Herbaut', 'França', '2000-11-09', 'Global Elite'),
('KSCERATO', 'Kaike Cerato', 'Brasil', '1999-03-11', 'Global Elite'),
('dev1ce', 'Nicolai Reedtz', 'Dinamarca', '1995-09-08', 'Global Elite'),
('coldzera', 'Marcelo David', 'Brasil', '1994-10-31', 'Global Elite'),
('ropz', 'Robin Kool', 'Estônia', '1999-12-22', 'Global Elite'),
('m0NESY', 'Ilya Osipov', 'Rússia', '2005-05-01', 'Global Elite'),
('Exit', 'Rafael Lacerda', 'Brasil', '1999-10-12', 'Global Elite');

INSERT INTO times (nome_time, sigla, pais_sede, ano_fundacao, premio_total) VALUES
('FURIA Esports', 'FURIA', 'Brasil', 2017, 1500000.00),
('Natus Vincere', 'NAVI', 'Ucrânia', 2009, 12500000.00),
('G2 Esports', 'G2', 'Espanha', 2015, 8500000.00),
('Team Vitality', 'VIT', 'França', 2016, 7200000.00),
('FaZe Clan', 'FAZE', 'EUA', 2010, 18900000.00);

INSERT INTO torneios (nome_torneio, jogo, data_inicio, data_fim, premio_total, localizacao) VALUES
('IEM Katowice 2024', 'CS2', '2024-01-31', '2024-02-11', 1000000.00, 'Katowice, Polônia'),
('PGL Major Copenhagen 2024', 'CS2', '2024-03-17', '2024-03-31', 1250000.00, 'Copenhagen, Dinamarca'),
('ESL Pro League Season 19', 'CS2', '2024-04-23', '2024-05-12', 850000.00, 'Malta'),
('BLAST Premier Spring Final', 'CS2', '2024-06-12', '2024-06-16', 500000.00, 'Londres, Inglaterra'),
('IEM Cologne 2024', 'CS2', '2024-07-15', '2024-07-21', 1000000.00, 'Cologne, Alemanha');

INSERT INTO participacoes (id_jogador, id_time, id_torneio, kills, deaths, assists, colocacao, premio_ganho) VALUES
-- IEM Katowice 2024
(3, 2, 1, 125, 98, 45, 1, 400000.00),  -- s1mple (NAVI) campeão
(1, 1, 1, 98, 85, 32, 5, 45000.00),   -- FalleN (FURIA)
(2, 3, 1, 112, 90, 38, 3, 150000.00), -- NiKo (G2)
(4, 4, 1, 105, 82, 40, 2, 250000.00), -- ZywOo (Vitality)

-- PGL Major Copenhagen
(1, 1, 2, 118, 88, 42, 2, 250000.00),  -- FalleN (FURIA) vice
(3, 2, 2, 145, 95, 50, 1, 500000.00),  -- s1mple (NAVI) campeão
(5, 1, 2, 108, 85, 38, 2, 250000.00),  -- KSCERATO (FURIA)
(6, 5, 2, 92, 80, 30, 8, 20000.00),    -- dev1ce (FaZe)

-- ESL Pro League S19
(1, 1, 3, 95, 78, 35, 4, 80000.00),    -- FalleN (FURIA)
(7, 1, 3, 88, 75, 32, 4, 80000.00),    -- coldzera (FURIA)
(2, 3, 3, 120, 85, 42, 1, 200000.00),  -- NiKo (G2) campeão
(8, 5, 3, 102, 80, 38, 3, 100000.00),  -- ropz (FaZe)

-- BLAST Premier Spring
(1, 1, 4, 85, 70, 30, 3, 75000.00),    -- FalleN (FURIA)
(4, 4, 4, 115, 75, 42, 1, 200000.00),  -- ZywOo (Vitality) campeão
(9, 2, 4, 78, 68, 28, 2, 100000.00),   -- m0NESY (NAVI)

-- IEM Cologne 2024
(1, 1, 5, 120, 85, 42, 2, 250000.00),   -- FalleN (FURIA)
(3, 2, 5, 150, 92, 52, 1, 500000.00),   -- s1mple (NAVI) campeão
(10, 1, 5, 88, 75, 32, 2, 250000.00),   -- Exit (FURIA)
(5, 1, 5, 105, 80, 38, 2, 250000.00);   -- KSCERATO (FURIA)
