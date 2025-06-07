SET SERVEROUTPUT ON;

-- FUNÇÕES

-- 1° gera a media do nivel de um reservatorio 
CREATE OR REPLACE FUNCTION fn_media_nivel_reservatorio(p_id_reservatorio NUMBER)
RETURN NUMBER IS
    v_media NUMBER;
BEGIN
    SELECT AVG(nivel_litros)
        INTO v_media
    FROM tbl_historico_reservatorio
    WHERE id_reservatorio = p_id_reservatorio;
    RETURN v_media;
EXCEPTION
    WHEN NO_DATA_FOUND THEN RETURN NULL;
    WHEN OTHERS THEN RETURN -1;
END;

-- executando a função 
SELECT
    fn_media_nivel_reservatorio(1)
FROM
    dual;
    
-- 2° gera um total de alertas por status de uma unidade especifíca
CREATE OR REPLACE FUNCTION fn_total_alertas_por_status(
    p_status_id NUMBER,
    p_id_unidade NUMBER
)
RETURN NUMBER IS
    v_total NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_total
    FROM tbl_alerta a
    JOIN tbl_reservatorio r ON a.id_reservatorio = r.id_reservatorio
    JOIN tbl_unidade u ON r.id_unidade = u.id_unidade
    WHERE a.id_status_alerta = p_status_id
      AND r.id_unidade = p_id_unidade;

    RETURN v_total;
EXCEPTION
    WHEN OTHERS THEN RETURN -1;
END;


SELECT
    fn_total_alertas_por_status(6, 1)
FROM
    dual;

-- BLOCOS ANÔNIMOS

/*
1° verifica todas as unidades junto aos seus reservatórios, soma a capacidade total de todos os reservatórios daquela unidade: 
 Compara essa soma com o valor da coluna capacidade_total_litros da própria unidade. 
 Exibe um aviso:
 Se a soma dos reservatórios estiver dentro da capacidade da unidade.
 Se a soma exceder a capacidade da unidade (o que é um erro de projeto/instalação).
*/
DECLARE
    CURSOR cur_unidades IS
        SELECT u.id_unidade, u.nome, u.capacidade_total_litros,
               SUM(r.capacidade_total_litros) AS total_reservatorios
        FROM tbl_unidade u
        JOIN tbl_reservatorio r ON u.id_unidade = r.id_unidade
        GROUP BY u.id_unidade, u.nome, u.capacidade_total_litros;
    v_row cur_unidades%ROWTYPE; -- declara uma variavel do tipo do retorno do cursor
BEGIN
    OPEN cur_unidades;
    LOOP
        FETCH cur_unidades INTO v_row;
        EXIT WHEN cur_unidades%NOTFOUND;
        IF v_row.total_reservatorios > v_row.capacidade_total_litros THEN
            DBMS_OUTPUT.PUT_LINE('!! Unidade  !!' || v_row.nome || ' excedeu a capacidade!');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Unidade ' || v_row.nome || ' OK.');
        END IF;
    END LOOP;
    CLOSE cur_unidades;
END;

/*
2° lista o último alerta registrado para cada unidade, mostrando: 
    O nome da unidade
    O status do alerta (ex: Ativo, Resolvido)
    A data e hora do envio do alerta
*/
DECLARE
    CURSOR cur_alertas IS
        SELECT u.nome AS unidade, sa.status, a.data_hora_envio
        FROM tbl_alerta a
        JOIN tbl_reservatorio r ON a.id_reservatorio = r.id_reservatorio
        JOIN tbl_unidade u ON r.id_unidade = u.id_unidade
        JOIN tbl_status_alerta sa ON a.id_status_alerta = sa.id_status_alerta
        WHERE a.data_hora_envio = (
            SELECT MAX(a2.data_hora_envio)
            FROM tbl_alerta a2
            JOIN tbl_reservatorio r2 ON a2.id_reservatorio = r2.id_reservatorio
            WHERE r2.id_unidade = r.id_unidade
        )
        ORDER BY a.data_hora_envio DESC;
    
    v_alerta cur_alertas%ROWTYPE;
BEGIN
    OPEN cur_alertas;
    LOOP
        FETCH cur_alertas INTO v_alerta;
        EXIT WHEN cur_alertas%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Último alerta da unidade ' || v_alerta.unidade || ': ' ||
                             v_alerta.status || ' (' || TO_CHAR(v_alerta.data_hora_envio, 'DDMMYYYY HH24:MI') || ')');
    END LOOP;
    CLOSE cur_alertas;
END;



-- SELECTs
-- 1. Calcula a média do nível de água por reservatório e ordena do maior para o menor
SELECT r.nome, ROUND(AVG(h.nivel_litros), 2) AS media_nivel
FROM tbl_reservatorio r
JOIN tbl_historico_reservatorio h ON r.id_reservatorio = h.id_reservatorio
GROUP BY r.nome
ORDER BY media_nivel DESC;

-- 2. Retorna o nome das unidades que possuem mais de um reservatório cadastrado
SELECT u.nome AS unidade, COUNT(r.id_reservatorio) AS total_reservatorios
FROM tbl_unidade u
JOIN tbl_reservatorio r ON u.id_unidade = r.id_unidade
GROUP BY u.nome
HAVING COUNT(r.id_reservatorio) > 1;

-- 3. Conta o total de alertas agrupados por status (ex: Ativo, Resolvido, etc.)
SELECT sa.status, COUNT(*) AS total_alertas
FROM tbl_alerta a
JOIN tbl_status_alerta sa ON a.id_status_alerta = sa.id_status_alerta
GROUP BY sa.status;

-- 4. Retorna o número de alertas emitidos nos últimos 7 dias para cada unidade
SELECT u.nome AS unidade, COUNT(*) AS total_alertas
FROM tbl_alerta a
JOIN tbl_reservatorio r ON a.id_reservatorio = r.id_reservatorio
JOIN tbl_unidade u ON r.id_unidade = u.id_unidade
WHERE a.data_hora_envio >= SYSDATE - 7
GROUP BY u.nome;

-- 5. Lista todos os registros de histórico em que o status do reservatório era "Crítico",
-- incluindo nome do reservatório, nível registrado, status e data/hora do evento
SELECT r.nome AS reservatorio, h.nivel_litros, s.status, h.data_hora
FROM tbl_historico_reservatorio h
JOIN tbl_reservatorio r ON h.id_reservatorio = r.id_reservatorio
JOIN tbl_status_reservatorio s ON h.id_status_reservatorio = s.id_status_reservatorio
WHERE s.status = 'Crítico'
ORDER BY h.data_hora DESC;
