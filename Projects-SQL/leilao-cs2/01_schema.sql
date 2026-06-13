USE [Leilaocs2]
GO
ALTER TABLE [dbo].[Catalogo] DROP CONSTRAINT [CK__Catalogo__valor___5EBF139D]
GO
ALTER TABLE [dbo].[Lances] DROP CONSTRAINT [DF__Lances__horalanc__6A30C649]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 07/04/2026 19:49:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[Leilao]    Script Date: 07/04/2026 19:49:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Leilao]') AND type in (N'U'))
DROP TABLE [dbo].[Leilao]
GO
/****** Object:  Table [dbo].[Lances]    Script Date: 07/04/2026 19:49:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Lances]') AND type in (N'U'))
DROP TABLE [dbo].[Lances]
GO
/****** Object:  Table [dbo].[Catalogo]    Script Date: 07/04/2026 19:49:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Catalogo]') AND type in (N'U'))
DROP TABLE [dbo].[Catalogo]
GO
/****** Object:  Table [dbo].[Catalogo]    Script Date: 07/04/2026 19:49:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogo](
	[id_skin] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NULL,
	[NomeSkin] [varchar](130) NOT NULL,
	[pattern] [smallint] NOT NULL,
	[desgaste] [decimal](10, 9) NOT NULL,
	[valor_min] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_skin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lances]    Script Date: 07/04/2026 19:49:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lances](
	[id_lances] [int] IDENTITY(1,1) NOT NULL,
	[id_leilao] [int] NULL,
	[id_user] [int] NULL,
	[valorlance] [decimal](18, 2) NULL,
	[horalance] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_lances] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leilao]    Script Date: 07/04/2026 19:49:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leilao](
	[id_leilao] [int] IDENTITY(1,1) NOT NULL,
	[id_skin] [int] NULL,
	[inicioleilao] [datetime] NULL,
	[fimleilao] [datetime] NULL,
	[statusleilao] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_leilao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 07/04/2026 19:49:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](130) NOT NULL,
	[saldo] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Lances] ADD  DEFAULT (getdate()) FOR [horalance]
GO
ALTER TABLE [dbo].[Catalogo]  WITH CHECK ADD CHECK  (([valor_min]>(0)))
GO
