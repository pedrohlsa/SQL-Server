USE [ContasCS2]
GO
/****** Objeto:  Table [dbo].[contas]    Data do Script: 15/05/2026 00:37:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contas](
	[id_conta] [int] IDENTITY(1,1) NOT NULL,
	[nome_usuario] [varchar](100) NOT NULL,
	[level_conta] [tinyint] NOT NULL,
	[premier] [smallint] NULL,
	[wins] [smallint] NULL,
	[xp_atual] [int] NULL,
	[preco_prime] [decimal](10, 2) NOT NULL,
	[status_drop_semanal] [char](1) NULL,
	[status_conta] [varchar](10) NULL,
	[data_adicao] [date] NULL,
	[enviado_main] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_conta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nome_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[drops]    Data do Script: 15/05/2026 00:37:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[drops](
	[id_drop] [int] IDENTITY(1,1) NOT NULL,
	[id_conta] [int] NULL,
	[caixa_nome] [varchar](50) NOT NULL,
	[item_nome] [varchar](100) NOT NULL,
	[data_drop] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_drop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[historico_status]    Data do Script: 15/05/2026 00:37:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historico_status](
	[id_log] [int] IDENTITY(1,1) NOT NULL,
	[id_conta] [int] NULL,
	[tipo_ban] [varchar](10) NULL,
	[data_inicio] [date] NULL,
	[data_fim] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_log] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[vendas_lote]    Data do Script: 15/05/2026 00:37:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendas_lote](
	[id_venda] [int] IDENTITY(1,1) NOT NULL,
	[data_venda] [date] NULL,
	[valor_recebido_bruto] [decimal](10, 2) NULL,
	[valor_liquido] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_venda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[contas] ADD  DEFAULT ((0)) FOR [premier]
GO
ALTER TABLE [dbo].[contas] ADD  DEFAULT ((0)) FOR [wins]
GO
ALTER TABLE [dbo].[contas] ADD  DEFAULT ((0)) FOR [xp_atual]
GO
ALTER TABLE [dbo].[contas] ADD  DEFAULT ('N') FOR [status_drop_semanal]
GO
ALTER TABLE [dbo].[contas] ADD  DEFAULT ('Livre') FOR [status_conta]
GO
ALTER TABLE [dbo].[contas] ADD  DEFAULT (getdate()) FOR [data_adicao]
GO
ALTER TABLE [dbo].[contas] ADD  CONSTRAINT [DF_enviado_padrao]  DEFAULT ('N') FOR [enviado_main]
GO
ALTER TABLE [dbo].[drops] ADD  DEFAULT (getdate()) FOR [data_drop]
GO
ALTER TABLE [dbo].[vendas_lote] ADD  DEFAULT (getdate()) FOR [data_venda]
GO
ALTER TABLE [dbo].[drops]  WITH CHECK ADD  CONSTRAINT [fk_idconta_iddrop] FOREIGN KEY([id_conta])
REFERENCES [dbo].[contas] ([id_conta])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[drops] CHECK CONSTRAINT [fk_idconta_iddrop]
GO
ALTER TABLE [dbo].[historico_status]  WITH CHECK ADD  CONSTRAINT [fk_idconta_idlog] FOREIGN KEY([id_conta])
REFERENCES [dbo].[contas] ([id_conta])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[historico_status] CHECK CONSTRAINT [fk_idconta_idlog]
GO
ALTER TABLE [dbo].[contas]  WITH CHECK ADD CHECK  (([status_conta]='Livre' OR [status_conta]='365D' OR [status_conta]='30D' OR [status_conta]='7D' OR [status_conta]='1D'))
GO
ALTER TABLE [dbo].[contas]  WITH CHECK ADD CHECK  (([status_drop_semanal]='N' OR [status_drop_semanal]='S'))
GO
