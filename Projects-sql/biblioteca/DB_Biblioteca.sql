USE [master]
GO
/****** Object:  Database [Biblioteca2]    Script Date: 29/04/2026 22:59:04 ******/
CREATE DATABASE [Biblioteca2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Biblioteca2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\Biblioteca2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Biblioteca2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\Biblioteca2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Biblioteca2] SET COMPATIBILITY_LEVEL = 170
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Biblioteca2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Biblioteca2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Biblioteca2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Biblioteca2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Biblioteca2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Biblioteca2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Biblioteca2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Biblioteca2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Biblioteca2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Biblioteca2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Biblioteca2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Biblioteca2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Biblioteca2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Biblioteca2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Biblioteca2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Biblioteca2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Biblioteca2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Biblioteca2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Biblioteca2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Biblioteca2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Biblioteca2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Biblioteca2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Biblioteca2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Biblioteca2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Biblioteca2] SET  MULTI_USER 
GO
ALTER DATABASE [Biblioteca2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Biblioteca2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Biblioteca2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Biblioteca2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Biblioteca2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Biblioteca2] SET OPTIMIZED_LOCKING = OFF 
GO
ALTER DATABASE [Biblioteca2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Biblioteca2] SET QUERY_STORE = ON
GO
ALTER DATABASE [Biblioteca2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Biblioteca2]
GO
/****** Object:  Table [dbo].[assunto]    Script Date: 29/04/2026 22:59:04 ******/
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
/****** Object:  Table [dbo].[autor]    Script Date: 29/04/2026 22:59:05 ******/
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
/****** Object:  Table [dbo].[cliente]    Script Date: 29/04/2026 22:59:05 ******/
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
/****** Object:  Table [dbo].[departamento]    Script Date: 29/04/2026 22:59:05 ******/
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
/****** Object:  Table [dbo].[editora]    Script Date: 29/04/2026 22:59:05 ******/
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
/****** Object:  Table [dbo].[endereco_cliente]    Script Date: 29/04/2026 22:59:05 ******/
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
/****** Object:  Table [dbo].[forma_pgto]    Script Date: 29/04/2026 22:59:05 ******/
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
/****** Object:  Table [dbo].[funcionario]    Script Date: 29/04/2026 22:59:05 ******/
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
	[rua] [varchar](100) NOT NULL,
	[numero] [varchar](10) NOT NULL,
	[complemento] [varchar](50) NULL,
	[bairro] [varchar](50) NOT NULL,
	[cidade] [varchar](50) NOT NULL,
	[estado] [char](2) NOT NULL,
	[cep] [char](8) NOT NULL,
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
/****** Object:  Table [dbo].[item_venda]    Script Date: 29/04/2026 22:59:05 ******/
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
/****** Object:  Table [dbo].[livro]    Script Date: 29/04/2026 22:59:05 ******/
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
/****** Object:  Table [dbo].[livro_autor]    Script Date: 29/04/2026 22:59:05 ******/
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
/****** Object:  Table [dbo].[pagamento_func]    Script Date: 29/04/2026 22:59:05 ******/
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
/****** Object:  Table [dbo].[venda]    Script Date: 29/04/2026 22:59:05 ******/
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
ALTER TABLE [dbo].[pagamento_func] ADD  DEFAULT (getdate()) FOR [dia_pgto]
GO
ALTER TABLE [dbo].[pagamento_func] ADD  DEFAULT ('Pendente') FOR [status_pgto]
GO
ALTER TABLE [dbo].[venda] ADD  DEFAULT (getdate()) FOR [data_venda]
GO
ALTER TABLE [dbo].[venda] ADD  DEFAULT ('Pendente') FOR [status_venda]
GO
ALTER TABLE [dbo].[endereco_cliente]  WITH CHECK ADD  CONSTRAINT [fk_enderecocliente_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[endereco_cliente] CHECK CONSTRAINT [fk_enderecocliente_cliente]
GO
ALTER TABLE [dbo].[funcionario]  WITH CHECK ADD  CONSTRAINT [fk_funcionario_departamento] FOREIGN KEY([id_departamento])
REFERENCES [dbo].[departamento] ([id_departamento])
GO
ALTER TABLE [dbo].[funcionario] CHECK CONSTRAINT [fk_funcionario_departamento]
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
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD CHECK  ((len([cpfcliente])=(11)))
GO
ALTER TABLE [dbo].[forma_pgto]  WITH CHECK ADD CHECK  (([forma_pgto]='Cartao de Debito' OR [forma_pgto]='Cartao de Credito' OR [forma_pgto]='Dinheiro' OR [forma_pgto]='Pix'))
GO
ALTER TABLE [dbo].[funcionario]  WITH CHECK ADD CHECK  ((len([cpffunc])=(11)))
GO
ALTER TABLE [dbo].[funcionario]  WITH CHECK ADD CHECK  (([salario]>=(0)))
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
ALTER TABLE [dbo].[pagamento_func]  WITH CHECK ADD CHECK  (([status_pgto]='Atrasado' OR [status_pgto]='Cancelado' OR [status_pgto]='Pago' OR [status_pgto]='Pendente'))
GO
ALTER TABLE [dbo].[venda]  WITH CHECK ADD CHECK  (([status_venda]='Pendente' OR [status_venda]='Concluida' OR [status_venda]='Cancelada'))
GO
USE [master]
GO
ALTER DATABASE [Biblioteca2] SET  READ_WRITE 
GO
