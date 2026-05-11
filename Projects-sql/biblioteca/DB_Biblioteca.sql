USE [master]
GO
/****** Objeto:  Database [Biblioteca]    Data do Script: 11/05/2026 11:26:48 ******/
CREATE DATABASE [Biblioteca]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Biblioteca', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\Biblioteca.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Biblioteca_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\Biblioteca_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Biblioteca] SET COMPATIBILITY_LEVEL = 170
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Biblioteca].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Biblioteca] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Biblioteca] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Biblioteca] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Biblioteca] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Biblioteca] SET ARITHABORT OFF 
GO
ALTER DATABASE [Biblioteca] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Biblioteca] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Biblioteca] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Biblioteca] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Biblioteca] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Biblioteca] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Biblioteca] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Biblioteca] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Biblioteca] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Biblioteca] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Biblioteca] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Biblioteca] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Biblioteca] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Biblioteca] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Biblioteca] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Biblioteca] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Biblioteca] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Biblioteca] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Biblioteca] SET  MULTI_USER 
GO
ALTER DATABASE [Biblioteca] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Biblioteca] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Biblioteca] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Biblioteca] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Biblioteca] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Biblioteca] SET OPTIMIZED_LOCKING = OFF 
GO
ALTER DATABASE [Biblioteca] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Biblioteca] SET QUERY_STORE = ON
GO
ALTER DATABASE [Biblioteca] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Biblioteca]
GO
/****** Objeto:  Table [dbo].[compra]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compra](
	[id_compra] [int] IDENTITY(1,1) NOT NULL,
	[id_livro] [int] NOT NULL,
	[id_fornecedor] [int] NOT NULL,
	[quantia] [int] NOT NULL,
	[preco_unitario] [decimal](10, 2) NOT NULL,
	[data_compra] [datetime] NULL,
	[id_funcionario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[item_venda]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[item_venda](
	[id_itemvenda] [int] IDENTITY(1,1) NOT NULL,
	[id_venda] [int] NULL,
	[id_livro] [int] NULL,
	[preco_pago_unitario] [decimal](10, 2) NOT NULL,
	[quantia] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_itemvenda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[livro]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[livro](
	[id_livro] [int] IDENTITY(1,1) NOT NULL,
	[nomelivro] [varchar](150) NOT NULL,
	[ISBN13] [char](13) NOT NULL,
	[estoque] [int] NOT NULL,
	[paginas] [smallint] NOT NULL,
	[idioma] [varchar](30) NOT NULL,
	[edicao] [varchar](50) NOT NULL,
	[data_lanc] [date] NOT NULL,
	[preco] [decimal](10, 2) NULL,
	[sinopse] [varchar](max) NOT NULL,
	[id_editora] [int] NULL,
	[id_assunto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_livro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ISBN13] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[venda]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venda](
	[id_venda] [int] IDENTITY(1,1) NOT NULL,
	[id_formapgto] [int] NULL,
	[id_funcionario] [int] NULL,
	[id_cliente] [int] NULL,
	[data_venda] [datetime] NULL,
	[status_venda] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_venda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  View [dbo].[v_faturamento_unitario]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--View de Faturamento Unitário
CREATE   VIEW [dbo].[v_faturamento_unitario] AS
    SELECT DISTINCT --evitar duplicatas 
        iv.id_livro,
        l.nomelivro,
        iv.preco_pago_unitario AS preco_venda, 
        c.preco_unitario AS preco_custo
    FROM item_venda iv
    JOIN compra c ON iv.id_livro = c.id_livro
    JOIN venda v ON iv.id_venda = v.id_venda
    JOIN livro l ON iv.id_livro = l.id_livro
    WHERE v.status_venda = 'Concluida';
GO
/****** Objeto:  Table [dbo].[alugar_livro]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[alugar_livro](
	[id_alugarlivro] [int] IDENTITY(1,1) NOT NULL,
	[id_livro] [int] NULL,
	[id_cliente] [int] NULL,
	[data_devolucao] [date] NULL,
	[valor_aluguel] [decimal](10, 2) NULL,
	[data_emprestimo] [date] NULL,
	[livro_devolvido] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_alugarlivro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[pagamento_func]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pagamento_func](
	[id_pagamento] [int] IDENTITY(1,1) NOT NULL,
	[id_formapgto] [int] NULL,
	[id_funcionario] [int] NULL,
	[mes_referente] [datetime] NOT NULL,
	[valor_pago] [decimal](10, 2) NOT NULL,
	[dia_pgto] [datetime] NOT NULL,
	[prox_pgto] [date] NOT NULL,
	[status_pgto] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pagamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[manutencao_gastos]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manutencao_gastos](
	[id_gasto] [int] IDENTITY(1,1) NOT NULL,
	[id_chamado] [int] NULL,
	[descricao_item] [varchar](80) NULL,
	[valor_gasto] [decimal](10, 2) NULL,
	[data_pagamento] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_gasto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  View [dbo].[v_faturamentoliquido]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--View de Faturamento Líquido 
CREATE   VIEW [dbo].[v_faturamentoliquido] AS 
SELECT 
    -- Total Entradas
    (SELECT ISNULL(SUM(iv.quantia * iv.preco_pago_unitario), 0) FROM item_venda iv
     JOIN venda v ON iv.id_venda = v.id_venda WHERE v.status_venda = 'Concluida')
    +
    (SELECT ISNULL(SUM(valor_aluguel), 0) FROM alugar_livro WHERE livro_devolvido = 'S')
    AS total_entradas,

    -- Total Saídas
    (SELECT ISNULL(SUM(quantia * preco_unitario), 0) FROM compra)
    +
    (SELECT ISNULL(SUM(valor_pago), 0) FROM pagamento_func)
    +
    (SELECT ISNULL(SUM(valor_gasto), 0) FROM manutencao_gastos)
    AS total_saidas,

    -- Lucro Real
    (
        (SELECT ISNULL(SUM(iv.quantia * iv.preco_pago_unitario), 0) FROM item_venda iv
         JOIN venda v ON iv.id_venda = v.id_venda WHERE v.status_venda = 'Concluida') +
        (SELECT ISNULL(SUM(valor_aluguel), 0) FROM alugar_livro WHERE livro_devolvido = 'S')
    ) - (
        (SELECT ISNULL(SUM(quantia * preco_unitario), 0) FROM compra) +
        (SELECT ISNULL(SUM(valor_pago), 0) FROM pagamento_func) +
        (SELECT ISNULL(SUM(valor_gasto), 0) FROM manutencao_gastos)
    ) AS lucro_real;
GO
/****** Objeto:  Table [dbo].[fornecedor]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fornecedor](
	[id_fornecedor] [int] IDENTITY(1,1) NOT NULL,
	[CNPJ] [varchar](18) NOT NULL,
	[nome_fantasia] [varchar](100) NOT NULL,
	[razao_social] [varchar](100) NULL,
	[limite_credito] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_fornecedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CNPJ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[info_fornecedor]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[info_fornecedor](
	[id_endfornecedor] [int] IDENTITY(1,1) NOT NULL,
	[id_fornecedor] [int] NOT NULL,
	[rua] [varchar](100) NOT NULL,
	[numero] [varchar](10) NULL,
	[complemento] [varchar](50) NULL,
	[bairro] [varchar](50) NULL,
	[cidade] [varchar](50) NULL,
	[estado] [char](2) NULL,
	[cep] [char](8) NOT NULL,
	[telefone] [varchar](15) NOT NULL,
	[email] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_endfornecedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[editora]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[editora](
	[id_editora] [int] IDENTITY(1,1) NOT NULL,
	[nomeeditora] [varchar](300) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_editora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[forn_livro]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[forn_livro](
	[id_fornecedor] [int] NOT NULL,
	[id_livro] [int] NOT NULL,
	[preco_custo] [decimal](10, 2) NULL,
	[prazo_entrega_dias] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_fornecedor] ASC,
	[id_livro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  View [dbo].[v_estoquebaixo]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[v_estoquebaixo] AS 
    SELECT 
        l.id_livro, 
        l.nomelivro, 
        l.estoque,
        e.nomeeditora,
        fl.id_fornecedor,
        f.nome_fantasia,
        inf.telefone
    FROM livro l
    JOIN editora e on l.id_editora = e.id_editora
    JOIN forn_livro fl on l.id_livro = fl.id_livro
    JOIN fornecedor f on fl.id_fornecedor = f.id_fornecedor
    LEFT JOIN info_fornecedor inf on fl.id_fornecedor = inf.id_fornecedor
    WHERE estoque <= 10;
GO
/****** Objeto:  Table [dbo].[cliente]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nomecliente] [varchar](50) NOT NULL,
	[sobrenomecliente] [varchar](150) NOT NULL,
	[cpfcliente] [char](11) NOT NULL,
	[data_nasc] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[cpfcliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  View [dbo].[v_alugueis_pendentes]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_alugueis_pendentes] AS
    SELECT
        c.id_cliente,
        c.nomecliente,
        l.id_livro,
        l.nomelivro,
        a.data_emprestimo
        FROM alugar_livro a
        INNER JOIN cliente c ON a.id_cliente = c.id_cliente
        INNER JOIN livro l ON a.id_livro = l.id_livro
        WHERE a.livro_devolvido = 'N' AND a.data_emprestimo < DATEADD(day, -7, GETDATE());
GO
/****** Objeto:  Table [dbo].[assunto]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assunto](
	[id_assunto] [int] IDENTITY(1,1) NOT NULL,
	[nomeAssunto] [varchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_assunto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[autor]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[autor](
	[id_autor] [int] IDENTITY(1,1) NOT NULL,
	[nomeautor] [varchar](100) NOT NULL,
	[sobrenomeautor] [varchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_autor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[livro_autor]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[livro_autor](
	[id_livroautor] [int] IDENTITY(1,1) NOT NULL,
	[id_livro] [int] NULL,
	[id_autor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_livroautor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  View [dbo].[v_vitrine_livros]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[v_vitrine_livros] AS
    SELECT 
        l.nomelivro,
        CONCAT(a.nomeautor, ' ', a.sobrenomeautor) AS nome_autor,
        ass.nomeAssunto,
        l.preco,
        l.sinopse
    FROM livro l
    INNER JOIN assunto ass ON l.id_assunto = ass.id_assunto
    INNER JOIN livro_autor au ON l.id_livro = au.id_livro
    INNER JOIN autor a on a.id_autor = au.id_autor;
GO
/****** Objeto:  Table [dbo].[funcionario]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[funcionario](
	[id_funcionario] [int] IDENTITY(1,1) NOT NULL,
	[id_departamento] [int] NULL,
	[nomefunc] [varchar](30) NOT NULL,
	[sobrenomefunc] [varchar](120) NOT NULL,
	[cpffunc] [char](11) NOT NULL,
	[data_nasc] [date] NOT NULL,
	[salario] [decimal](10, 2) NOT NULL,
	[data_contratacao] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_funcionario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[cpffunc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  View [dbo].[v_rankingvendas_semana]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[v_rankingvendas_semana] AS
    SELECT
        f.id_funcionario,
        CONCAT(f.nomefunc, ' ', f.sobrenomefunc) as nome_funcionario,
        COUNT(v.id_venda) as total_vendas
    FROM funcionario f
    INNER JOIN venda v on f.id_funcionario = v.id_funcionario
    WHERE v.data_venda >= DATEADD(day, -7, GETDATE())
    GROUP BY f.id_funcionario, f.nomefunc, f.sobrenomefunc;
GO
/****** Objeto:  View [dbo].[v_rankingvendas_mensal]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[v_rankingvendas_mensal] AS
    SELECT
        f.id_funcionario,
        CONCAT(f.nomefunc, ' ', f.sobrenomefunc) as nome_funcionario,
        COUNT(v.id_venda) as total_vendas
    FROM funcionario f
    INNER JOIN venda v on f.id_funcionario = v.id_funcionario
    WHERE v.data_venda >= DATEADD(day, -30, GETDATE())
    GROUP BY f.id_funcionario, f.nomefunc, f.sobrenomefunc;
GO
/****** Objeto:  View [dbo].[v_alugueis_pendetes]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[v_alugueis_pendetes] AS
    SELECT
        c.id_cliente,
        c.nomecliente,
        l.id_livro,
        l.nomelivro,
        a.data_emprestimo 
    FROM alugar_livro a
    INNER JOIN cliente c ON a.id_cliente = c.id_cliente
    INNER JOIN livro l ON a.id_livro = l.id_livro
    WHERE a.livro_devolvido = 'N' AND a.data_emprestimo < DATEADD(day, -7, GETDATE()); 
GO
/****** Objeto:  View [dbo].[v_faturamentovendas_mensal]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[v_faturamentovendas_mensal] AS
SELECT 
    -- Vendas dos últimos 30 dias
    (SELECT ISNULL(SUM(iv.preco_pago_unitario * iv.quantia), 0) 
     FROM item_venda iv 
     JOIN venda v ON iv.id_venda = v.id_venda
     WHERE v.status_venda = 'Concluida' 
       AND v.data_venda >= DATEADD(day, -30, GETDATE())) AS venda_mensal,

    -- Aluguéis dos últimos 30 dias
    (SELECT ISNULL(SUM(al.valor_aluguel), 0)
     FROM alugar_livro al 
     WHERE al.livro_devolvido = 'S' 
       AND al.data_emprestimo >= DATEADD(day, -30, GETDATE())) AS aluguel_mensal,

    -- Total Geral Mensal
    (SELECT ISNULL(SUM(iv.preco_pago_unitario * iv.quantia), 0) 
     FROM item_venda iv 
     JOIN venda v ON iv.id_venda = v.id_venda
     WHERE v.status_venda = 'Concluida' 
       AND v.data_venda >= DATEADD(day, -30, GETDATE()))
    +
    (SELECT ISNULL(SUM(al.valor_aluguel), 0)
     FROM alugar_livro al 
     WHERE al.livro_devolvido = 'S' 
       AND al.data_emprestimo >= DATEADD(day, -30, GETDATE())) AS total_geral_mensal;
GO
/****** Objeto:  View [dbo].[v_faturamentovendas_total]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[v_faturamentovendas_total] AS 
SELECT 

    (SELECT ISNULL(SUM(iv.preco_pago_unitario * iv.quantia), 0) 
     FROM item_venda iv 
     JOIN venda v ON iv.id_venda = v.id_venda 
     WHERE v.status_venda = 'Concluida') AS venda_totais,

    (SELECT ISNULL(SUM(al.valor_aluguel), 0) 
     FROM alugar_livro al 
     WHERE al.livro_devolvido = 'S') AS aluguel_totais,

    (SELECT ISNULL(SUM(iv.preco_pago_unitario * iv.quantia), 0) 
     FROM item_venda iv 
     JOIN venda v ON iv.id_venda = v.id_venda 
     WHERE v.status_venda = 'Concluida') 
    + 
    (SELECT ISNULL(SUM(al.valor_aluguel), 0) 
     FROM alugar_livro al 
     WHERE al.livro_devolvido = 'S') AS total_geral
GO
/****** Objeto:  Table [dbo].[departamento]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departamento](
	[id_departamento] [int] IDENTITY(1,1) NOT NULL,
	[nomedepartamento] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_departamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[endereco_cliente]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[endereco_cliente](
	[id_enderecocliente] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NULL,
	[rua] [varchar](100) NOT NULL,
	[numero] [varchar](10) NOT NULL,
	[complemento] [varchar](50) NULL,
	[bairro] [varchar](50) NOT NULL,
	[cidade] [varchar](50) NOT NULL,
	[estado] [char](2) NOT NULL,
	[cep] [char](8) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_enderecocliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[endereco_funcionario]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[endereco_funcionario](
	[id_enderecofunc] [int] IDENTITY(1,1) NOT NULL,
	[id_funcionario] [int] NULL,
	[rua] [varchar](100) NOT NULL,
	[numero] [smallint] NOT NULL,
	[complemento] [varchar](50) NULL,
	[bairro] [varchar](50) NOT NULL,
	[cidade] [varchar](50) NOT NULL,
	[estado] [char](2) NOT NULL,
	[cep] [char](8) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_enderecofunc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[forma_pgto]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[forma_pgto](
	[id_formapgto] [int] IDENTITY(1,1) NOT NULL,
	[forma_pgto] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_formapgto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[logs]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logs](
	[id_logo] [int] IDENTITY(1,1) NOT NULL,
	[tabela_afestada] [varchar](50) NULL,
	[id_registro] [int] NULL,
	[acao] [varchar](10) NULL,
	[usuario] [varchar](50) NULL,
	[data_evento] [datetime] NULL,
	[valor_antigo] [text] NULL,
	[valor_atual] [text] NULL,
	[valor_novo_secundario] [text] NULL,
	[valor_antigo_secundario] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_logo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[manutencao_chamado]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manutencao_chamado](
	[id_chamado] [int] IDENTITY(1,1) NOT NULL,
	[id_funcionario] [int] NULL,
	[descricao_problema] [varchar](150) NOT NULL,
	[data_relato] [date] NULL,
	[status_resolvido] [char](1) NULL,
	[data_resolucao] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_chamado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[movimentacao_estoque]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movimentacao_estoque](
	[id_movimentacaoestoque] [int] IDENTITY(1,1) NOT NULL,
	[id_funcionario] [int] NULL,
	[id_livro] [int] NULL,
	[data_movimentacao] [datetime] NULL,
	[quantidade] [int] NULL,
	[tipo_movto] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_movimentacaoestoque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[pagamento_parcelas]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pagamento_parcelas](
	[id_pgtoparcelas] [int] IDENTITY(1,1) NOT NULL,
	[id_parcela] [int] NOT NULL,
	[id_formapgto] [int] NOT NULL,
	[valor_pago] [decimal](10, 2) NULL,
	[data_pagamento] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pgtoparcelas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[parcelas_compra]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parcelas_compra](
	[id_parcela] [int] IDENTITY(1,1) NOT NULL,
	[id_compra] [int] NOT NULL,
	[numero_parcela] [tinyint] NOT NULL,
	[valor_parcela] [decimal](10, 2) NOT NULL,
	[data_vencimento] [date] NOT NULL,
	[status_pagamento] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_parcela] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[preco_historico]    Data do Script: 11/05/2026 11:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[preco_historico](
	[id_historico] [int] IDENTITY(1,1) NOT NULL,
	[id_livro] [int] NULL,
	[preco_antigo] [decimal](10, 2) NULL,
	[preco_novo] [decimal](10, 2) NULL,
	[data_alteracao] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_historico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[alugar_livro] ADD  DEFAULT (getdate()) FOR [data_emprestimo]
GO
ALTER TABLE [dbo].[alugar_livro] ADD  DEFAULT ('N') FOR [livro_devolvido]
GO
ALTER TABLE [dbo].[compra] ADD  DEFAULT (getdate()) FOR [data_compra]
GO
ALTER TABLE [dbo].[fornecedor] ADD  DEFAULT ((0.00)) FOR [limite_credito]
GO
ALTER TABLE [dbo].[funcionario] ADD  DEFAULT ((0)) FOR [salario]
GO
ALTER TABLE [dbo].[item_venda] ADD  DEFAULT ((0)) FOR [preco_pago_unitario]
GO
ALTER TABLE [dbo].[item_venda] ADD  DEFAULT ((1)) FOR [quantia]
GO
ALTER TABLE [dbo].[livro] ADD  DEFAULT ((0)) FOR [estoque]
GO
ALTER TABLE [dbo].[livro] ADD  DEFAULT ((0)) FOR [paginas]
GO
ALTER TABLE [dbo].[logs] ADD  DEFAULT (suser_sname()) FOR [usuario]
GO
ALTER TABLE [dbo].[logs] ADD  DEFAULT (getdate()) FOR [data_evento]
GO
ALTER TABLE [dbo].[manutencao_chamado] ADD  DEFAULT (getdate()) FOR [data_relato]
GO
ALTER TABLE [dbo].[manutencao_chamado] ADD  DEFAULT ('N') FOR [status_resolvido]
GO
ALTER TABLE [dbo].[movimentacao_estoque] ADD  DEFAULT (getdate()) FOR [data_movimentacao]
GO
ALTER TABLE [dbo].[pagamento_func] ADD  DEFAULT (getdate()) FOR [dia_pgto]
GO
ALTER TABLE [dbo].[pagamento_func] ADD  DEFAULT ('Pendente') FOR [status_pgto]
GO
ALTER TABLE [dbo].[pagamento_parcelas] ADD  DEFAULT (getdate()) FOR [data_pagamento]
GO
ALTER TABLE [dbo].[parcelas_compra] ADD  DEFAULT ('Pendente') FOR [status_pagamento]
GO
ALTER TABLE [dbo].[preco_historico] ADD  DEFAULT (getdate()) FOR [data_alteracao]
GO
ALTER TABLE [dbo].[venda] ADD  DEFAULT (getdate()) FOR [data_venda]
GO
ALTER TABLE [dbo].[venda] ADD  DEFAULT ('Pendente') FOR [status_venda]
GO
ALTER TABLE [dbo].[alugar_livro]  WITH CHECK ADD  CONSTRAINT [fk_alugarlivro_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[alugar_livro] CHECK CONSTRAINT [fk_alugarlivro_cliente]
GO
ALTER TABLE [dbo].[alugar_livro]  WITH CHECK ADD  CONSTRAINT [fk_alugarlivro_livro] FOREIGN KEY([id_livro])
REFERENCES [dbo].[livro] ([id_livro])
GO
ALTER TABLE [dbo].[alugar_livro] CHECK CONSTRAINT [fk_alugarlivro_livro]
GO
ALTER TABLE [dbo].[compra]  WITH CHECK ADD  CONSTRAINT [fk_compra_fornecedor] FOREIGN KEY([id_fornecedor])
REFERENCES [dbo].[fornecedor] ([id_fornecedor])
GO
ALTER TABLE [dbo].[compra] CHECK CONSTRAINT [fk_compra_fornecedor]
GO
ALTER TABLE [dbo].[compra]  WITH CHECK ADD  CONSTRAINT [fk_compra_funcionario] FOREIGN KEY([id_funcionario])
REFERENCES [dbo].[funcionario] ([id_funcionario])
GO
ALTER TABLE [dbo].[compra] CHECK CONSTRAINT [fk_compra_funcionario]
GO
ALTER TABLE [dbo].[compra]  WITH CHECK ADD  CONSTRAINT [fk_compra_livro] FOREIGN KEY([id_livro])
REFERENCES [dbo].[livro] ([id_livro])
GO
ALTER TABLE [dbo].[compra] CHECK CONSTRAINT [fk_compra_livro]
GO
ALTER TABLE [dbo].[endereco_cliente]  WITH CHECK ADD  CONSTRAINT [fk_enderecocliente_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[endereco_cliente] CHECK CONSTRAINT [fk_enderecocliente_cliente]
GO
ALTER TABLE [dbo].[endereco_funcionario]  WITH CHECK ADD  CONSTRAINT [fk_enderecofuncionario_funcionario] FOREIGN KEY([id_funcionario])
REFERENCES [dbo].[funcionario] ([id_funcionario])
GO
ALTER TABLE [dbo].[endereco_funcionario] CHECK CONSTRAINT [fk_enderecofuncionario_funcionario]
GO
ALTER TABLE [dbo].[forn_livro]  WITH CHECK ADD  CONSTRAINT [fk_fornlivro_forn] FOREIGN KEY([id_fornecedor])
REFERENCES [dbo].[fornecedor] ([id_fornecedor])
GO
ALTER TABLE [dbo].[forn_livro] CHECK CONSTRAINT [fk_fornlivro_forn]
GO
ALTER TABLE [dbo].[forn_livro]  WITH CHECK ADD  CONSTRAINT [fk_fornlivro_livro] FOREIGN KEY([id_livro])
REFERENCES [dbo].[livro] ([id_livro])
GO
ALTER TABLE [dbo].[forn_livro] CHECK CONSTRAINT [fk_fornlivro_livro]
GO
ALTER TABLE [dbo].[funcionario]  WITH CHECK ADD  CONSTRAINT [fk_funcionario_departamento] FOREIGN KEY([id_departamento])
REFERENCES [dbo].[departamento] ([id_departamento])
GO
ALTER TABLE [dbo].[funcionario] CHECK CONSTRAINT [fk_funcionario_departamento]
GO
ALTER TABLE [dbo].[info_fornecedor]  WITH CHECK ADD  CONSTRAINT [fk_info_fornecedor] FOREIGN KEY([id_fornecedor])
REFERENCES [dbo].[fornecedor] ([id_fornecedor])
GO
ALTER TABLE [dbo].[info_fornecedor] CHECK CONSTRAINT [fk_info_fornecedor]
GO
ALTER TABLE [dbo].[item_venda]  WITH CHECK ADD  CONSTRAINT [fk_itemvenda_livro] FOREIGN KEY([id_livro])
REFERENCES [dbo].[livro] ([id_livro])
GO
ALTER TABLE [dbo].[item_venda] CHECK CONSTRAINT [fk_itemvenda_livro]
GO
ALTER TABLE [dbo].[item_venda]  WITH CHECK ADD  CONSTRAINT [fk_itemvenda_venda] FOREIGN KEY([id_venda])
REFERENCES [dbo].[venda] ([id_venda])
GO
ALTER TABLE [dbo].[item_venda] CHECK CONSTRAINT [fk_itemvenda_venda]
GO
ALTER TABLE [dbo].[livro]  WITH CHECK ADD  CONSTRAINT [fk_livro_assunto] FOREIGN KEY([id_assunto])
REFERENCES [dbo].[assunto] ([id_assunto])
GO
ALTER TABLE [dbo].[livro] CHECK CONSTRAINT [fk_livro_assunto]
GO
ALTER TABLE [dbo].[livro]  WITH CHECK ADD  CONSTRAINT [fk_livro_editora] FOREIGN KEY([id_editora])
REFERENCES [dbo].[editora] ([id_editora])
GO
ALTER TABLE [dbo].[livro] CHECK CONSTRAINT [fk_livro_editora]
GO
ALTER TABLE [dbo].[livro_autor]  WITH CHECK ADD  CONSTRAINT [fk_livroautor_autor] FOREIGN KEY([id_autor])
REFERENCES [dbo].[autor] ([id_autor])
GO
ALTER TABLE [dbo].[livro_autor] CHECK CONSTRAINT [fk_livroautor_autor]
GO
ALTER TABLE [dbo].[livro_autor]  WITH CHECK ADD  CONSTRAINT [fk_livroautor_livro] FOREIGN KEY([id_livro])
REFERENCES [dbo].[livro] ([id_livro])
GO
ALTER TABLE [dbo].[livro_autor] CHECK CONSTRAINT [fk_livroautor_livro]
GO
ALTER TABLE [dbo].[manutencao_chamado]  WITH CHECK ADD  CONSTRAINT [fk_manutencaochamado_func] FOREIGN KEY([id_funcionario])
REFERENCES [dbo].[funcionario] ([id_funcionario])
GO
ALTER TABLE [dbo].[manutencao_chamado] CHECK CONSTRAINT [fk_manutencaochamado_func]
GO
ALTER TABLE [dbo].[manutencao_gastos]  WITH CHECK ADD  CONSTRAINT [fk_manuntecaogastos_manchamado] FOREIGN KEY([id_chamado])
REFERENCES [dbo].[manutencao_chamado] ([id_chamado])
GO
ALTER TABLE [dbo].[manutencao_gastos] CHECK CONSTRAINT [fk_manuntecaogastos_manchamado]
GO
ALTER TABLE [dbo].[movimentacao_estoque]  WITH CHECK ADD  CONSTRAINT [fk_movimentacaoestoque_funcionario] FOREIGN KEY([id_funcionario])
REFERENCES [dbo].[funcionario] ([id_funcionario])
GO
ALTER TABLE [dbo].[movimentacao_estoque] CHECK CONSTRAINT [fk_movimentacaoestoque_funcionario]
GO
ALTER TABLE [dbo].[movimentacao_estoque]  WITH CHECK ADD  CONSTRAINT [fk_movimentacaoestoque_livro] FOREIGN KEY([id_livro])
REFERENCES [dbo].[livro] ([id_livro])
GO
ALTER TABLE [dbo].[movimentacao_estoque] CHECK CONSTRAINT [fk_movimentacaoestoque_livro]
GO
ALTER TABLE [dbo].[pagamento_func]  WITH CHECK ADD  CONSTRAINT [fk_pagamentofunc_formapgto] FOREIGN KEY([id_formapgto])
REFERENCES [dbo].[forma_pgto] ([id_formapgto])
GO
ALTER TABLE [dbo].[pagamento_func] CHECK CONSTRAINT [fk_pagamentofunc_formapgto]
GO
ALTER TABLE [dbo].[pagamento_func]  WITH CHECK ADD  CONSTRAINT [fk_pagamentofunc_funcionario] FOREIGN KEY([id_funcionario])
REFERENCES [dbo].[funcionario] ([id_funcionario])
GO
ALTER TABLE [dbo].[pagamento_func] CHECK CONSTRAINT [fk_pagamentofunc_funcionario]
GO
ALTER TABLE [dbo].[pagamento_parcelas]  WITH CHECK ADD  CONSTRAINT [fk_pagamento_forma] FOREIGN KEY([id_formapgto])
REFERENCES [dbo].[forma_pgto] ([id_formapgto])
GO
ALTER TABLE [dbo].[pagamento_parcelas] CHECK CONSTRAINT [fk_pagamento_forma]
GO
ALTER TABLE [dbo].[pagamento_parcelas]  WITH CHECK ADD  CONSTRAINT [fk_pagamento_parcela] FOREIGN KEY([id_parcela])
REFERENCES [dbo].[parcelas_compra] ([id_parcela])
GO
ALTER TABLE [dbo].[pagamento_parcelas] CHECK CONSTRAINT [fk_pagamento_parcela]
GO
ALTER TABLE [dbo].[parcelas_compra]  WITH CHECK ADD  CONSTRAINT [fk_parcelascompra_compra] FOREIGN KEY([id_compra])
REFERENCES [dbo].[compra] ([id_compra])
GO
ALTER TABLE [dbo].[parcelas_compra] CHECK CONSTRAINT [fk_parcelascompra_compra]
GO
ALTER TABLE [dbo].[preco_historico]  WITH CHECK ADD  CONSTRAINT [fk_precohistorico_livro] FOREIGN KEY([id_livro])
REFERENCES [dbo].[livro] ([id_livro])
GO
ALTER TABLE [dbo].[preco_historico] CHECK CONSTRAINT [fk_precohistorico_livro]
GO
ALTER TABLE [dbo].[venda]  WITH CHECK ADD  CONSTRAINT [fk_venda_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[venda] CHECK CONSTRAINT [fk_venda_cliente]
GO
ALTER TABLE [dbo].[venda]  WITH CHECK ADD  CONSTRAINT [fk_venda_formapgto] FOREIGN KEY([id_formapgto])
REFERENCES [dbo].[forma_pgto] ([id_formapgto])
GO
ALTER TABLE [dbo].[venda] CHECK CONSTRAINT [fk_venda_formapgto]
GO
ALTER TABLE [dbo].[venda]  WITH CHECK ADD  CONSTRAINT [fk_venda_funcionario] FOREIGN KEY([id_funcionario])
REFERENCES [dbo].[funcionario] ([id_funcionario])
GO
ALTER TABLE [dbo].[venda] CHECK CONSTRAINT [fk_venda_funcionario]
GO
ALTER TABLE [dbo].[alugar_livro]  WITH CHECK ADD CHECK  (([livro_devolvido]='S' OR [livro_devolvido]='N'))
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD CHECK  ((len([cpfcliente])=(11)))
GO
ALTER TABLE [dbo].[fornecedor]  WITH CHECK ADD CHECK  ((len([CNPJ])=(18)))
GO
ALTER TABLE [dbo].[funcionario]  WITH CHECK ADD CHECK  ((len([cpffunc])=(11)))
GO
ALTER TABLE [dbo].[funcionario]  WITH CHECK ADD CHECK  (([salario]>=(0)))
GO
ALTER TABLE [dbo].[info_fornecedor]  WITH CHECK ADD CHECK  (([email] like '_%@_%._%'))
GO
ALTER TABLE [dbo].[item_venda]  WITH CHECK ADD CHECK  (([preco_pago_unitario]>=(0)))
GO
ALTER TABLE [dbo].[item_venda]  WITH CHECK ADD CHECK  (([quantia]>=(1)))
GO
ALTER TABLE [dbo].[livro]  WITH CHECK ADD CHECK  (([estoque]>=(0)))
GO
ALTER TABLE [dbo].[livro]  WITH CHECK ADD CHECK  ((len([ISBN13])=(13)))
GO
ALTER TABLE [dbo].[livro]  WITH CHECK ADD CHECK  (([paginas]>=(0)))
GO
ALTER TABLE [dbo].[manutencao_chamado]  WITH CHECK ADD CHECK  (([status_resolvido]='N' OR [status_resolvido]='S'))
GO
ALTER TABLE [dbo].[movimentacao_estoque]  WITH CHECK ADD CHECK  (([tipo_movto]='S' OR [tipo_movto]='E'))
GO
ALTER TABLE [dbo].[pagamento_func]  WITH CHECK ADD CHECK  (([status_pgto]='Atrasado' OR [status_pgto]='Cancelado' OR [status_pgto]='Pago' OR [status_pgto]='Pendente'))
GO
ALTER TABLE [dbo].[parcelas_compra]  WITH CHECK ADD CHECK  (([status_pagamento]='Pendente' OR [status_pagamento]='Atrasado' OR [status_pagamento]='Pago'))
GO
ALTER TABLE [dbo].[venda]  WITH CHECK ADD CHECK  (([status_venda]='Pendente' OR [status_venda]='Concluida' OR [status_venda]='Cancelada'))
GO
USE [master]
GO
ALTER DATABASE [Biblioteca] SET  READ_WRITE 
GO
