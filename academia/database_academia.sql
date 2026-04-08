/****** Object:  Table [dbo].[Alunos]    Script Date: 31/03/2026 17:04:45 ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[Alunos](

[id_Matricula] [int] IDENTITY(1,1) NOT NULL,

[nome] [varchar](60) NULL,

[nascimento] [date] NULL,

[idade] [tinyint] NULL,

[pesoatual] [decimal](5, 2) NULL,

[plano] [varchar](30) NOT NULL,

[tempoplano] [tinyint] NOT NULL,

PRIMARY KEY CLUSTERED 

(

[id_Matricula] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Manuntencao]    Script Date: 31/03/2026 17:04:45 ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[Manuntencao](

[id_Aparelho] [int] NOT NULL,

[numeroaparelho] [tinyint] NULL,

[manuntencaodoaparelho] [date] NOT NULL,

PRIMARY KEY CLUSTERED 

(

[id_Aparelho] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[ProblemasAparelhos]    Script Date: 31/03/2026 17:04:45 ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[ProblemasAparelhos](

[id_Problema] [int] NOT NULL,

[numeroaparelho] [smallint] NULL,

[datadoproblema] [date] NULL,

[descricaoproblema] [varchar](1) NULL,

[id_Aparelho] [int] NULL,

PRIMARY KEY CLUSTERED 

(

[id_Problema] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO

ALTER TABLE [dbo].[ProblemasAparelhos]  WITH CHECK ADD FOREIGN KEY([id_Aparelho])

REFERENCES [dbo].[Manuntencao] ([id_Aparelho])

GO

ALTER TABLE [dbo].[Alunos]  WITH CHECK ADD CHECK  (([idade]>=(14)))

GO

ALTER TABLE [dbo].[ProblemasAparelhos]  WITH CHECK ADD CHECK  (([numeroaparelho]>=(0)))

GO

