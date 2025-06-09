-- Script de Inserts para as tabelas

-- Inserts para a tabela EstacaoClimatica
INSERT INTO EstacaoClimatica (id_estacao, nome, latitude, longitude, localizacao_detalhada) VALUES
(1, 'Estação Central SP', -23.550520, -46.633308, 'Centro de São Paulo, próximo à Praça da Sé'),
(2, 'Estação Zona Leste SP', -23.548900, -46.500000, 'Parque do Carmo, Itaquera'),
(3, 'Estação Zona Oeste SP', -23.561350, -46.721510, 'Próximo à USP, Butantã'),
(4, 'Estação Zona Norte SP', -23.491200, -46.600000, 'Horto Florestal, Santana'),
(5, 'Estação Zona Sul SP', -23.682100, -46.697600, 'Represa Guarapiranga, Interlagos'),
(6, 'Estação Litoral SP', -23.960800, -46.333900, 'Praia do Gonzaga, Santos');

-- Inserts para a tabela LeituraClimatica
INSERT INTO LeituraClimatica (id_leitura, id_estacao, data_hora, temperatura, umidade, status_alerta) VALUES
(1, 1, '2025-06-07 10:00:00', 25.5, 60.2, 'Normal'),
(2, 1, '2025-06-07 11:00:00', 26.0, 61.5, 'Normal'),
(3, 2, '2025-06-07 10:30:00', 28.1, 75.0, 'Atencao'),
(4, 3, '2025-06-07 09:45:00', 22.3, 55.1, 'Normal'),
(5, 4, '2025-06-07 12:00:00', 29.0, 80.5, 'Critico'),
(6, 5, '2025-06-07 13:15:00', 24.8, 65.0, 'Normal'),
(7, 6, '2025-06-07 14:00:00', 27.2, 88.0, 'Atencao');

-- Inserts para a tabela Abrigo
INSERT INTO Abrigo (id_abrigo, nome, latitude, longitude, endereco, capacidade, contato) VALUES
(1, 'Abrigo Esperança SP', -23.540000, -46.630000, 'Rua da Paz, 123 - Centro, São Paulo', 100, 'contato@abrigoesperanca.org'),
(2, 'Abrigo Novo Lar SP', -23.550000, -46.510000, 'Av. Liberdade, 456 - Itaquera, São Paulo', 150, '(11) 98765-4321'),
(3, 'Abrigo da Comunidade SP', -23.570000, -46.700000, 'Praça do Sol, 789 - Butantã, São Paulo', 80, 'comunidade.abrigo@email.com'),
(4, 'Casa Acolhedora SP', -23.480000, -46.610000, 'Travessa das Flores, 10 - Santana, São Paulo', 120, '(11) 3210-9876'),
(5, 'Abrigo Amigo SP', -23.670000, -46.700000, 'Rua do Bosque, 55 - Interlagos, São Paulo', 90, 'abrigoamigo@outlook.com'),
(6, 'Abrigo Beira Mar Santos', -23.955000, -46.335000, 'Av. Presidente Wilson, 200 - Gonzaga, Santos', 70, '(13) 3333-4444');

-- Inserts para a tabela EventoClimatico
INSERT INTO EventoClimatico (id_evento, tipo_evento, descricao, data_inicio, data_fim, id_estacao) VALUES
(1, 'Chuva Forte', 'Previsão de chuvas intensas com risco de alagamento na região central.', '2025-06-08', '2025-06-09', 1),
(2, 'Onda de Calor', 'Temperaturas elevadas e baixa umidade do ar na Zona Leste.', '2025-06-10', '2025-06-13', 2),
(3, 'Vendaval', 'Ventos fortes atingindo a região oeste de São Paulo.', '2025-06-07', '2025-06-07', 3),
(4, 'Neblina Intensa', 'Redução de visibilidade na zona norte de São Paulo, afetando o trânsito.', '2025-06-09', NULL, 4),
(5, 'Geada Leve', 'Possibilidade de geada nas primeiras horas do dia na Zona Sul.', '2025-06-12', NULL, 5),
(6, 'Ressaca Marítima', 'Ondas grandes e perigosas no litoral de Santos.', '2025-06-08', '2025-06-09', 6);

-- Inserts para a tabela Pessoa
INSERT INTO Pessoa (id_pessoa, nome, documento, contato) VALUES
(1, 'João Silva', '123.456.789-00', '(11) 99999-1111'),
(2, 'Maria Souza', '987.654.321-00', '(11) 98888-2222'),
(3, 'Pedro Santos', '111.222.333-44', '(11) 97777-3333'),
(4, 'Ana Costa', '444.555.666-77', '(11) 96666-4444'),
(5, 'Carlos Oliveira', '777.888.999-00', '(11) 95555-5555'),
(6, 'Mariana Gomes', '222.333.444-55', '(11) 94444-6666');

-- Inserts para a tabela AbrigoPessoa
INSERT INTO AbrigoPessoa (id_abrigo, id_pessoa, data_entrada, data_saida) VALUES
(1, 1, '2025-06-07 08:00:00', NULL),
(1, 2, '2025-06-07 09:00:00', '2025-06-07 18:00:00'),
(2, 3, '2025-06-07 10:00:00', NULL),
(3, 4, '2025-06-07 11:00:00', NULL),
(4, 5, '2025-06-07 12:00:00', NULL),
(1, 3, '2025-06-08 07:00:00', NULL),
(6, 6, '2025-06-08 09:00:00', NULL);

-- Inserts para a tabela ManutencaoEstacao
INSERT INTO ManutencaoEstacao (id_manutencao, id_estacao, data_manutencao, descricao, status) VALUES
(1, 1, '2025-05-15', 'Troca de sensores de temperatura e umidade.', 'Concluida'),
(2, 2, '2025-06-01', 'Verificação do sistema de transmissão de dados.', 'Em andamento'),
(3, 3, '2025-06-10', 'Calibragem de equipamentos.', 'Pendente'),
(4, 4, '2025-05-20', 'Limpeza e inspeção geral.', 'Concluida'),
(5, 5, '2025-06-05', 'Reparo em módulo de energia.', 'Concluida'),
(6, 6, '2025-06-06', 'Verificação de corrosão em equipamentos próximos ao mar.', 'Pendente');

-- Inserts para a tabela Alerta
INSERT INTO Alerta (id_alerta, id_estacao, tipo_alerta, mensagem, data_hora) VALUES
(1, 1, 'Inundação', 'Risco de inundação em áreas de baixa altitude no centro.', '2025-06-07 11:30:00'),
(2, 2, 'Incêndio Florestal', 'Risco elevado de incêndio devido à seca na Zona Leste.', '2025-06-07 10:45:00'),
(3, 3, 'Ventos Fortes', 'Recomenda-se precaução ao sair de casa na Zona Oeste.', '2025-06-07 09:50:00'),
(4, 4, 'Nevoeiro Denso', 'Redução drástica da visibilidade na rodovia da Zona Norte.', '2025-06-07 12:15:00'),
(5, 5, 'Baixa Temperatura', 'Possibilidade de geada nas próximas horas na Zona Sul.', '2025-06-07 13:30:00'),
(6, 6, 'Maré Alta', 'Aviso de maré alta com risco de alagamento em áreas costeiras.', '2025-06-08 06:00:00');