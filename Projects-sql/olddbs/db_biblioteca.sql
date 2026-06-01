/****** Object:  Table [dbo].[Assunto]    Script Date: 31/03/2026 17:27:10 ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[Assunto](

[IdAssunto] [tinyint] IDENTITY(1,1) NOT NULL,

[NomeAssunto] [varchar](25) NOT NULL,

PRIMARY KEY CLUSTERED 

(

[IdAssunto] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[autor]    Script Date: 31/03/2026 17:27:10 ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[autor](

[IdAutor] [smallint] IDENTITY(1,1) NOT NULL,

[NomeAutor] [varchar](50) NOT NULL,

[SobrenomeAutor] [varchar](60) NOT NULL,

 CONSTRAINT [pk_id_autor] PRIMARY KEY CLUSTERED 

(

[IdAutor] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Editora]    Script Date: 31/03/2026 17:27:10 ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[Editora](

[IdEditora] [smallint] IDENTITY(1,1) NOT NULL,

[NomeEditora] [varchar](50) NOT NULL,

PRIMARY KEY CLUSTERED 

(

[IdEditora] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Livro]    Script Date: 31/03/2026 17:27:10 ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[Livro](

[IdLivro] [smallint] IDENTITY(100,1) NOT NULL,

[NomeLivro] [varchar](70) NOT NULL,

[ISBN13] [char](13) NOT NULL,

[DataPub] [date] NOT NULL,

[PreçoLivro] [money] NOT NULL,

[NumeroPaginas] [smallint] NOT NULL,

[IdEditora] [smallint] NOT NULL,

[IdAssunto] [tinyint] NOT NULL,

[edicao] [date] NOT NULL,

PRIMARY KEY CLUSTERED 

(

[IdLivro] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[LivroAutor]    Script Date: 31/03/2026 17:27:10 ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[LivroAutor](

[IdLivro] [smallint] NOT NULL,

[IdAutor] [smallint] NOT NULL,

 CONSTRAINT [pk_livro_autor] PRIMARY KEY CLUSTERED 

(

[IdLivro] ASC,

[IdAutor] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Livro]  WITH CHECK ADD  CONSTRAINT [fk_id_assunto] FOREIGN KEY([IdAssunto])

REFERENCES [dbo].[Assunto] ([IdAssunto])

ON DELETE CASCADE

GO

ALTER TABLE [dbo].[Livro] CHECK CONSTRAINT [fk_id_assunto]

GO

ALTER TABLE [dbo].[Livro]  WITH CHECK ADD  CONSTRAINT [fk_id_editora] FOREIGN KEY([IdEditora])

REFERENCES [dbo].[Editora] ([IdEditora])

ON DELETE CASCADE

GO

ALTER TABLE [dbo].[Livro] CHECK CONSTRAINT [fk_id_editora]

GO

ALTER TABLE [dbo].[LivroAutor]  WITH CHECK ADD  CONSTRAINT [fk_id_autor] FOREIGN KEY([IdAutor])

REFERENCES [dbo].[autor] ([IdAutor])

GO

ALTER TABLE [dbo].[LivroAutor] CHECK CONSTRAINT [fk_id_autor]

GO

ALTER TABLE [dbo].[LivroAutor]  WITH CHECK ADD  CONSTRAINT [fk_id_livros] FOREIGN KEY([IdLivro])

REFERENCES [dbo].[Livro] ([IdLivro])

GO

ALTER TABLE [dbo].[LivroAutor] CHECK CONSTRAINT [fk_id_livros]

GO

ALTER TABLE [dbo].[Livro]  WITH CHECK ADD  CONSTRAINT [verifica_preco] CHECK  (([PreçoLivro]>=(0)))

GO

ALTER TABLE [dbo].[Livro] CHECK CONSTRAINT [verifica_preco]

GO
