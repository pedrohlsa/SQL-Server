/****** Object:  Table [dbo].[atualizacoes]    Script Date: 01/04/2026 17:41:19 ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[atualizacoes](

[id_niveis] [tinyint] IDENTITY(1,1) NOT NULL,

[id_user] [tinyint] NULL,

[tempoderaio] [varchar](30) NULL,

[atualizadoem] [datetime] NULL,

PRIMARY KEY CLUSTERED 

(

[id_niveis] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[contascs]    Script Date: 01/04/2026 17:41:19 ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[contascs](

[id_user] [tinyint] IDENTITY(1,1) NOT NULL,

[nome_conta] [varchar](50) NULL,

[linkperfil] [varchar](255) NULL,

PRIMARY KEY CLUSTERED 

(

[id_user] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],

UNIQUE NONCLUSTERED 

(

[nome_conta] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[lucros]    Script Date: 01/04/2026 17:41:19 ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[lucros](

[id_transacao] [int] IDENTITY(1,1) NOT NULL,

[valor_custo] [decimal](10, 2) NULL,

[valor_retorno] [decimal](10, 2) NULL,

[id_user] [tinyint] NULL,

[atualizadoem] [datetime] NULL,

PRIMARY KEY CLUSTERED 

(

[id_transacao] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO

ALTER TABLE [dbo].[atualizacoes] ADD  DEFAULT (getdate()) FOR [atualizadoem]

GO

ALTER TABLE [dbo].[lucros] ADD  DEFAULT (getdate()) FOR [atualizadoem]

GO

ALTER TABLE [dbo].[atualizacoes]  WITH CHECK ADD  CONSTRAINT [fk_niveis_contas] FOREIGN KEY([id_user])

REFERENCES [dbo].[contascs] ([id_user])

GO

ALTER TABLE [dbo].[atualizacoes] CHECK CONSTRAINT [fk_niveis_contas]

GO

ALTER TABLE [dbo].[lucros]  WITH CHECK ADD  CONSTRAINT [fk_lucro_user] FOREIGN KEY([id_user])

REFERENCES [dbo].[contascs] ([id_user])

GO

ALTER TABLE [dbo].[lucros] CHECK CONSTRAINT [fk_lucro_user]

GO

ALTER TABLE [dbo].[lucros]  WITH CHECK ADD  CONSTRAINT [chk_valor] CHECK  (([valor_custo]>=(0) AND [valor_retorno]>=(0)))

GO

ALTER TABLE [dbo].[lucros] CHECK CONSTRAINT [chk_valor]

GO

