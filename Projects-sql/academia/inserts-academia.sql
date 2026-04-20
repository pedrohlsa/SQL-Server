USE [Academia]
GO
SET IDENTITY_INSERT [dbo].[aluno] ON 

INSERT [dbo].[aluno] ([id_aluno], [NomeAluno], [cpf], [data_nasc], [sexo], [Telefone_Aluno], [Email_Aluno]) VALUES (1, N'Ramon Dino', N'111.111.111-11', CAST(N'1995-08-05' AS Date), N'M', N'2191111-1111', N'dino@pro.com')
INSERT [dbo].[aluno] ([id_aluno], [NomeAluno], [cpf], [data_nasc], [sexo], [Telefone_Aluno], [Email_Aluno]) VALUES (2, N'Chris Bumstead', N'222.222.222-22', CAST(N'1995-02-02' AS Date), N'M', N'2192222-2222', N'cbum@classic.com')
INSERT [dbo].[aluno] ([id_aluno], [NomeAluno], [cpf], [data_nasc], [sexo], [Telefone_Aluno], [Email_Aluno]) VALUES (3, N'Francielle Mattos', N'333.333.333-33', CAST(N'1986-04-15' AS Date), N'F', N'2193333-3333', N'fran.wellness@email.com')
INSERT [dbo].[aluno] ([id_aluno], [NomeAluno], [cpf], [data_nasc], [sexo], [Telefone_Aluno], [Email_Aluno]) VALUES (4, N'Rafael Brandao', N'444.444.444-44', CAST(N'1993-06-24' AS Date), N'M', N'2194444-4444', N'brandao@pro.com')
INSERT [dbo].[aluno] ([id_aluno], [NomeAluno], [cpf], [data_nasc], [sexo], [Telefone_Aluno], [Email_Aluno]) VALUES (5, N'Isa Pecini', N'555.555.555-55', CAST(N'1997-01-20' AS Date), N'F', N'2195555-5555', N'isa.bikini@email.com')
SET IDENTITY_INSERT [dbo].[aluno] OFF
GO
SET IDENTITY_INSERT [dbo].[planoAluno] ON 

INSERT [dbo].[planoAluno] ([id_plano], [NomePlano], [Mensalidade], [Duracao]) VALUES (1, N'Anual Black', CAST(119.90 AS Decimal(10, 2)), 12)
INSERT [dbo].[planoAluno] ([id_plano], [NomePlano], [Mensalidade], [Duracao]) VALUES (2, N'Mensal Basic', CAST(159.90 AS Decimal(10, 2)), 1)
SET IDENTITY_INSERT [dbo].[planoAluno] OFF
GO
SET IDENTITY_INSERT [dbo].[matricula] ON 

INSERT [dbo].[matricula] ([id_matricula], [id_aluno], [id_plano], [preco_historico], [data_inicio], [data_fim], [status]) VALUES (1000, 1, 1, CAST(119.90 AS Decimal(10, 2)), CAST(N'2026-04-20' AS Date), NULL, N'Ativa')
INSERT [dbo].[matricula] ([id_matricula], [id_aluno], [id_plano], [preco_historico], [data_inicio], [data_fim], [status]) VALUES (1001, 2, 1, CAST(119.90 AS Decimal(10, 2)), CAST(N'2026-04-20' AS Date), NULL, N'Ativa')
INSERT [dbo].[matricula] ([id_matricula], [id_aluno], [id_plano], [preco_historico], [data_inicio], [data_fim], [status]) VALUES (1002, 3, 1, CAST(119.90 AS Decimal(10, 2)), CAST(N'2026-04-20' AS Date), NULL, N'Ativa')
INSERT [dbo].[matricula] ([id_matricula], [id_aluno], [id_plano], [preco_historico], [data_inicio], [data_fim], [status]) VALUES (1003, 4, 2, CAST(159.90 AS Decimal(10, 2)), CAST(N'2026-04-20' AS Date), NULL, N'Ativa')
INSERT [dbo].[matricula] ([id_matricula], [id_aluno], [id_plano], [preco_historico], [data_inicio], [data_fim], [status]) VALUES (1004, 5, 2, CAST(159.90 AS Decimal(10, 2)), CAST(N'2026-04-20' AS Date), NULL, N'Ativa')
SET IDENTITY_INSERT [dbo].[matricula] OFF
GO
SET IDENTITY_INSERT [dbo].[formapagamento] ON 

INSERT [dbo].[formapagamento] ([id_formapgto], [descricao]) VALUES (5, N'Boleto')
INSERT [dbo].[formapagamento] ([id_formapgto], [descricao]) VALUES (3, N'Cartao de Credito')
INSERT [dbo].[formapagamento] ([id_formapgto], [descricao]) VALUES (4, N'Cartao de Debito')
INSERT [dbo].[formapagamento] ([id_formapgto], [descricao]) VALUES (2, N'Dinheiro')
INSERT [dbo].[formapagamento] ([id_formapgto], [descricao]) VALUES (1, N'Pix')
SET IDENTITY_INSERT [dbo].[formapagamento] OFF
GO
SET IDENTITY_INSERT [dbo].[pagamento] ON 

INSERT [dbo].[pagamento] ([id_pagamento], [id_matricula], [id_forma_pgto], [valor_pago], [data_vencimento], [data_pagamento]) VALUES (1, 1000, 1, CAST(119.90 AS Decimal(10, 2)), CAST(N'2026-04-20' AS Date), CAST(N'2026-04-20' AS Date))
INSERT [dbo].[pagamento] ([id_pagamento], [id_matricula], [id_forma_pgto], [valor_pago], [data_vencimento], [data_pagamento]) VALUES (2, 1001, 1, CAST(119.90 AS Decimal(10, 2)), CAST(N'2026-04-20' AS Date), CAST(N'2026-04-20' AS Date))
INSERT [dbo].[pagamento] ([id_pagamento], [id_matricula], [id_forma_pgto], [valor_pago], [data_vencimento], [data_pagamento]) VALUES (3, 1002, 1, CAST(119.90 AS Decimal(10, 2)), CAST(N'2026-04-20' AS Date), CAST(N'2026-04-20' AS Date))
INSERT [dbo].[pagamento] ([id_pagamento], [id_matricula], [id_forma_pgto], [valor_pago], [data_vencimento], [data_pagamento]) VALUES (4, 1003, 1, CAST(159.90 AS Decimal(10, 2)), CAST(N'2026-04-20' AS Date), CAST(N'2026-04-20' AS Date))
INSERT [dbo].[pagamento] ([id_pagamento], [id_matricula], [id_forma_pgto], [valor_pago], [data_vencimento], [data_pagamento]) VALUES (5, 1004, 1, CAST(159.90 AS Decimal(10, 2)), CAST(N'2026-04-20' AS Date), CAST(N'2026-04-20' AS Date))
SET IDENTITY_INSERT [dbo].[pagamento] OFF
GO
