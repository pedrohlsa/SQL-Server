CREATE DATABASE [Academia];
GO
USE [Academia];
GO
USE [Academia]
GO
/****** Object:  Table [dbo].[Aluno]    Script Date: 18/04/2026 14:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aluno](
	[id_Aluno] [int] IDENTITY(1,1) NOT NULL,
	[nomeAluno] [varchar](150) NOT NULL,
	[cpf_aluno] [varchar](14) NOT NULL,
	[data_nasc] [date] NOT NULL,
	[sexo] [varchar](1) NOT NULL,
	[telefone_Aluno] [varchar](20) NULL,
	[email_Aluno] [varchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Aluno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[cpf_aluno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aparelho]    Script Date: 18/04/2026 14:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aparelho](
	[id_Aparelho] [int] IDENTITY(1,1) NOT NULL,
	[nomeAparelho] [varchar](150) NOT NULL,
	[marcaAparelho] [varchar](150) NOT NULL,
	[valor] [decimal](10, 2) NOT NULL,
	[status_Aparelho] [varchar](20) NULL,
	[datacompra_Aparelho] [date] NULL,
	[datavenda_Aparelho] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Aparelho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cargo]    Script Date: 18/04/2026 14:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargo](
	[id_Cargo] [int] IDENTITY(1,1) NOT NULL,
	[nomeCargo] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Cargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exercicio]    Script Date: 18/04/2026 14:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exercicio](
	[id_Exercicio] [int] IDENTITY(1,1) NOT NULL,
	[nomeExercicio] [varchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Exercicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormaPagamento]    Script Date: 18/04/2026 14:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormaPagamento](
	[id_FormaPgto] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_FormaPgto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Funcionario]    Script Date: 18/04/2026 14:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funcionario](
	[id_Funcionario] [int] IDENTITY(1,1) NOT NULL,
	[id_Setor] [int] NULL,
	[id_Cargo] [int] NULL,
	[nomeFuncionario] [varchar](150) NOT NULL,
	[cpf_Funcionario] [varchar](14) NOT NULL,
	[salario] [decimal](10, 2) NULL,
	[data_contratacao] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Funcionario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[cpf_Funcionario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ManutencaoAparelho]    Script Date: 18/04/2026 14:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManutencaoAparelho](
	[id_Manutencao] [int] IDENTITY(1,1) NOT NULL,
	[id_Aparelho] [int] NULL,
	[id_Funcionario] [int] NULL,
	[descricao_problema] [varchar](150) NOT NULL,
	[custo_reparo] [decimal](10, 2) NOT NULL,
	[data_manutencao] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Manutencao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matricula]    Script Date: 18/04/2026 14:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matricula](
	[id_Matricula] [int] IDENTITY(1000,1) NOT NULL,
	[id_Aluno] [int] NULL,
	[id_Plano] [int] NULL,
	[preco_Historico] [decimal](10, 2) NULL,
	[data_Inicio] [date] NULL,
	[data_Fim] [date] NULL,
	[status_Matricula] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pagamento]    Script Date: 18/04/2026 14:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagamento](
	[id_Pagamento] [int] IDENTITY(1,1) NOT NULL,
	[id_Matricula] [int] NULL,
	[id_FormaPgto] [int] NULL,
	[valor_pago] [decimal](10, 2) NULL,
	[data_vencimento] [date] NOT NULL,
	[data_pgto] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Pagamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanoAluno]    Script Date: 18/04/2026 14:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanoAluno](
	[id_Plano] [int] IDENTITY(1,1) NOT NULL,
	[nomePlano] [varchar](30) NOT NULL,
	[mensalidade] [decimal](10, 2) NULL,
	[duracao] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Plano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Presenca]    Script Date: 18/04/2026 14:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presenca](
	[id_Presenca] [int] IDENTITY(1,1) NOT NULL,
	[id_Aluno] [int] NULL,
	[data_entrada] [datetime] NULL,
	[data_saida] [datetime] NULL,
	[status_Presenca] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Presenca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Setor]    Script Date: 18/04/2026 14:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Setor](
	[id_Setor] [int] IDENTITY(1,1) NOT NULL,
	[nomeSetor] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Setor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Treino]    Script Date: 18/04/2026 14:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Treino](
	[id_Treino] [int] IDENTITY(1,1) NOT NULL,
	[id_Aluno] [int] NULL,
	[id_Exercicio] [int] NULL,
	[id_Aparelho] [int] NULL,
	[id_Funcionario] [int] NULL,
	[nome_Ficha] [varchar](1) NOT NULL,
	[date_Ficha] [date] NULL,
	[series] [int] NULL,
	[repeticoes] [int] NULL,
	[descanso_segundos] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Treino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Aparelho] ADD  DEFAULT (getdate()) FOR [datacompra_Aparelho]
GO
ALTER TABLE [dbo].[Funcionario] ADD  DEFAULT (getdate()) FOR [data_contratacao]
GO
ALTER TABLE [dbo].[ManutencaoAparelho] ADD  DEFAULT (getdate()) FOR [data_manutencao]
GO
ALTER TABLE [dbo].[Matricula] ADD  DEFAULT (getdate()) FOR [data_Inicio]
GO
ALTER TABLE [dbo].[Pagamento] ADD  DEFAULT (getdate()) FOR [data_pgto]
GO
ALTER TABLE [dbo].[Presenca] ADD  DEFAULT (getdate()) FOR [data_entrada]
GO
ALTER TABLE [dbo].[Treino] ADD  DEFAULT (getdate()) FOR [date_Ficha]
GO
ALTER TABLE [dbo].[Funcionario]  WITH CHECK ADD FOREIGN KEY([id_Cargo])
REFERENCES [dbo].[Cargo] ([id_Cargo])
GO
ALTER TABLE [dbo].[Funcionario]  WITH CHECK ADD FOREIGN KEY([id_Setor])
REFERENCES [dbo].[Setor] ([id_Setor])
GO
ALTER TABLE [dbo].[ManutencaoAparelho]  WITH CHECK ADD FOREIGN KEY([id_Aparelho])
REFERENCES [dbo].[Aparelho] ([id_Aparelho])
GO
ALTER TABLE [dbo].[ManutencaoAparelho]  WITH CHECK ADD FOREIGN KEY([id_Funcionario])
REFERENCES [dbo].[Funcionario] ([id_Funcionario])
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD FOREIGN KEY([id_Aluno])
REFERENCES [dbo].[Aluno] ([id_Aluno])
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD FOREIGN KEY([id_Plano])
REFERENCES [dbo].[PlanoAluno] ([id_Plano])
GO
ALTER TABLE [dbo].[Pagamento]  WITH CHECK ADD FOREIGN KEY([id_FormaPgto])
REFERENCES [dbo].[FormaPagamento] ([id_FormaPgto])
GO
ALTER TABLE [dbo].[Pagamento]  WITH CHECK ADD FOREIGN KEY([id_Matricula])
REFERENCES [dbo].[Matricula] ([id_Matricula])
GO
ALTER TABLE [dbo].[Presenca]  WITH CHECK ADD FOREIGN KEY([id_Aluno])
REFERENCES [dbo].[Aluno] ([id_Aluno])
GO
ALTER TABLE [dbo].[Treino]  WITH CHECK ADD FOREIGN KEY([id_Aluno])
REFERENCES [dbo].[Aluno] ([id_Aluno])
GO
ALTER TABLE [dbo].[Treino]  WITH CHECK ADD FOREIGN KEY([id_Aparelho])
REFERENCES [dbo].[Aparelho] ([id_Aparelho])
GO
ALTER TABLE [dbo].[Treino]  WITH CHECK ADD FOREIGN KEY([id_Exercicio])
REFERENCES [dbo].[Exercicio] ([id_Exercicio])
GO
ALTER TABLE [dbo].[Treino]  WITH CHECK ADD FOREIGN KEY([id_Funcionario])
REFERENCES [dbo].[Funcionario] ([id_Funcionario])
GO
ALTER TABLE [dbo].[Aluno]  WITH CHECK ADD CHECK  ((len([cpf_Aluno])>=(11)))
GO
ALTER TABLE [dbo].[Aluno]  WITH CHECK ADD CHECK  (([email_Aluno] like '%@%'))
GO
ALTER TABLE [dbo].[Aluno]  WITH CHECK ADD CHECK  ((len([nomeAluno])>=(3)))
GO
ALTER TABLE [dbo].[Aluno]  WITH CHECK ADD CHECK  (([sexo]='F' OR [sexo]='M'))
GO
ALTER TABLE [dbo].[Aparelho]  WITH CHECK ADD CHECK  (([status_Aparelho]='Vendido' OR [status_Aparelho]='Manutencao' OR [status_Aparelho]='Disponivel'))
GO
ALTER TABLE [dbo].[FormaPagamento]  WITH CHECK ADD CHECK  (([descricao]='Cartão de Débito' OR [descricao]='Cartão de Credito' OR [descricao]='Pix' OR [descricao]='Dinheiro'))
GO
ALTER TABLE [dbo].[Funcionario]  WITH CHECK ADD CHECK  ((len([cpf_Funcionario])>=(11)))
GO
ALTER TABLE [dbo].[ManutencaoAparelho]  WITH CHECK ADD CHECK  (([custo_reparo]>=(0)))
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD CHECK  (([status_Matricula]='Finalizada' OR [status_Matricula]='Cancelada' OR [status_Matricula]='Trancada' OR [status_Matricula]='Ativa'))
GO
ALTER TABLE [dbo].[Treino]  WITH CHECK ADD CHECK  (([nome_Ficha]='E' OR [nome_Ficha]='D' OR [nome_Ficha]='C' OR [nome_Ficha]='B' OR [nome_Ficha]='A'))
GO
