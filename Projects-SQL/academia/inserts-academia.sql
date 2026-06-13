USE [Academia]
GO
SET IDENTITY_INSERT [dbo].[setor] ON 

INSERT [dbo].[setor] ([id_setor], [NomeSetor]) VALUES (1, N'Musculação')
INSERT [dbo].[setor] ([id_setor], [NomeSetor]) VALUES (2, N'Recepção')
INSERT [dbo].[setor] ([id_setor], [NomeSetor]) VALUES (3, N'Limpeza')
INSERT [dbo].[setor] ([id_setor], [NomeSetor]) VALUES (4, N'Vendas')
SET IDENTITY_INSERT [dbo].[setor] OFF
GO
SET IDENTITY_INSERT [dbo].[cargo] ON 

INSERT [dbo].[cargo] ([id_cargo], [NomeCargo]) VALUES (1, N'Professor')
INSERT [dbo].[cargo] ([id_cargo], [NomeCargo]) VALUES (2, N'Recepcionista')
INSERT [dbo].[cargo] ([id_cargo], [NomeCargo]) VALUES (3, N'Auxiliar')
INSERT [dbo].[cargo] ([id_cargo], [NomeCargo]) VALUES (4, N'Consultor')
SET IDENTITY_INSERT [dbo].[cargo] OFF
GO
SET IDENTITY_INSERT [dbo].[funcionario] ON 

INSERT [dbo].[funcionario] ([id_funcionario], [id_setor], [id_cargo], [NomeFuncionario], [cpf], [salario], [data_contratacao]) VALUES (1, 1, 1, N'Renato Cariani', N'999.888.777-66', CAST(7500.00 AS Decimal(10, 2)), CAST(N'2025-01-10' AS Date))
INSERT [dbo].[funcionario] ([id_funcionario], [id_setor], [id_cargo], [NomeFuncionario], [cpf], [salario], [data_contratacao]) VALUES (2, 1, 1, N'Julio Balestrin', N'888.777.666-55', CAST(7500.00 AS Decimal(10, 2)), CAST(N'2025-01-15' AS Date))
INSERT [dbo].[funcionario] ([id_funcionario], [id_setor], [id_cargo], [NomeFuncionario], [cpf], [salario], [data_contratacao]) VALUES (3, 2, 2, N'Muzy Responde', N'777.666.555-44', CAST(4500.00 AS Decimal(10, 2)), CAST(N'2025-02-20' AS Date))
INSERT [dbo].[funcionario] ([id_funcionario], [id_setor], [id_cargo], [NomeFuncionario], [cpf], [salario], [data_contratacao]) VALUES (4, 4, 4, N'Leo Stronda', N'666.555.444-33', CAST(5000.00 AS Decimal(10, 2)), CAST(N'2025-03-01' AS Date))
SET IDENTITY_INSERT [dbo].[funcionario] OFF
GO
SET IDENTITY_INSERT [dbo].[aluno] ON 

INSERT [dbo].[aluno] ([id_aluno], [NomeAluno], [cpf], [data_nasc], [sexo], [Telefone_Aluno], [Email_Aluno]) VALUES (1, N'Ramon Dino', N'111.111.111-11', CAST(N'1995-08-05' AS Date), N'M', N'2191111-1111', N'dino@pro.com')
INSERT [dbo].[aluno] ([id_aluno], [NomeAluno], [cpf], [data_nasc], [sexo], [Telefone_Aluno], [Email_Aluno]) VALUES (2, N'Chris Bumstead', N'222.222.222-22', CAST(N'1995-02-02' AS Date), N'M', N'2192222-2222', N'cbum@classic.com')
INSERT [dbo].[aluno] ([id_aluno], [NomeAluno], [cpf], [data_nasc], [sexo], [Telefone_Aluno], [Email_Aluno]) VALUES (3, N'Francielle Mattos', N'333.333.333-33', CAST(N'1986-04-15' AS Date), N'F', N'2193333-3333', N'fran.wellness@email.com')
INSERT [dbo].[aluno] ([id_aluno], [NomeAluno], [cpf], [data_nasc], [sexo], [Telefone_Aluno], [Email_Aluno]) VALUES (4, N'Rafael Brandao', N'444.444.444-44', CAST(N'1993-06-24' AS Date), N'M', N'2194444-4444', N'brandao@pro.com')
INSERT [dbo].[aluno] ([id_aluno], [NomeAluno], [cpf], [data_nasc], [sexo], [Telefone_Aluno], [Email_Aluno]) VALUES (5, N'Isa Pecini', N'555.555.555-55', CAST(N'1997-01-20' AS Date), N'F', N'2195555-5555', N'isa.bikini@email.com')
SET IDENTITY_INSERT [dbo].[aluno] OFF
GO
SET IDENTITY_INSERT [dbo].[aparelho] ON 

INSERT [dbo].[aparelho] ([id_aparelho], [nomeAparelho], [marcaAparelho], [valor], [status], [datacompra_aparelho], [datavenda_aparelho]) VALUES (1, N'Leg Press 45', N'Matrix', CAST(8500.00 AS Decimal(10, 2)), N'Disponivel', CAST(N'2025-10-10' AS Date), NULL)
INSERT [dbo].[aparelho] ([id_aparelho], [nomeAparelho], [marcaAparelho], [valor], [status], [datacompra_aparelho], [datavenda_aparelho]) VALUES (2, N'Crossover Profissional', N'Movement', CAST(12000.00 AS Decimal(10, 2)), N'Disponivel', CAST(N'2025-11-15' AS Date), NULL)
INSERT [dbo].[aparelho] ([id_aparelho], [nomeAparelho], [marcaAparelho], [valor], [status], [datacompra_aparelho], [datavenda_aparelho]) VALUES (3, N'Cadeira Extensora', N'Technogym', CAST(7200.00 AS Decimal(10, 2)), N'Manutencao', CAST(N'2026-01-20' AS Date), NULL)
INSERT [dbo].[aparelho] ([id_aparelho], [nomeAparelho], [marcaAparelho], [valor], [status], [datacompra_aparelho], [datavenda_aparelho]) VALUES (4, N'Supino Articulado', N'Hammer Strength', CAST(5500.00 AS Decimal(10, 2)), N'Disponivel', CAST(N'2025-12-05' AS Date), NULL)
INSERT [dbo].[aparelho] ([id_aparelho], [nomeAparelho], [marcaAparelho], [valor], [status], [datacompra_aparelho], [datavenda_aparelho]) VALUES (5, N'Esteira Hi-Tech', N'Life Fitness', CAST(15000.00 AS Decimal(10, 2)), N'Disponivel', CAST(N'2026-03-10' AS Date), NULL)
INSERT [dbo].[aparelho] ([id_aparelho], [nomeAparelho], [marcaAparelho], [valor], [status], [datacompra_aparelho], [datavenda_aparelho]) VALUES (6, N'Peck Deck (Voador)', N'Movement', CAST(4800.00 AS Decimal(10, 2)), N'Vendido', CAST(N'2024-05-20' AS Date), NULL)
INSERT [dbo].[aparelho] ([id_aparelho], [nomeAparelho], [marcaAparelho], [valor], [status], [datacompra_aparelho], [datavenda_aparelho]) VALUES (7, N'Hack Squat', N'Matrix', CAST(9300.00 AS Decimal(10, 2)), N'Disponivel', CAST(N'2026-02-25' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[aparelho] OFF
GO
SET IDENTITY_INSERT [dbo].[exercicio] ON 

INSERT [dbo].[exercicio] ([id_exercicio], [NomeExercicio], [id_aparelho]) VALUES (1, N'Extensão de Perna', 3)
INSERT [dbo].[exercicio] ([id_exercicio], [NomeExercicio], [id_aparelho]) VALUES (2, N'Leg Press Pesado', 1)
INSERT [dbo].[exercicio] ([id_exercicio], [NomeExercicio], [id_aparelho]) VALUES (3, N'Peitoral no Cross', 2)
INSERT [dbo].[exercicio] ([id_exercicio], [NomeExercicio], [id_aparelho]) VALUES (4, N'Tríceps Pulley', 2)
INSERT [dbo].[exercicio] ([id_exercicio], [NomeExercicio], [id_aparelho]) VALUES (5, N'Supino Maquina', 4)
INSERT [dbo].[exercicio] ([id_exercicio], [NomeExercicio], [id_aparelho]) VALUES (6, N'Agachamento Hack', 7)
SET IDENTITY_INSERT [dbo].[exercicio] OFF
GO
SET IDENTITY_INSERT [dbo].[treino] ON 

INSERT [dbo].[treino] ([id_treino], [id_aluno], [id_exercicio], [id_funcionario], [nome_ficha], [data_treino], [series], [repeticoes], [descanso_segundos]) VALUES (1, 1, 2, 1, N'A', CAST(N'2026-04-20' AS Date), 4, 10, 90)
INSERT [dbo].[treino] ([id_treino], [id_aluno], [id_exercicio], [id_funcionario], [nome_ficha], [data_treino], [series], [repeticoes], [descanso_segundos]) VALUES (2, 2, 3, 2, N'A', CAST(N'2026-04-20' AS Date), 4, 12, 60)
INSERT [dbo].[treino] ([id_treino], [id_aluno], [id_exercicio], [id_funcionario], [nome_ficha], [data_treino], [series], [repeticoes], [descanso_segundos]) VALUES (3, 1, 4, 1, N'B', CAST(N'2026-04-20' AS Date), 3, 15, 45)
SET IDENTITY_INSERT [dbo].[treino] OFF
GO
SET IDENTITY_INSERT [dbo].[presenca] ON 

INSERT [dbo].[presenca] ([id_presenca], [id_aluno], [data_entrada], [data_saida], [status]) VALUES (3, 1, CAST(N'2026-04-20T06:30:00.000' AS DateTime), CAST(N'2026-04-20T08:00:00.000' AS DateTime), N'Treino Concluído')
INSERT [dbo].[presenca] ([id_presenca], [id_aluno], [data_entrada], [data_saida], [status]) VALUES (4, 2, CAST(N'2026-04-20T07:15:00.000' AS DateTime), CAST(N'2026-04-20T08:45:00.000' AS DateTime), N'Treino Concluído')
INSERT [dbo].[presenca] ([id_presenca], [id_aluno], [data_entrada], [data_saida], [status]) VALUES (5, 3, CAST(N'2026-04-20T17:00:00.000' AS DateTime), CAST(N'2026-04-20T18:30:00.000' AS DateTime), N'Treino Concluído')
INSERT [dbo].[presenca] ([id_presenca], [id_aluno], [data_entrada], [data_saida], [status]) VALUES (6, 4, CAST(N'2026-04-20T18:00:00.000' AS DateTime), NULL, N'Em Treinamento')
INSERT [dbo].[presenca] ([id_presenca], [id_aluno], [data_entrada], [data_saida], [status]) VALUES (7, 5, CAST(N'2026-04-20T19:00:00.000' AS DateTime), NULL, N'Em Treinamento')
SET IDENTITY_INSERT [dbo].[presenca] OFF
GO
SET IDENTITY_INSERT [dbo].[planoAluno] ON 

INSERT [dbo].[planoAluno] ([id_plano], [NomePlano], [Mensalidade], [Duracao]) VALUES (1, N'Anual Black', CAST(119.90 AS Decimal(10, 2)), 12)
INSERT [dbo].[planoAluno] ([id_plano], [NomePlano], [Mensalidade], [Duracao]) VALUES (2, N'Mensal Basic', CAST(159.90 AS Decimal(10, 2)), 1)
SET IDENTITY_INSERT [dbo].[planoAluno] OFF
GO
SET IDENTITY_INSERT [dbo].[matricula] ON 

INSERT [dbo].[matricula] ([id_matricula], [id_aluno], [id_plano], [preco_historico], [data_inicio], [data_fim], [status]) VALUES (1000, 1, 1, CAST(119.90 AS Decimal(10, 2)), CAST(N'2026-04-20' AS Date), CAST(N'2027-04-20' AS Date), N'Ativa')
INSERT [dbo].[matricula] ([id_matricula], [id_aluno], [id_plano], [preco_historico], [data_inicio], [data_fim], [status]) VALUES (1001, 2, 1, CAST(119.90 AS Decimal(10, 2)), CAST(N'2026-04-20' AS Date), CAST(N'2027-04-20' AS Date), N'Ativa')
INSERT [dbo].[matricula] ([id_matricula], [id_aluno], [id_plano], [preco_historico], [data_inicio], [data_fim], [status]) VALUES (1002, 3, 1, CAST(119.90 AS Decimal(10, 2)), CAST(N'2026-04-20' AS Date), CAST(N'2027-04-20' AS Date), N'Ativa')
INSERT [dbo].[matricula] ([id_matricula], [id_aluno], [id_plano], [preco_historico], [data_inicio], [data_fim], [status]) VALUES (1003, 4, 2, CAST(159.90 AS Decimal(10, 2)), CAST(N'2026-04-20' AS Date), CAST(N'2026-05-20' AS Date), N'Ativa')
INSERT [dbo].[matricula] ([id_matricula], [id_aluno], [id_plano], [preco_historico], [data_inicio], [data_fim], [status]) VALUES (1004, 5, 2, CAST(159.90 AS Decimal(10, 2)), CAST(N'2026-04-20' AS Date), CAST(N'2026-05-20' AS Date), N'Ativa')
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
INSERT [dbo].[pagamento] ([id_pagamento], [id_matricula], [id_forma_pgto], [valor_pago], [data_vencimento], [data_pagamento]) VALUES (6, 1000, 1, CAST(119.90 AS Decimal(10, 2)), CAST(N'2026-04-20' AS Date), CAST(N'2026-04-20' AS Date))
INSERT [dbo].[pagamento] ([id_pagamento], [id_matricula], [id_forma_pgto], [valor_pago], [data_vencimento], [data_pagamento]) VALUES (7, 1001, 3, CAST(119.90 AS Decimal(10, 2)), CAST(N'2026-04-20' AS Date), CAST(N'2026-04-20' AS Date))
INSERT [dbo].[pagamento] ([id_pagamento], [id_matricula], [id_forma_pgto], [valor_pago], [data_vencimento], [data_pagamento]) VALUES (8, 1002, 2, CAST(119.90 AS Decimal(10, 2)), CAST(N'2026-04-20' AS Date), CAST(N'2026-04-20' AS Date))
INSERT [dbo].[pagamento] ([id_pagamento], [id_matricula], [id_forma_pgto], [valor_pago], [data_vencimento], [data_pagamento]) VALUES (9, 1003, 1, CAST(159.90 AS Decimal(10, 2)), CAST(N'2026-04-20' AS Date), CAST(N'2026-04-20' AS Date))
SET IDENTITY_INSERT [dbo].[pagamento] OFF
GO
SET IDENTITY_INSERT [dbo].[manutencaoAparelho] ON 

INSERT [dbo].[manutencaoAparelho] ([id_manutencao], [id_aparelho], [id_funcionario], [descricaoproblema], [custo_reparo], [datamanutencao]) VALUES (2, 3, 1, N'Troca de cabo de aço', CAST(250.00 AS Decimal(10, 2)), CAST(N'2026-04-20' AS Date))
INSERT [dbo].[manutencaoAparelho] ([id_manutencao], [id_aparelho], [id_funcionario], [descricaoproblema], [custo_reparo], [datamanutencao]) VALUES (3, 7, 2, N'Lubrificação dos trilhos', CAST(120.00 AS Decimal(10, 2)), CAST(N'2026-04-20' AS Date))
SET IDENTITY_INSERT [dbo].[manutencaoAparelho] OFF
GO
