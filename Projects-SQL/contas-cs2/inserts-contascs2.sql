USE [ContasCS2]
GO
SET IDENTITY_INSERT [dbo].[contas] ON 

INSERT [dbo].[contas] ([id_conta], [nome_usuario], [level_conta], [premier], [wins], [xp_atual], [preco_prime], [status_drop_semanal], [status_conta], [data_adicao]) VALUES (1, N'Farmer01', 10, 15000, 50, 2500, CAST(75.00 AS Decimal(10, 2)), N'N', N'Livre', CAST(N'2026-04-24' AS Date))
INSERT [dbo].[contas] ([id_conta], [nome_usuario], [level_conta], [premier], [wins], [xp_atual], [preco_prime], [status_drop_semanal], [status_conta], [data_adicao]) VALUES (2, N'Farmer02', 5, 0, 10, 1200, CAST(75.00 AS Decimal(10, 2)), N'N', N'Livre', CAST(N'2026-04-24' AS Date))
INSERT [dbo].[contas] ([id_conta], [nome_usuario], [level_conta], [premier], [wins], [xp_atual], [preco_prime], [status_drop_semanal], [status_conta], [data_adicao]) VALUES (3, N'Farmer03', 12, 18200, 100, 4800, CAST(75.00 AS Decimal(10, 2)), N'N', N'Livre', CAST(N'2026-04-24' AS Date))
INSERT [dbo].[contas] ([id_conta], [nome_usuario], [level_conta], [premier], [wins], [xp_atual], [preco_prime], [status_drop_semanal], [status_conta], [data_adicao]) VALUES (4, N'Farmer04', 8, 12000, 35, 900, CAST(75.00 AS Decimal(10, 2)), N'N', N'30D', CAST(N'2026-04-24' AS Date))
INSERT [dbo].[contas] ([id_conta], [nome_usuario], [level_conta], [premier], [wins], [xp_atual], [preco_prime], [status_drop_semanal], [status_conta], [data_adicao]) VALUES (5, N'Farmer05', 2, 0, 5, 100, CAST(75.00 AS Decimal(10, 2)), N'N', N'Livre', CAST(N'2026-04-24' AS Date))
INSERT [dbo].[contas] ([id_conta], [nome_usuario], [level_conta], [premier], [wins], [xp_atual], [preco_prime], [status_drop_semanal], [status_conta], [data_adicao]) VALUES (6, N'Farmer06', 15, 21000, 200, 3000, CAST(75.00 AS Decimal(10, 2)), N'N', N'Livre', CAST(N'2026-04-24' AS Date))
INSERT [dbo].[contas] ([id_conta], [nome_usuario], [level_conta], [premier], [wins], [xp_atual], [preco_prime], [status_drop_semanal], [status_conta], [data_adicao]) VALUES (7, N'Farmer07', 7, 10500, 25, 4200, CAST(75.00 AS Decimal(10, 2)), N'N', N'Livre', CAST(N'2026-04-24' AS Date))
INSERT [dbo].[contas] ([id_conta], [nome_usuario], [level_conta], [premier], [wins], [xp_atual], [preco_prime], [status_drop_semanal], [status_conta], [data_adicao]) VALUES (8, N'Farmer08', 9, 13000, 42, 1500, CAST(75.00 AS Decimal(10, 2)), N'N', N'Livre', CAST(N'2026-04-24' AS Date))
INSERT [dbo].[contas] ([id_conta], [nome_usuario], [level_conta], [premier], [wins], [xp_atual], [preco_prime], [status_drop_semanal], [status_conta], [data_adicao]) VALUES (9, N'Farmer09', 4, 0, 8, 2000, CAST(75.00 AS Decimal(10, 2)), N'N', N'Livre', CAST(N'2026-04-24' AS Date))
SET IDENTITY_INSERT [dbo].[contas] OFF
GO
SET IDENTITY_INSERT [dbo].[drops] ON 

INSERT [dbo].[drops] ([id_drop], [id_conta], [caixa_nome], [item_nome], [enviado_main], [data_drop]) VALUES (1, 1, N'Kilowatt Case', N'Graffiti | Recoil (Green)', N'N', CAST(N'2026-04-24' AS Date))
INSERT [dbo].[drops] ([id_drop], [id_conta], [caixa_nome], [item_nome], [enviado_main], [data_drop]) VALUES (2, 2, N'Revolution Case', N'UMP-45 | Mud-Spec', N'N', CAST(N'2026-04-24' AS Date))
INSERT [dbo].[drops] ([id_drop], [id_conta], [caixa_nome], [item_nome], [enviado_main], [data_drop]) VALUES (3, 3, N'Dreams & Nightmares Case', N'Graffiti | Sealed (Salt)', N'N', CAST(N'2026-04-24' AS Date))
INSERT [dbo].[drops] ([id_drop], [id_conta], [caixa_nome], [item_nome], [enviado_main], [data_drop]) VALUES (4, 4, N'Kilowatt Case', N'P250 | Cassette', N'N', CAST(N'2026-04-24' AS Date))
INSERT [dbo].[drops] ([id_drop], [id_conta], [caixa_nome], [item_nome], [enviado_main], [data_drop]) VALUES (5, 5, N'Recoil Case', N'Graffiti | X-Axes (Red)', N'N', CAST(N'2026-04-24' AS Date))
INSERT [dbo].[drops] ([id_drop], [id_conta], [caixa_nome], [item_nome], [enviado_main], [data_drop]) VALUES (6, 6, N'Kilowatt Case', N'Galil AR | Sage Spray', N'N', CAST(N'2026-04-24' AS Date))
INSERT [dbo].[drops] ([id_drop], [id_conta], [caixa_nome], [item_nome], [enviado_main], [data_drop]) VALUES (7, 7, N'Snakebite Case', N'Graffiti | Little B (Blue)', N'N', CAST(N'2026-04-24' AS Date))
INSERT [dbo].[drops] ([id_drop], [id_conta], [caixa_nome], [item_nome], [enviado_main], [data_drop]) VALUES (8, 8, N'Revolution Case', N'Dual Berettas | Oil Change', N'N', CAST(N'2026-04-24' AS Date))
INSERT [dbo].[drops] ([id_drop], [id_conta], [caixa_nome], [item_nome], [enviado_main], [data_drop]) VALUES (9, 9, N'Dreams & Nightmares Case', N'Graffiti | Lambda (Yellow)', N'N', CAST(N'2026-04-24' AS Date))
SET IDENTITY_INSERT [dbo].[drops] OFF
GO
SET IDENTITY_INSERT [dbo].[historico_status] ON 

INSERT [dbo].[historico_status] ([id_log], [id_conta], [tipo_ban], [data_inicio], [data_fim]) VALUES (1, 4, N'30D', CAST(N'2026-04-24' AS Date), CAST(N'2026-05-24' AS Date))
SET IDENTITY_INSERT [dbo].[historico_status] OFF
GO
SET IDENTITY_INSERT [dbo].[vendas_lote] ON 

INSERT [dbo].[vendas_lote] ([id_venda], [data_venda], [valor_recebido_bruto], [valor_liquido]) VALUES (1, CAST(N'2026-04-24' AS Date), CAST(400.03 AS Decimal(10, 2)), CAST(250.01 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[vendas_lote] OFF
GO
