USE [MASTER]
GO

USE [Biblioteca]
GO
/****** Objeto:  Table [dbo].[alugar_livro]    Data do Script: 06/05/2026 00:22:08 ******/
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
/****** Objeto:  Table [dbo].[assunto]    Data do Script: 06/05/2026 00:22:08 ******/
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
/****** Objeto:  Table [dbo].[autor]    Data do Script: 06/05/2026 00:22:08 ******/
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
/****** Objeto:  Table [dbo].[cliente]    Data do Script: 06/05/2026 00:22:08 ******/
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
/****** Objeto:  Table [dbo].[compra]    Data do Script: 06/05/2026 00:22:08 ******/
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
/****** Objeto:  Table [dbo].[departamento]    Data do Script: 06/05/2026 00:22:08 ******/
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
/****** Objeto:  Table [dbo].[editora]    Data do Script: 06/05/2026 00:22:08 ******/
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
/****** Objeto:  Table [dbo].[endereco_cliente]    Data do Script: 06/05/2026 00:22:08 ******/
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
/****** Objeto:  Table [dbo].[endereco_funcionario]    Data do Script: 06/05/2026 00:22:08 ******/
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
/****** Objeto:  Table [dbo].[forma_pgto]    Data do Script: 06/05/2026 00:22:08 ******/
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
/****** Objeto:  Table [dbo].[fornecedor]    Data do Script: 06/05/2026 00:22:08 ******/
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
/****** Objeto:  Table [dbo].[funcionario]    Data do Script: 06/05/2026 00:22:08 ******/
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
/****** Objeto:  Table [dbo].[info_fornecedor]    Data do Script: 06/05/2026 00:22:08 ******/
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
/****** Objeto:  Table [dbo].[item_venda]    Data do Script: 06/05/2026 00:22:08 ******/
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
/****** Objeto:  Table [dbo].[livro]    Data do Script: 06/05/2026 00:22:08 ******/
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
/****** Objeto:  Table [dbo].[livro_autor]    Data do Script: 06/05/2026 00:22:08 ******/
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
/****** Objeto:  Table [dbo].[movimentacao_estoque]    Data do Script: 06/05/2026 00:22:08 ******/
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
/****** Objeto:  Table [dbo].[pagamento_func]    Data do Script: 06/05/2026 00:22:08 ******/
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
/****** Objeto:  Table [dbo].[pagamento_parcelas]    Data do Script: 06/05/2026 00:22:08 ******/
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
/****** Objeto:  Table [dbo].[parcelas_compra]    Data do Script: 06/05/2026 00:22:08 ******/
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
/****** Objeto:  Table [dbo].[preco_historico]    Data do Script: 06/05/2026 00:22:08 ******/
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
/****** Objeto:  Table [dbo].[venda]    Data do Script: 06/05/2026 00:22:08 ******/
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
ALTER TABLE [dbo].[movimentacao_estoque]  WITH CHECK ADD CHECK  (([tipo_movto]='S' OR [tipo_movto]='E'))
GO
ALTER TABLE [dbo].[pagamento_func]  WITH CHECK ADD CHECK  (([status_pgto]='Atrasado' OR [status_pgto]='Cancelado' OR [status_pgto]='Pago' OR [status_pgto]='Pendente'))
GO
ALTER TABLE [dbo].[parcelas_compra]  WITH CHECK ADD CHECK  (([status_pagamento]='Pendente' OR [status_pagamento]='Atrasado' OR [status_pagamento]='Pago'))
GO
ALTER TABLE [dbo].[venda]  WITH CHECK ADD CHECK  (([status_venda]='Pendente' OR [status_venda]='Concluida' OR [status_venda]='Cancelada'))
GO
