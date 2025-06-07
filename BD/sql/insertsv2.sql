-- Pais
INSERT INTO tbl_pais (nome_pais) VALUES ('Brasil');
INSERT INTO tbl_pais (nome_pais) VALUES ('Argentina');
INSERT INTO tbl_pais (nome_pais) VALUES ('Chile');
INSERT INTO tbl_pais (nome_pais) VALUES ('Uruguai');
INSERT INTO tbl_pais (nome_pais) VALUES ('Paraguai');

-- Status Reservatório
INSERT INTO tbl_status_reservatorio (status) VALUES ('Cheio');
INSERT INTO tbl_status_reservatorio (status) VALUES ('Normal');
INSERT INTO tbl_status_reservatorio (status) VALUES ('Baixo');
INSERT INTO tbl_status_reservatorio (status) VALUES ('Crítico');
INSERT INTO tbl_status_reservatorio (status) VALUES ('Esvaziado');

-- Status Alerta
INSERT INTO tbl_status_alerta (status) VALUES ('Ativo');
INSERT INTO tbl_status_alerta (status) VALUES ('Resolvido');
INSERT INTO tbl_status_alerta (status) VALUES ('Ignorado');
INSERT INTO tbl_status_alerta (status) VALUES ('Aguardando');
INSERT INTO tbl_status_alerta (status) VALUES ('Crítico');

-- Dispositivo
INSERT INTO tbl_dispositivo (data_instalacao) VALUES (SYSTIMESTAMP);
INSERT INTO tbl_dispositivo (data_instalacao) VALUES (SYSTIMESTAMP);
INSERT INTO tbl_dispositivo (data_instalacao) VALUES (SYSTIMESTAMP);
INSERT INTO tbl_dispositivo (data_instalacao) VALUES (SYSTIMESTAMP);
INSERT INTO tbl_dispositivo (data_instalacao) VALUES (SYSTIMESTAMP);

-- Usuário
INSERT INTO tbl_usuario (nome, email, senha) VALUES ('Vinicius Saes', 'vinicius@gmail.com', 'eyJhbGciOiJIUzI1NiJ9.MTIzNDU.8vdUrxG6zss8RZxT4Ky0Rp1WT3sde4lcb0dWvqu8rRY');
INSERT INTO tbl_usuario (nome, email, senha) VALUES ('Maria Paixão', 'maria@gmail.com', 'eyJhbGciOiJIUzI1NiJ9.Njc4OQ.uLHBGCXAfeWBrWioZWgT9RhI7Ks0b466pMHO_o8CfDs');
INSERT INTO tbl_usuario (nome, email, senha) VALUES ('Laura Cintra', 'laura@gmail.com', 'eyJhbGciOiJIUzI1NiJ9.Njc4OQ.uLHBGCXAfeWBrWioZWgT9RhI7Ks0b466pMHO_o8CfDs');
INSERT INTO tbl_usuario (nome, email, senha) VALUES ('João Silva', 'joao@gmail.com', 'eyJhbGciOiJIUzI1NiJ9.Njc4OQ.uLHBGCXAfeWBrWioZWgT9RhI7Ks0b466pMHO_o8CfDs');
INSERT INTO tbl_usuario (nome, email, senha) VALUES ('Rafael Costa', 'rafael@gmail.com', 'eyJhbGciOiJIUzI1NiJ9.MTIzNDU.8vdUrxG6zss8RZxT4Ky0Rp1WT3sde4lcb0dWvqu8rRY');

-- 2. Tabelas com dependência de primeiro nível
-- Estado (depende de Pais)
INSERT INTO tbl_estado (nome_estado, id_pais) VALUES ('São Paulo', 1);
INSERT INTO tbl_estado (nome_estado, id_pais) VALUES ('Minas Gerais', 1);
INSERT INTO tbl_estado (nome_estado, id_pais) VALUES ('Rio de Janeiro', 1);
INSERT INTO tbl_estado (nome_estado, id_pais) VALUES ('Bahia', 1);
INSERT INTO tbl_estado (nome_estado, id_pais) VALUES ('Paraná', 1);

-- Unidade (depende de Usuario)
INSERT INTO tbl_unidade (nome, capacidade_total_litros, id_usuario) VALUES ('Edifício Solar', 1000, 1);
INSERT INTO tbl_unidade (nome, capacidade_total_litros, id_usuario) VALUES ('Condomínio das Águas', 2000, 2);
INSERT INTO tbl_unidade (nome, capacidade_total_litros, id_usuario) VALUES ('Residencial Verde', 1500, 3);
INSERT INTO tbl_unidade (nome, capacidade_total_litros, id_usuario) VALUES ('Vila Mar Azul', 1200, 4);
INSERT INTO tbl_unidade (nome, capacidade_total_litros, id_usuario) VALUES ('Torre Bella Vista', 1800, 5);

-- 3. Tabelas com dependência de segundo nível
-- Cidade (depende de Estado)
INSERT INTO tbl_cidade (nome_cidade, id_estado) VALUES ('São Paulo', 1);
INSERT INTO tbl_cidade (nome_cidade, id_estado) VALUES ('Campinas', 1);
INSERT INTO tbl_cidade (nome_cidade, id_estado) VALUES ('Belo Horizonte', 2);
INSERT INTO tbl_cidade (nome_cidade, id_estado) VALUES ('Curitiba', 5);
INSERT INTO tbl_cidade (nome_cidade, id_estado) VALUES ('Salvador', 4);

-- Reservatório (depende de Unidade)
INSERT INTO tbl_reservatorio (nome, capacidade_total_litros, id_unidade) VALUES ('Reservatório A', 500, 1);
INSERT INTO tbl_reservatorio (nome, capacidade_total_litros, id_unidade) VALUES ('Reservatório B', 1000, 2);
INSERT INTO tbl_reservatorio (nome, capacidade_total_litros, id_unidade) VALUES ('Reservatório C', 750, 3);
INSERT INTO tbl_reservatorio (nome, capacidade_total_litros, id_unidade) VALUES ('Reservatório D', 600, 4);
INSERT INTO tbl_reservatorio (nome, capacidade_total_litros, id_unidade) VALUES ('Reservatório E', 800, 5);

-- 4. Tabelas com dependências complexas
-- Endereço (depende de Cidade e Unidade)
INSERT INTO tbl_endereco (logradouro, numero, complemento, cep, id_cidade, id_unidade) VALUES ('Rua A', 100, NULL, '01001000', 1, 1);
INSERT INTO tbl_endereco (logradouro, numero, complemento, cep, id_cidade, id_unidade) VALUES ('Av. Central', 500, NULL, '13030000', 2, 2);
INSERT INTO tbl_endereco (logradouro, numero, complemento, cep, id_cidade, id_unidade) VALUES ('Rua Verde', 222, 'Ap 3', '30100000', 3, 3);
INSERT INTO tbl_endereco (logradouro, numero, complemento, cep, id_cidade, id_unidade) VALUES ('Rua das Flores', 44, NULL, '80010000', 4, 4);
INSERT INTO tbl_endereco (logradouro, numero, complemento, cep, id_cidade, id_unidade) VALUES ('Travessa B', 12, NULL, '40020000', 5, 5);

-- Histórico Reservatório (depende de Reservatório e Status_Reservatório)
INSERT INTO tbl_historico_reservatorio (nivel_litros, id_reservatorio, id_status_reservatorio) VALUES (450, 1, 1);
INSERT INTO tbl_historico_reservatorio (nivel_litros, id_reservatorio, id_status_reservatorio) VALUES (300, 2, 3);
INSERT INTO tbl_historico_reservatorio (nivel_litros, id_reservatorio, id_status_reservatorio) VALUES (700, 3, 2);
INSERT INTO tbl_historico_reservatorio (nivel_litros, id_reservatorio, id_status_reservatorio) VALUES (100, 4, 4);
INSERT INTO tbl_historico_reservatorio (nivel_litros, id_reservatorio, id_status_reservatorio) VALUES (0, 5, 5);
INSERT INTO tbl_historico_reservatorio (nivel_litros, id_reservatorio, id_status_reservatorio) VALUES (800, 1, 1);

-- Reservatório Dispositivo (depende de Dispositivo e Reservatório)
INSERT INTO tbl_reservatorio_dispositivo (id_dispositivo, id_reservatorio) VALUES (1, 1);
INSERT INTO tbl_reservatorio_dispositivo (id_dispositivo, id_reservatorio) VALUES (2, 2);
INSERT INTO tbl_reservatorio_dispositivo (id_dispositivo, id_reservatorio) VALUES (3, 3);
INSERT INTO tbl_reservatorio_dispositivo (id_dispositivo, id_reservatorio) VALUES (4, 4);
INSERT INTO tbl_reservatorio_dispositivo (id_dispositivo, id_reservatorio) VALUES (5, 5);

-- Leitura Dispositivo (depende de Dispositivo)
INSERT INTO tbl_leitura_dispositivo (nivel_pct, turbidez_ntu, ph_int, id_dispositivo) VALUES (90, 12, 6.5, 1);
INSERT INTO tbl_leitura_dispositivo (nivel_pct, turbidez_ntu, ph_int, id_dispositivo) VALUES (75, 10, 7.0, 2);
INSERT INTO tbl_leitura_dispositivo (nivel_pct, turbidez_ntu, ph_int, id_dispositivo) VALUES (60, 15, 6.8, 3);
INSERT INTO tbl_leitura_dispositivo (nivel_pct, turbidez_ntu, ph_int, id_dispositivo) VALUES (30, 20, 6.3, 4);
INSERT INTO tbl_leitura_dispositivo (nivel_pct, turbidez_ntu, ph_int, id_dispositivo) VALUES (10, 25, 5.9, 5);

-- Clima Resumo Semanal (depende de Cidade)
INSERT INTO tbl_clima_resumo_sem (media_chance_chuva, media_temperatura_max, media_temperatura_min, id_cidade) VALUES (85.5, 29.3, 19.0, 1);
INSERT INTO tbl_clima_resumo_sem (media_chance_chuva, media_temperatura_max, media_temperatura_min, id_cidade) VALUES (15.2, 25.1, 17.8, 2);
INSERT INTO tbl_clima_resumo_sem (media_chance_chuva, media_temperatura_max, media_temperatura_min, id_cidade) VALUES (60.0, 27.5, 18.0, 3);
INSERT INTO tbl_clima_resumo_sem (media_chance_chuva, media_temperatura_max, media_temperatura_min, id_cidade) VALUES (0.0, 30.0, 21.0, 4);
INSERT INTO tbl_clima_resumo_sem (media_chance_chuva, media_temperatura_max, media_temperatura_min, id_cidade) VALUES (95.0, 22.0, 16.5, 5);

-- Alerta (depende de Reservatório e Status_Alerta)
INSERT INTO tbl_alerta (mensagem, id_reservatorio, id_status_alerta) VALUES ('Reservatório quase cheio e previsão de chuva', 1, 1);
INSERT INTO tbl_alerta (mensagem, id_reservatorio, id_status_alerta) VALUES ('Reservatório baixo e previsão de seca', 2, 2);
INSERT INTO tbl_alerta (mensagem, id_reservatorio, id_status_alerta) VALUES ('Água em nível crítico', 3, 5);
INSERT INTO tbl_alerta (mensagem, id_reservatorio, id_status_alerta) VALUES ('Alerta preventivo: esvazie 10%', 4, 1);
INSERT INTO tbl_alerta (mensagem, id_reservatorio, id_status_alerta) VALUES ('Reaproveitamento ideal', 5, 2);

-- Verificar dados inseridos
-- SELECT 'tbl_pais: ' || COUNT(*) FROM tbl_pais;
-- SELECT 'tbl_estado: ' || COUNT(*) FROM tbl_estado;
-- SELECT 'tbl_cidade: ' || COUNT(*) FROM tbl_cidade;
-- SELECT 'tbl_usuario: ' || COUNT(*) FROM tbl_usuario;
-- SELECT 'tbl_unidade: ' || COUNT(*) FROM tbl_unidade;
-- SELECT 'tbl_endereco: ' || COUNT(*) FROM tbl_endereco;
-- SELECT 'tbl_reservatorio: ' || COUNT(*) FROM tbl_reservatorio;
-- SELECT 'tbl_status_reservatorio: ' || COUNT(*) FROM tbl_status_reservatorio;
-- SELECT 'tbl_historico_reservatorio: ' || COUNT(*) FROM tbl_historico_reservatorio;
-- SELECT 'tbl_dispositivo: ' || COUNT(*) FROM tbl_dispositivo;
-- SELECT 'tbl_reservatorio_dispositivo: ' || COUNT(*) FROM tbl_reservatorio_dispositivo;
-- SELECT 'tbl_leitura_dispositivo: ' || COUNT(*) FROM tbl_leitura_dispositivo;
-- SELECT 'tbl_clima_resumo_sem: ' || COUNT(*) FROM tbl_clima_resumo_sem;
-- SELECT 'tbl_status_alerta: ' || COUNT(*) FROM tbl_status_alerta;
-- SELECT 'tbl_alerta: ' || COUNT(*) FROM tbl_alerta;