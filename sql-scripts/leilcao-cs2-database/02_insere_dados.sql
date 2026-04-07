USE [Leilaocs2]
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id_user], [nome], [saldo]) VALUES (1, N'Pedro', CAST(3000.50 AS Decimal(18, 2)))
INSERT [dbo].[Users] ([id_user], [nome], [saldo]) VALUES (2, N'Ana', CAST(2000.00 AS Decimal(18, 2)))
INSERT [dbo].[Users] ([id_user], [nome], [saldo]) VALUES (3, N'Ana', CAST(15000.00 AS Decimal(18, 2)))
INSERT [dbo].[Users] ([id_user], [nome], [saldo]) VALUES (4, N'Maria', CAST(3730.11 AS Decimal(18, 2)))
INSERT [dbo].[Users] ([id_user], [nome], [saldo]) VALUES (5, N'Nathalia', CAST(20000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Catalogo] ON 

INSERT [dbo].[Catalogo] ([id_skin], [id_user], [NomeSkin], [pattern], [desgaste], [valor_min]) VALUES (1, 5, N'M9 Bayonet | Doppler', 421, CAST(0.007521000 AS Decimal(10, 9)), CAST(3800.00 AS Decimal(18, 2)))
INSERT [dbo].[Catalogo] ([id_skin], [id_user], [NomeSkin], [pattern], [desgaste], [valor_min]) VALUES (2, 2, N'AWP | Dragon Lore', 110, CAST(0.154200000 AS Decimal(10, 9)), CAST(12000.00 AS Decimal(18, 2)))
INSERT [dbo].[Catalogo] ([id_skin], [id_user], [NomeSkin], [pattern], [desgaste], [valor_min]) VALUES (3, 1, N'Glock-18 | Fade', 715, CAST(0.010000000 AS Decimal(10, 9)), CAST(2100.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Catalogo] OFF
GO
SET IDENTITY_INSERT [dbo].[Leilao] ON 

INSERT [dbo].[Leilao] ([id_leilao], [id_skin], [inicioleilao], [fimleilao], [statusleilao]) VALUES (1, 1, CAST(N'2026-07-04T10:00:00.000' AS DateTime), CAST(N'2026-10-04T18:00:00.000' AS DateTime), N'ATIVO')
INSERT [dbo].[Leilao] ([id_leilao], [id_skin], [inicioleilao], [fimleilao], [statusleilao]) VALUES (2, 3, CAST(N'2026-07-04T12:00:00.000' AS DateTime), CAST(N'2026-08-04T12:00:00.000' AS DateTime), N'ATIVO')
SET IDENTITY_INSERT [dbo].[Leilao] OFF
GO
SET IDENTITY_INSERT [dbo].[Lances] ON 

INSERT [dbo].[Lances] ([id_lances], [id_leilao], [id_user], [valorlance], [horalance]) VALUES (1, 1, 3, CAST(2300.00 AS Decimal(18, 2)), CAST(N'2026-07-04T14:30:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Lances] OFF
GO
