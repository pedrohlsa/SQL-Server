CREATE database Academia;

USE [Academia]
GO
/****** Object:  Table [dbo].[aluno]    Script Date: 20/04/2026 19:29:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aluno](
	[id_aluno] [int] IDENTITY(1,1) NOT NULL,
	[NomeAluno] [varchar](150) NOT NULL,
	[cpf] [varchar](14) NOT NULL,
	[data_nasc] [date] NULL,
	[sexo] [varchar](1) NULL,
	[Telefone_Aluno] [varchar](20) NULL,
	[Email_Aluno] [varchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_aluno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[cpf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aparelho]    Script Date: 20/04/2026 19:29:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aparelho](
	[id_aparelho] [int] IDENTITY(1,1) NOT NULL,
	[nomeAparelho] [varchar](150) NOT NULL,
	[marcaAparelho] [varchar](150) NULL,
	[valor] [decimal](10, 2) NULL,
	[status] [varchar](20) NULL,
	[datacompra_aparelho] [date] NULL,
	[datavenda_aparelho] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_aparelho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cargo]    Script Date: 20/04/2026 19:29:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cargo](
	[id_cargo] [int] IDENTITY(1,1) NOT NULL,
	[NomeCargo] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exercicio]    Script Date: 20/04/2026 19:29:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exercicio](
	[id_exercicio] [int] IDENTITY(1,1) NOT NULL,
	[NomeExercicio] [varchar](150) NOT NULL,
	[id_aparelho] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_exercicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[formapagamento]    Script Date: 20/04/2026 19:29:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[formapagamento](
	[id_formapgto] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_formapgto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[descricao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[funcionario]    Script Date: 20/04/2026 19:29:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[funcionario](
	[id_funcionario] [int] IDENTITY(1,1) NOT NULL,
	[id_setor] [int] NULL,
	[id_cargo] [int] NULL,
	[NomeFuncionario] [varchar](150) NOT NULL,
	[cpf] [varchar](14) NOT NULL,
	[salario] [decimal](10, 2) NULL,
	[data_contratacao] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_funcionario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[cpf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manutencaoAparelho]    Script Date: 20/04/2026 19:29:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manutencaoAparelho](
	[id_manutencao] [int] IDENTITY(1,1) NOT NULL,
	[id_aparelho] [int] NULL,
	[id_funcionario] [int] NULL,
	[descricaoproblema] [varchar](150) NULL,
	[custo_reparo] [decimal](10, 2) NULL,
	[datamanutencao] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_manutencao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[matricula]    Script Date: 20/04/2026 19:29:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[matricula](
	[id_matricula] [int] IDENTITY(1000,1) NOT NULL,
	[id_aluno] [int] NULL,
	[id_plano] [int] NULL,
	[preco_historico] [decimal](10, 2) NULL,
	[data_inicio] [date] NULL,
	[data_fim] [date] NULL,
	[status] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pagamento]    Script Date: 20/04/2026 19:29:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pagamento](
	[id_pagamento] [int] IDENTITY(1,1) NOT NULL,
	[id_matricula] [int] NULL,
	[id_forma_pgto] [int] NULL,
	[valor_pago] [decimal](10, 2) NULL,
	[data_vencimento] [date] NOT NULL,
	[data_pagamento] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pagamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[planoAluno]    Script Date: 20/04/2026 19:29:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[planoAluno](
	[id_plano] [int] IDENTITY(1,1) NOT NULL,
	[NomePlano] [varchar](30) NOT NULL,
	[Mensalidade] [decimal](10, 2) NULL,
	[Duracao] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_plano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[presenca]    Script Date: 20/04/2026 19:29:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[presenca](
	[id_presenca] [int] IDENTITY(1,1) NOT NULL,
	[id_aluno] [int] NULL,
	[data_entrada] [datetime] NULL,
	[data_saida] [datetime] NULL,
	[status] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_presenca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[setor]    Script Date: 20/04/2026 19:29:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[setor](
	[id_setor] [int] IDENTITY(1,1) NOT NULL,
	[NomeSetor] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_setor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[treino]    Script Date: 20/04/2026 19:29:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[treino](
	[id_treino] [int] IDENTITY(1,1) NOT NULL,
	[id_aluno] [int] NULL,
	[id_exercicio] [int] NULL,
	[id_funcionario] [int] NULL,
	[nome_ficha] [varchar](1) NULL,
	[data_treino] [date] NULL,
	[series] [int] NULL,
	[repeticoes] [int] NULL,
	[descanso_segundos] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_treino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[aparelho] ADD  DEFAULT (getdate()) FOR [datacompra_aparelho]
GO
ALTER TABLE [dbo].[funcionario] ADD  DEFAULT (getdate()) FOR [data_contratacao]
GO
ALTER TABLE [dbo].[manutencaoAparelho] ADD  DEFAULT (getdate()) FOR [datamanutencao]
GO
ALTER TABLE [dbo].[matricula] ADD  DEFAULT (getdate()) FOR [data_inicio]
GO
ALTER TABLE [dbo].[pagamento] ADD  DEFAULT (getdate()) FOR [data_pagamento]
GO
ALTER TABLE [dbo].[presenca] ADD  DEFAULT (getdate()) FOR [data_entrada]
GO
ALTER TABLE [dbo].[treino] ADD  DEFAULT (getdate()) FOR [data_treino]
GO
ALTER TABLE [dbo].[exercicio]  WITH CHECK ADD  CONSTRAINT [FK_Aparelho_Exercicio] FOREIGN KEY([id_aparelho])
REFERENCES [dbo].[aparelho] ([id_aparelho])
GO
ALTER TABLE [dbo].[exercicio] CHECK CONSTRAINT [FK_Aparelho_Exercicio]
GO
ALTER TABLE [dbo].[funcionario]  WITH CHECK ADD  CONSTRAINT [FK_Cargo_Func] FOREIGN KEY([id_cargo])
REFERENCES [dbo].[cargo] ([id_cargo])
GO
ALTER TABLE [dbo].[funcionario] CHECK CONSTRAINT [FK_Cargo_Func]
GO
ALTER TABLE [dbo].[funcionario]  WITH CHECK ADD  CONSTRAINT [FK_Setor_Func] FOREIGN KEY([id_setor])
REFERENCES [dbo].[setor] ([id_setor])
GO
ALTER TABLE [dbo].[funcionario] CHECK CONSTRAINT [FK_Setor_Func]
GO
ALTER TABLE [dbo].[manutencaoAparelho]  WITH CHECK ADD  CONSTRAINT [FK_Aparelho_Manut] FOREIGN KEY([id_aparelho])
REFERENCES [dbo].[aparelho] ([id_aparelho])
GO
ALTER TABLE [dbo].[manutencaoAparelho] CHECK CONSTRAINT [FK_Aparelho_Manut]
GO
ALTER TABLE [dbo].[manutencaoAparelho]  WITH CHECK ADD  CONSTRAINT [FK_Func_Manut] FOREIGN KEY([id_funcionario])
REFERENCES [dbo].[funcionario] ([id_funcionario])
GO
ALTER TABLE [dbo].[manutencaoAparelho] CHECK CONSTRAINT [FK_Func_Manut]
GO
ALTER TABLE [dbo].[matricula]  WITH CHECK ADD  CONSTRAINT [FK_Aluno_Matricula] FOREIGN KEY([id_aluno])
REFERENCES [dbo].[aluno] ([id_aluno])
GO
ALTER TABLE [dbo].[matricula] CHECK CONSTRAINT [FK_Aluno_Matricula]
GO
ALTER TABLE [dbo].[matricula]  WITH CHECK ADD  CONSTRAINT [FK_Plano_Matricula] FOREIGN KEY([id_plano])
REFERENCES [dbo].[planoAluno] ([id_plano])
GO
ALTER TABLE [dbo].[matricula] CHECK CONSTRAINT [FK_Plano_Matricula]
GO
ALTER TABLE [dbo].[pagamento]  WITH CHECK ADD  CONSTRAINT [FK_Forma_Pagto] FOREIGN KEY([id_forma_pgto])
REFERENCES [dbo].[formapagamento] ([id_formapgto])
GO
ALTER TABLE [dbo].[pagamento] CHECK CONSTRAINT [FK_Forma_Pagto]
GO
ALTER TABLE [dbo].[pagamento]  WITH CHECK ADD  CONSTRAINT [FK_Matricula_Pagto] FOREIGN KEY([id_matricula])
REFERENCES [dbo].[matricula] ([id_matricula])
GO
ALTER TABLE [dbo].[pagamento] CHECK CONSTRAINT [FK_Matricula_Pagto]
GO
ALTER TABLE [dbo].[presenca]  WITH CHECK ADD  CONSTRAINT [FK_Aluno_Presenca] FOREIGN KEY([id_aluno])
REFERENCES [dbo].[aluno] ([id_aluno])
GO
ALTER TABLE [dbo].[presenca] CHECK CONSTRAINT [FK_Aluno_Presenca]
GO
ALTER TABLE [dbo].[treino]  WITH CHECK ADD  CONSTRAINT [FK_Aluno_Treino] FOREIGN KEY([id_aluno])
REFERENCES [dbo].[aluno] ([id_aluno])
GO
ALTER TABLE [dbo].[treino] CHECK CONSTRAINT [FK_Aluno_Treino]
GO
ALTER TABLE [dbo].[treino]  WITH CHECK ADD  CONSTRAINT [FK_Exercicio_Treino] FOREIGN KEY([id_exercicio])
REFERENCES [dbo].[exercicio] ([id_exercicio])
GO
ALTER TABLE [dbo].[treino] CHECK CONSTRAINT [FK_Exercicio_Treino]
GO
ALTER TABLE [dbo].[treino]  WITH CHECK ADD  CONSTRAINT [FK_Func_Treino] FOREIGN KEY([id_funcionario])
REFERENCES [dbo].[funcionario] ([id_funcionario])
GO
ALTER TABLE [dbo].[treino] CHECK CONSTRAINT [FK_Func_Treino]
GO
ALTER TABLE [dbo].[aluno]  WITH CHECK ADD CHECK  (([Email_Aluno] like '%@%'))
GO
ALTER TABLE [dbo].[aluno]  WITH CHECK ADD CHECK  ((len([NomeAluno])>=(3)))
GO
ALTER TABLE [dbo].[aluno]  WITH CHECK ADD CHECK  (([sexo]='F' OR [sexo]='M'))
GO
ALTER TABLE [dbo].[aparelho]  WITH CHECK ADD CHECK  (([status]='Vendido' OR [status]='Manutencao' OR [status]='Disponivel'))
GO
ALTER TABLE [dbo].[formapagamento]  WITH CHECK ADD  CONSTRAINT [CK_FormaPagamento_Padrao] CHECK  (([descricao]='Boleto' OR [descricao]='Cartao de Debito' OR [descricao]='Cartao de Credito' OR [descricao]='Pix' OR [descricao]='Dinheiro'))
GO
ALTER TABLE [dbo].[formapagamento] CHECK CONSTRAINT [CK_FormaPagamento_Padrao]
GO
ALTER TABLE [dbo].[matricula]  WITH CHECK ADD CHECK  (([status]='Finalizada' OR [status]='Cancelada' OR [status]='Trancada' OR [status]='Ativa'))
GO
ALTER TABLE [dbo].[treino]  WITH CHECK ADD CHECK  (([nome_ficha]='E' OR [nome_ficha]='D' OR [nome_ficha]='C' OR [nome_ficha]='B' OR [nome_ficha]='A'))
GO
