/*
DROP TABLE tbl_alerta;
DROP TABLE tbl_status_alerta;
DROP TABLE tbl_clima_resumo_sem;
DROP TABLE tbl_leitura_dispositivo;
DROP TABLE tbl_reservatorio_dispositivo;
DROP TABLE tbl_dispositivo;
DROP TABLE tbl_historico_reservatorio;
DROP TABLE tbl_status_reservatorio;
DROP TABLE tbl_reservatorio;
DROP TABLE tbl_endereco;
DROP TABLE tbl_unidade;
DROP TABLE tbl_usuario;
DROP TABLE tbl_cidade;
DROP TABLE tbl_estado;
DROP TABLE tbl_pais;
*/

SET SERVEROUTPUT ON;

-- Inserts usando procedures

-- País
CALL insert_tbl_pais('Brasil');
CALL insert_tbl_pais('Argentina');
CALL insert_tbl_pais('Chile');
CALL insert_tbl_pais('Uruguai');
CALL insert_tbl_pais('Paraguai');

-- Estado
CALL insert_tbl_estado('São Paulo', 1);
CALL insert_tbl_estado('Minas Gerais', 1);
CALL insert_tbl_estado('Rio de Janeiro', 1);
CALL insert_tbl_estado('Bahia', 1);
CALL insert_tbl_estado('Paraná', 1);

-- Cidade
CALL insert_tbl_cidade('São Paulo', 1);
CALL insert_tbl_cidade('Campinas', 1);
CALL insert_tbl_cidade('Belo Horizonte', 2);
CALL insert_tbl_cidade('Curitiba', 5);
CALL insert_tbl_cidade('Salvador', 4);

-- Usuário
CALL insert_tbl_usuario('Vinicius Saes', 'vinicius@gmail.com', 'eyJhbGciOiJIUzI1NiJ9.MTIzNDU.8vdUrxG6zss8RZxT4Ky0Rp1WT3sde4lcb0dWvqu8rRY'); -- 12345
CALL insert_tbl_usuario('Maria Paixão', 'maria@gmail.com', 'eyJhbGciOiJIUzI1NiJ9.Njc4OQ.uLHBGCXAfeWBrWioZWgT9RhI7Ks0b466pMHO_o8CfDs'); --6789
CALL insert_tbl_usuario('Laura Cintra', 'laura@gmail.com', 'eyJhbGciOiJIUzI1NiJ9.Njc4OQ.uLHBGCXAfeWBrWioZWgT9RhI7Ks0b466pMHO_o8CfDs'); --6789
CALL insert_tbl_usuario('João Silva', 'joao@gmail.com', 'eyJhbGciOiJIUzI1NiJ9.Njc4OQ.uLHBGCXAfeWBrWioZWgT9RhI7Ks0b466pMHO_o8CfDs'); --6789
CALL insert_tbl_usuario('Rafael Costa', 'rafael@gmail.com', 'eyJhbGciOiJIUzI1NiJ9.MTIzNDU.8vdUrxG6zss8RZxT4Ky0Rp1WT3sde4lcb0dWvqu8rRY'); -- 12345

-- Unidade
CALL insert_tbl_unidade('Edifício Solar', 1000, 1);
CALL insert_tbl_unidade('Condomínio das Águas', 2000, 2);
CALL insert_tbl_unidade('Residencial Verde', 1500, 3);
CALL insert_tbl_unidade('Vila Mar Azul', 1200, 4);
CALL insert_tbl_unidade('Torre Bella Vista', 1800, 5);

-- Endereço
CALL insert_tbl_endereco('Rua A', 100, NULL, '01001000', 1, 1);
CALL insert_tbl_endereco('Av. Central', 500, NULL, '13030000', 2, 2);
CALL insert_tbl_endereco('Rua Verde', 222, 'Ap 3', '30100000', 3, 3);
CALL insert_tbl_endereco('Rua das Flores', 44, NULL, '80010000', 4, 4);
CALL insert_tbl_endereco('Travessa B', 12, NULL, '40020000', 5, 5);

-- Reservatório
CALL insert_tbl_reservatorio('Reservatório A', 500, 1);
CALL insert_tbl_reservatorio('Reservatório B', 1000, 2);
CALL insert_tbl_reservatorio('Reservatório C', 750, 3);
CALL insert_tbl_reservatorio('Reservatório D', 600, 4);
CALL insert_tbl_reservatorio('Reservatório E', 800, 5);

-- Status Reservatório
CALL insert_tbl_status_reservatorio('Cheio');
CALL insert_tbl_status_reservatorio('Normal');
CALL insert_tbl_status_reservatorio('Baixo');
CALL insert_tbl_status_reservatorio('Crítico');
CALL insert_tbl_status_reservatorio('Esvaziado');

-- Histórico Reservatório
CALL insert_tbl_historico_reservatorio(450, 1, 1);
CALL insert_tbl_historico_reservatorio(300, 2, 3);
CALL insert_tbl_historico_reservatorio(700, 3, 2);
CALL insert_tbl_historico_reservatorio(100, 4, 4);
CALL insert_tbl_historico_reservatorio(0, 5, 5);
CALL insert_tbl_historico_reservatorio(800, 1, 1);


-- Dispositivo
CALL insert_tbl_dispositivo();
CALL insert_tbl_dispositivo();
CALL insert_tbl_dispositivo();
CALL insert_tbl_dispositivo();
CALL insert_tbl_dispositivo();


-- Reservatório Dispositivo
CALL insert_tbl_reservatorio_dispositivo(1, 1);
CALL insert_tbl_reservatorio_dispositivo(2, 2);
CALL insert_tbl_reservatorio_dispositivo(3, 3);
CALL insert_tbl_reservatorio_dispositivo(4, 4);
CALL insert_tbl_reservatorio_dispositivo(5, 5);


-- Leitura Dispositivo
CALL insert_tbl_leitura_dispositivo(90, 12, 6.5, 1);
CALL insert_tbl_leitura_dispositivo(75, 10, 7.0, 2);
CALL insert_tbl_leitura_dispositivo(60, 15, 6.8, 3);
CALL insert_tbl_leitura_dispositivo(30, 20, 6.3, 4);
CALL insert_tbl_leitura_dispositivo(10, 25, 5.9, 5);

-- INSERT INTO tbl_leitura_dispositivo (nivel_pct, turbidez_ntu, ph_int, id_dispositivo) VALUES (90, 12, 6.2, 1);

-- Status Alerta
CALL insert_tbl_status_alerta('Ativo');
CALL insert_tbl_status_alerta('Resolvido');
CALL insert_tbl_status_alerta('Ignorado');
CALL insert_tbl_status_alerta('Aguardando');
CALL insert_tbl_status_alerta('Crítico');

-- Alerta
CALL insert_tbl_alerta('Reservatório quase cheio e previsão de chuva', 1, 1);
CALL insert_tbl_alerta('Reservatório baixo e previsão de seca', 2, 2);
CALL insert_tbl_alerta('Água em nível crítico', 3, 5);
CALL insert_tbl_alerta('Alerta preventivo: esvazie 10%', 4, 1);
CALL insert_tbl_alerta('Reaproveitamento ideal', 5, 2);

-- Clima
CALL insert_tbl_clima_resumo_sem(85.5, 29.3, 19.0, 1);
CALL insert_tbl_clima_resumo_sem(15.2, 25.1, 17.8, 2);
CALL insert_tbl_clima_resumo_sem(60.0, 27.5, 18.0, 3);
CALL insert_tbl_clima_resumo_sem(0.0, 30.0, 21.0, 4);
CALL insert_tbl_clima_resumo_sem(95.0, 22.0, 16.5, 5);


/*
SELECT * FROM tbl_pais;
SELECT * FROM tbl_estado;
SELECT * FROM tbl_cidade;
SELECT * FROM tbl_usuario;
SELECT * FROM tbl_unidade;
SELECT * FROM tbl_endereco;
SELECT * FROM tbl_reservatorio;
SELECT * FROM tbl_status_reservatorio;
SELECT * FROM tbl_historico_reservatorio;
SELECT * FROM tbl_dispositivo;
SELECT * FROM tbl_reservatorio_dispositivo;
SELECT * FROM tbl_leitura_dispositivo;
SELECT * FROM tbl_clima_resumo_sem;
SELECT * FROM tbl_status_alerta;
SELECT * FROM tbl_alerta;

*/
