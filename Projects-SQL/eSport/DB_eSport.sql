CREATE DATABASE eSports;
GO

USE eSports;
GO

-- 1. Jogadores
CREATE TABLE jogadores (
    id_jogador INT IDENTITY(1,1) PRIMARY KEY,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    nome_completo VARCHAR(100) NOT NULL,
    pais VARCHAR(30) NOT NULL,
    data_nasc DATE NOT NULL,
    elo VARCHAR(20) NOT NULL,
    data_cadastro DATE DEFAULT GETDATE()
);

-- 2. Times
CREATE TABLE times (
    id_time INT IDENTITY(1,1) PRIMARY KEY,
    nome_time VARCHAR(50) NOT NULL UNIQUE,
    sigla VARCHAR(10) NOT NULL,
    pais_sede VARCHAR(30) NOT NULL,
    ano_fundacao INT NOT NULL,
    premio_total DECIMAL(15,2) DEFAULT 0
);

-- 3. Torneios
CREATE TABLE torneios (
    id_torneio INT IDENTITY(1,1) PRIMARY KEY,
    nome_torneio VARCHAR(100) NOT NULL,
    jogo VARCHAR(30) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    premio_total DECIMAL(15,2) NOT NULL,
    localizacao VARCHAR(100)
);

-- 4. Participações (relaciona jogadores, times e torneios)
CREATE TABLE participacoes (
    id_participacao INT IDENTITY(1,1) PRIMARY KEY,
    id_jogador INT FOREIGN KEY REFERENCES jogadores(id_jogador),
    id_time INT FOREIGN KEY REFERENCES times(id_time),
    id_torneio INT FOREIGN KEY REFERENCES torneios(id_torneio),
    kills INT DEFAULT 0,
    deaths INT DEFAULT 0,
    assists INT DEFAULT 0,
    colocacao INT,
    premio_ganho DECIMAL(12,2) DEFAULT 0,
    data_partida DATE DEFAULT GETDATE()
);
