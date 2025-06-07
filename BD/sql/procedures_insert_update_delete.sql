

CREATE OR REPLACE PROCEDURE insert_tbl_pais (
    p_nome_pais VARCHAR2
)
AS
BEGIN
    INSERT INTO tbl_pais (nome_pais) VALUES (p_nome_pais);
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2291 THEN
            DBMS_OUTPUT.PUT_LINE('Erro: chave estrangeira inv�lida. Verifique se os IDs informados existem nas tabelas relacionadas.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Erro ao inserir em tbl_pais: ' || SQLERRM);
        END IF;
END;




CREATE OR REPLACE PROCEDURE update_tbl_pais (
    p_id_pais NUMBER,
    p_nome_pais VARCHAR2
)
AS
BEGIN
    UPDATE tbl_pais
    SET nome_pais = p_nome_pais
    WHERE id_pais = p_id_pais;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar tbl_pais: ' || SQLERRM);
END;



CREATE OR REPLACE PROCEDURE delete_tbl_pais (
    p_id_pais NUMBER
)
AS
BEGIN
    DELETE FROM tbl_pais
    WHERE id_pais = p_id_pais;
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2292 THEN
            DBMS_OUTPUT.PUT_LINE('Erro: n�o � poss�vel deletar tbl_pais pois ela est� sendo referenciada por outra tabela.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Erro ao deletar tbl_pais: ' || SQLERRM);
        END IF;
END;



CREATE OR REPLACE PROCEDURE insert_tbl_estado (
    p_nome_estado VARCHAR2, p_id_pais NUMBER
)
AS
BEGIN
    INSERT INTO tbl_estado (nome_estado, id_pais) VALUES (p_nome_estado, p_id_pais);
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2291 THEN
            DBMS_OUTPUT.PUT_LINE('Erro: chave estrangeira inv�lida. Verifique se os IDs informados existem nas tabelas relacionadas.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Erro ao inserir em tbl_estado: ' || SQLERRM);
        END IF;
END;



CREATE OR REPLACE PROCEDURE update_tbl_estado (
    p_id_estado NUMBER,
    p_nome_estado VARCHAR2, p_id_pais NUMBER
)
AS
BEGIN
    UPDATE tbl_estado
    SET nome_estado = p_nome_estado, id_pais = p_id_pais
    WHERE id_estado = p_id_estado;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar tbl_estado: ' || SQLERRM);
END;



CREATE OR REPLACE PROCEDURE delete_tbl_estado (
    p_id_estado NUMBER
)
AS
BEGIN
    DELETE FROM tbl_estado
    WHERE id_estado = p_id_estado;
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2292 THEN
            DBMS_OUTPUT.PUT_LINE('Erro: n�o � poss�vel deletar tbl_estado pois ela est� sendo referenciada por outra tabela.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Erro ao deletar tbl_estado: ' || SQLERRM);
        END IF;
END;



CREATE OR REPLACE PROCEDURE insert_tbl_cidade (
    p_nome_cidade VARCHAR2, p_id_estado NUMBER
)
AS
BEGIN
    INSERT INTO tbl_cidade (nome_cidade, id_estado) VALUES (p_nome_cidade, p_id_estado);
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2291 THEN
            DBMS_OUTPUT.PUT_LINE('Erro: chave estrangeira inv�lida. Verifique se os IDs informados existem nas tabelas relacionadas.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Erro ao inserir em tbl_cidade: ' || SQLERRM);
        END IF;
END;



CREATE OR REPLACE PROCEDURE update_tbl_cidade (
    p_id_cidade NUMBER,
    p_nome_cidade VARCHAR2, p_id_estado NUMBER
)
AS
BEGIN
    UPDATE tbl_cidade
    SET nome_cidade = p_nome_cidade, id_estado = p_id_estado
    WHERE id_cidade = p_id_cidade;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar tbl_cidade: ' || SQLERRM);
END;



CREATE OR REPLACE PROCEDURE delete_tbl_cidade (
    p_id_cidade NUMBER
)
AS
BEGIN
    DELETE FROM tbl_cidade
    WHERE id_cidade = p_id_cidade;
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2292 THEN
            DBMS_OUTPUT.PUT_LINE('Erro: n�o � poss�vel deletar tbl_cidade pois ela est� sendo referenciada por outra tabela.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Erro ao deletar tbl_cidade: ' || SQLERRM);
        END IF;
END;



CREATE OR REPLACE PROCEDURE insert_tbl_usuario (
    p_nome VARCHAR2, p_email VARCHAR2, p_senha VARCHAR2
)
AS
BEGIN
    INSERT INTO tbl_usuario (nome, email, senha) VALUES (p_nome, p_email, p_senha);
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2291 THEN
            DBMS_OUTPUT.PUT_LINE('Erro: chave estrangeira inv�lida. Verifique se os IDs informados existem nas tabelas relacionadas.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Erro ao inserir em tbl_usuario: ' || SQLERRM);
        END IF;
END;



CREATE OR REPLACE PROCEDURE update_tbl_usuario (
    p_id_usuario NUMBER,
    p_nome VARCHAR2, p_email VARCHAR2, p_senha VARCHAR2
)
AS
BEGIN
    UPDATE tbl_usuario
    SET nome = p_nome, email = p_email, senha = p_senha
    WHERE id_usuario = p_id_usuario;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar tbl_usuario: ' || SQLERRM);
END;



CREATE OR REPLACE PROCEDURE delete_tbl_usuario (
    p_id_usuario NUMBER
)
AS
BEGIN
    DELETE FROM tbl_usuario
    WHERE id_usuario = p_id_usuario;
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2292 THEN
            DBMS_OUTPUT.PUT_LINE('Erro: n�o � poss�vel deletar tbl_usuario pois ela est� sendo referenciada por outra tabela.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Erro ao deletar tbl_usuario: ' || SQLERRM);
        END IF;
END;



CREATE OR REPLACE PROCEDURE insert_tbl_unidade (
    p_nome VARCHAR2, p_capacidade_total_litros NUMBER, p_id_usuario NUMBER
)
AS
BEGIN
    INSERT INTO tbl_unidade (nome, capacidade_total_litros, id_usuario) VALUES (p_nome, p_capacidade_total_litros, p_id_usuario);
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2291 THEN
            DBMS_OUTPUT.PUT_LINE('Erro: chave estrangeira inv�lida. Verifique se os IDs informados existem nas tabelas relacionadas.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Erro ao inserir em tbl_unidade: ' || SQLERRM);
        END IF;
END;



CREATE OR REPLACE PROCEDURE update_tbl_unidade (
    p_id_unidade NUMBER,
    p_nome VARCHAR2, p_capacidade_total_litros NUMBER, p_id_usuario NUMBER
)
AS
BEGIN
    UPDATE tbl_unidade
    SET nome = p_nome, capacidade_total_litros = p_capacidade_total_litros, id_usuario = p_id_usuario
    WHERE id_unidade = p_id_unidade;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar tbl_unidade: ' || SQLERRM);
END;



CREATE OR REPLACE PROCEDURE delete_tbl_unidade (
    p_id_unidade NUMBER
)
AS
BEGIN
    DELETE FROM tbl_unidade
    WHERE id_unidade = p_id_unidade;
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2292 THEN
            DBMS_OUTPUT.PUT_LINE('Erro: n�o � poss�vel deletar tbl_unidade pois ela est� sendo referenciada por outra tabela.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Erro ao deletar tbl_unidade: ' || SQLERRM);
        END IF;
END;



CREATE OR REPLACE PROCEDURE insert_tbl_endereco (
    p_logradouro VARCHAR2, p_numero NUMBER, p_complemento VARCHAR2, p_cep VARCHAR2, p_id_cidade NUMBER, p_id_unidade NUMBER
)
AS
BEGIN
    INSERT INTO tbl_endereco (logradouro, numero, complemento, cep, id_cidade, id_unidade) VALUES (p_logradouro, p_numero, p_complemento, p_cep, p_id_cidade, p_id_unidade);
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2291 THEN
            DBMS_OUTPUT.PUT_LINE('Erro: chave estrangeira inv�lida. Verifique se os IDs informados existem nas tabelas relacionadas.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Erro ao inserir em tbl_endereco: ' || SQLERRM);
        END IF;
END;



CREATE OR REPLACE PROCEDURE update_tbl_endereco (
    p_id_endereco NUMBER,
    p_logradouro VARCHAR2, p_numero NUMBER, p_complemento VARCHAR2, p_cep VARCHAR2, p_id_cidade NUMBER, p_id_unidade NUMBER
)
AS
BEGIN
    UPDATE tbl_endereco
    SET logradouro = p_logradouro, numero = p_numero, complemento = p_complemento, cep = p_cep, id_cidade = p_id_cidade, id_unidade = p_id_unidade
    WHERE id_endereco = p_id_endereco;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar tbl_endereco: ' || SQLERRM);
END;



CREATE OR REPLACE PROCEDURE delete_tbl_endereco (
    p_id_endereco NUMBER
)
AS
BEGIN
    DELETE FROM tbl_endereco
    WHERE id_endereco = p_id_endereco;
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2292 THEN
            DBMS_OUTPUT.PUT_LINE('Erro: n�o � poss�vel deletar tbl_endereco pois ela est� sendo referenciada por outra tabela.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Erro ao deletar tbl_endereco: ' || SQLERRM);
        END IF;
END;



CREATE OR REPLACE PROCEDURE insert_tbl_reservatorio (
    p_nome VARCHAR2, p_capacidade_total_litros NUMBER, p_id_unidade NUMBER
)
AS
BEGIN
    INSERT INTO tbl_reservatorio (nome, capacidade_total_litros, id_unidade) VALUES (p_nome, p_capacidade_total_litros, p_id_unidade);
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2291 THEN
            DBMS_OUTPUT.PUT_LINE('Erro: chave estrangeira inv�lida. Verifique se os IDs informados existem nas tabelas relacionadas.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Erro ao inserir em tbl_reservatorio: ' || SQLERRM);
        END IF;
END;



CREATE OR REPLACE PROCEDURE update_tbl_reservatorio (
    p_id_reservatorio NUMBER,
    p_nome VARCHAR2, p_capacidade_total_litros NUMBER, p_id_unidade NUMBER
)
AS
BEGIN
    UPDATE tbl_reservatorio
    SET nome = p_nome, capacidade_total_litros = p_capacidade_total_litros, id_unidade = p_id_unidade
    WHERE id_reservatorio = p_id_reservatorio;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar tbl_reservatorio: ' || SQLERRM);
END;



CREATE OR REPLACE PROCEDURE delete_tbl_reservatorio (
    p_id_reservatorio NUMBER
)
AS
BEGIN
    DELETE FROM tbl_reservatorio
    WHERE id_reservatorio = p_id_reservatorio;
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2292 THEN
            DBMS_OUTPUT.PUT_LINE('Erro: n�o � poss�vel deletar tbl_reservatorio pois ela est� sendo referenciada por outra tabela.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Erro ao deletar tbl_reservatorio: ' || SQLERRM);
        END IF;
END;



CREATE OR REPLACE PROCEDURE insert_tbl_status_reservatorio (
    p_status VARCHAR2
)
AS
BEGIN
    INSERT INTO tbl_status_reservatorio (status) VALUES (p_status);
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2291 THEN
            DBMS_OUTPUT.PUT_LINE('Erro: chave estrangeira inv�lida. Verifique se os IDs informados existem nas tabelas relacionadas.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Erro ao inserir em tbl_status_reservatorio: ' || SQLERRM);
        END IF;
END;



CREATE OR REPLACE PROCEDURE update_tbl_status_reservatorio (
    p_id_status_reservatorio NUMBER,
    p_status VARCHAR2
)
AS
BEGIN
    UPDATE tbl_status_reservatorio
    SET status = p_status
    WHERE id_status_reservatorio = p_id_status_reservatorio;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar tbl_status_reservatorio: ' || SQLERRM);
END;



CREATE OR REPLACE PROCEDURE delete_tbl_status_reservatorio (
    p_id_status_reservatorio NUMBER
)
AS
BEGIN
    DELETE FROM tbl_status_reservatorio
    WHERE id_status_reservatorio = p_id_status_reservatorio;
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2292 THEN
            DBMS_OUTPUT.PUT_LINE('Erro: n�o � poss�vel deletar tbl_status_reservatorio pois ela est� sendo referenciada por outra tabela.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Erro ao deletar tbl_status_reservatorio: ' || SQLERRM);
        END IF;
END;



CREATE OR REPLACE PROCEDURE insert_tbl_historico_reservatorio (
    p_nivel_litros NUMBER, p_id_reservatorio NUMBER, p_id_status_reservatorio VARCHAR2
)
AS
BEGIN
    INSERT INTO tbl_historico_reservatorio (nivel_litros, id_reservatorio, id_status_reservatorio) VALUES (p_nivel_litros, p_id_reservatorio, p_id_status_reservatorio);
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2291 THEN
            DBMS_OUTPUT.PUT_LINE('Erro: chave estrangeira inv�lida. Verifique se os IDs informados existem nas tabelas relacionadas.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Erro ao inserir em tbl_historico_reservatorio: ' || SQLERRM);
        END IF;
END;



CREATE OR REPLACE PROCEDURE update_tbl_historico_reservatorio (
    p_id_historico_reservatorio NUMBER,
    p_nivel_litros NUMBER, p_id_reservatorio NUMBER, p_id_status_reservatorio VARCHAR2
)
AS
BEGIN
    UPDATE tbl_historico_reservatorio
    SET nivel_litros = p_nivel_litros, id_reservatorio = p_id_reservatorio, id_status_reservatorio = p_id_status_reservatorio
    WHERE id_historico = p_id_historico_reservatorio;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar tbl_historico_reservatorio: ' || SQLERRM);
END;



CREATE OR REPLACE PROCEDURE delete_tbl_historico_reservatorio (
    p_id_historico_reservatorio NUMBER
)
AS
BEGIN
    DELETE FROM tbl_historico_reservatorio
    WHERE id_historico = p_id_historico_reservatorio;
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2292 THEN
            DBMS_OUTPUT.PUT_LINE('Erro: n�o � poss�vel deletar tbl_historico_reservatorio pois ela est� sendo referenciada por outra tabela.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Erro ao deletar tbl_historico_reservatorio: ' || SQLERRM);
        END IF;
END;



CREATE OR REPLACE PROCEDURE insert_tbl_dispositivo IS
BEGIN
    INSERT INTO tbl_dispositivo (data_instalacao) VALUES (SYSTIMESTAMP);
END;


/*CREATE OR REPLACE PROCEDURE update_tbl_dispositivo (
    p_id_dispositivo NUMBER
)
AS
BEGIN
    UPDATE tbl_dispositivo
    SET 
    WHERE id_dispositivo = p_id_dispositivo;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar tbl_dispositivo: ' || SQLERRM);
END;
*/


CREATE OR REPLACE PROCEDURE delete_tbl_dispositivo (
    p_id_dispositivo NUMBER
)
AS
BEGIN
    DELETE FROM tbl_dispositivo
    WHERE id_dispositivo = p_id_dispositivo;
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2292 THEN
            DBMS_OUTPUT.PUT_LINE('Erro: n�o � poss�vel deletar tbl_dispositivo, pois ela est� sendo referenciada por outra tabela.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Erro ao deletar tbl_dispositivo: ' || SQLERRM);
        END IF;
END;



CREATE OR REPLACE PROCEDURE insert_tbl_reservatorio_dispositivo (
    p_id_dispositivo NUMBER, p_id_reservatorio NUMBER
)
AS
BEGIN
    INSERT INTO tbl_reservatorio_dispositivo (id_dispositivo, id_reservatorio) VALUES (p_id_dispositivo, p_id_reservatorio);
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2291 THEN
            DBMS_OUTPUT.PUT_LINE('Erro: chave estrangeira inv�lida. Verifique se os IDs informados existem nas tabelas relacionadas.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Erro ao inserir em tbl_reservatorio_dispositivo: ' || SQLERRM);
        END IF;
END;



CREATE OR REPLACE PROCEDURE update_tbl_reservatorio_dispositivo (
    p_id_reservatorio_dispositivo NUMBER,
    p_id_dispositivo NUMBER, p_id_reservatorio NUMBER
)
AS
BEGIN
    UPDATE tbl_reservatorio_dispositivo
    SET id_dispositivo = p_id_dispositivo, id_reservatorio = p_id_reservatorio
    WHERE id_reservatorio_dispositivo = p_id_reservatorio_dispositivo;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar tbl_reservatorio_dispositivo: ' || SQLERRM);
END;



CREATE OR REPLACE PROCEDURE delete_tbl_reservatorio_dispositivo (
    p_id_reservatorio_dispositivo NUMBER
)
AS
BEGIN
    DELETE FROM tbl_reservatorio_dispositivo
    WHERE id_reservatorio_dispositivo = p_id_reservatorio_dispositivo;
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2292 THEN
            DBMS_OUTPUT.PUT_LINE('Erro: n�o � poss�vel deletar tbl_reservatorio_dispositivo pois ela est� sendo referenciada por outra tabela.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Erro ao deletar tbl_reservatorio_dispositivo: ' || SQLERRM);
        END IF;
END;




CREATE OR REPLACE PROCEDURE insert_tbl_leitura_dispositivo (
    p_nivel_pct NUMBER, p_turbidez_ntu NUMBER, p_ph_int DECIMAL, p_id_dispositivo NUMBER
)
AS
BEGIN
    INSERT INTO tbl_leitura_dispositivo (nivel_pct, turbidez_ntu, ph_int, id_dispositivo) VALUES (p_nivel_pct, p_turbidez_ntu, p_ph_int, p_id_dispositivo);
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2291 THEN
            DBMS_OUTPUT.PUT_LINE('Erro: chave estrangeira inv�lida. Verifique se os IDs informados existem nas tabelas relacionadas.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Erro ao inserir em tbl_leitura_dispositivo: ' || SQLERRM);
        END IF;
END;



CREATE OR REPLACE PROCEDURE update_tbl_leitura_dispositivo (
    p_id_leitura_dispositivo NUMBER,
    p_nivel_pct NUMBER, p_turbidez_ntu NUMBER, p_ph_int DECIMAL, p_id_dispositivo NUMBER
)
AS
BEGIN
    UPDATE tbl_leitura_dispositivo
    SET nivel_pct = p_nivel_pct, turbidez_ntu = p_turbidez_ntu, ph_int = p_ph_int, id_dispositivo = p_id_dispositivo
    WHERE id_leitura = p_id_leitura_dispositivo;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar tbl_leitura_dispositivo: ' || SQLERRM);
END;



CREATE OR REPLACE PROCEDURE delete_tbl_leitura_dispositivo (
    p_id_leitura_dispositivo NUMBER
)
AS
BEGIN
    DELETE FROM tbl_leitura_dispositivo
    WHERE id_leitura = p_id_leitura_dispositivo;
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2292 THEN
            DBMS_OUTPUT.PUT_LINE('Erro: n�o � poss�vel deletar tbl_leitura_dispositivo pois ela est� sendo referenciada por outra tabela.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Erro ao deletar tbl_leitura_dispositivo: ' || SQLERRM);
        END IF;
END;


CREATE OR REPLACE PROCEDURE insert_tbl_clima_resumo_sem (
    p_media_chance_chuva DECIMAL, p_media_temperatura_max DECIMAL, p_media_temperatura_min DECIMAL, p_id_cidade NUMBER
)
AS
BEGIN
    INSERT INTO tbl_clima_resumo_sem (media_chance_chuva, media_temperatura_max, media_temperatura_min, id_cidade) VALUES (p_media_chance_chuva, p_media_temperatura_max, p_media_temperatura_min, p_id_cidade);
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2291 THEN
            DBMS_OUTPUT.PUT_LINE('Erro: chave estrangeira inv�lida. Verifique se os IDs informados existem nas tabelas relacionadas.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Erro ao inserir em tbl_clima_resumo_sem: ' || SQLERRM);
        END IF;
END;



CREATE OR REPLACE PROCEDURE update_tbl_clima_resumo_sem (
    p_id_clima_resumo_sem NUMBER,
    p_media_chance_chuva DECIMAL, p_media_temperatura_max DECIMAL, p_media_temperatura_min DECIMAL, p_id_cidade NUMBER
)
AS
BEGIN
    UPDATE tbl_clima_resumo_sem
    SET media_chance_chuva = p_media_chance_chuva, media_temperatura_max = p_media_temperatura_max, media_temperatura_min = p_media_temperatura_min, id_cidade = p_id_cidade
    WHERE id_clima_resumo = p_id_clima_resumo_sem;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar tbl_clima_resumo_sem: ' || SQLERRM);
END;



CREATE OR REPLACE PROCEDURE delete_tbl_clima_resumo_sem (
    p_id_clima_resumo_sem NUMBER
)
AS
BEGIN
    DELETE FROM tbl_clima_resumo_sem
    WHERE id_clima_resumo = p_id_clima_resumo_sem;
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2292 THEN
            DBMS_OUTPUT.PUT_LINE('Erro: n�o � poss�vel deletar tbl_clima_resumo_sem pois ela est� sendo referenciada por outra tabela.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Erro ao deletar tbl_clima_resumo_sem: ' || SQLERRM);
        END IF;
END;



CREATE OR REPLACE PROCEDURE insert_tbl_status_alerta (
    p_status VARCHAR2
)
AS
BEGIN
    INSERT INTO tbl_status_alerta (status) VALUES (p_status);
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2291 THEN
            DBMS_OUTPUT.PUT_LINE('Erro: chave estrangeira inv�lida. Verifique se os IDs informados existem nas tabelas relacionadas.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Erro ao inserir em tbl_status_alerta: ' || SQLERRM);
        END IF;
END;



CREATE OR REPLACE PROCEDURE update_tbl_status_alerta (
    p_id_status_alerta NUMBER,
    p_status VARCHAR2
)
AS
BEGIN
    UPDATE tbl_status_alerta
    SET status = p_status
    WHERE id_status_alerta = p_id_status_alerta;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar tbl_status_alerta: ' || SQLERRM);
END;



CREATE OR REPLACE PROCEDURE delete_tbl_status_alerta (
    p_id_status_alerta NUMBER
)
AS
BEGIN
    DELETE FROM tbl_status_alerta
    WHERE id_status_alerta = p_id_status_alerta;
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2292 THEN
            DBMS_OUTPUT.PUT_LINE('Erro: n�o � poss�vel deletar tbl_status_alerta pois ela est� sendo referenciada por outra tabela.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Erro ao deletar tbl_status_alerta: ' || SQLERRM);
        END IF;
END;



CREATE OR REPLACE PROCEDURE insert_tbl_alerta (
    p_mensagem VARCHAR2, p_id_reservatorio NUMBER, p_id_status_alerta VARCHAR2
)
AS
BEGIN
    INSERT INTO tbl_alerta (mensagem, id_reservatorio, id_status_alerta) VALUES (p_mensagem, p_id_reservatorio, p_id_status_alerta);
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2291 THEN
            DBMS_OUTPUT.PUT_LINE('Erro: chave estrangeira inv�lida. Verifique se os IDs informados existem nas tabelas relacionadas.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Erro ao inserir em tbl_alerta: ' || SQLERRM);
        END IF;
END;



CREATE OR REPLACE PROCEDURE update_tbl_alerta (
    p_id_alerta NUMBER,
    p_mensagem VARCHAR2, p_id_reservatorio NUMBER, p_id_status_alerta VARCHAR2
)
AS
BEGIN
    UPDATE tbl_alerta
    SET mensagem = p_mensagem, id_reservatorio = p_id_reservatorio, id_status_alerta = p_id_status_alerta
    WHERE id_alerta = p_id_alerta;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar tbl_alerta: ' || SQLERRM);
END;



CREATE OR REPLACE PROCEDURE delete_tbl_alerta (
    p_id_alerta NUMBER
)
AS
BEGIN
    DELETE FROM tbl_alerta
    WHERE id_alerta = p_id_alerta;
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2292 THEN
            DBMS_OUTPUT.PUT_LINE('Erro: n�o � poss�vel deletar tbl_alerta pois ela est� sendo referenciada por outra tabela.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Erro ao deletar tbl_alerta: ' || SQLERRM);
        END IF;
END;

