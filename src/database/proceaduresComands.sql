CREATE OR REPLACE PROCEDURE comandoIr(funcao VARCHAR)
LANGUAGE plpgsql
AS $comandoIr$
DECLARE
    localizacao_atual_id INT;
    direcao TEXT;
    nova_regiao_id INT;
BEGIN
    SELECT localizacao_id INTO localizacao_atual_id FROM pc WHERE id = 0;

    CASE
        WHEN funcao LIKE 'ir para norte' THEN direcao := 'norte';
        WHEN funcao LIKE 'ir para sul' THEN direcao := 'sul';
        WHEN funcao LIKE 'ir para leste' THEN direcao := 'leste';
        WHEN funcao LIKE 'ir para oeste' THEN direcao := 'oeste';
        ELSE direcao := NULL;
    END CASE;

    IF direcao IS NOT NULL THEN
        EXECUTE format('SELECT %I FROM regiao WHERE id = (SELECT regiao_id FROM localizacao WHERE id = %L)', direcao, localizacao_atual_id) INTO nova_regiao_id;
        IF EXISTS (SELECT 1 FROM localizacao WHERE regiao_id = nova_regiao_id) THEN
            UPDATE pc SET localizacao_id = (SELECT id FROM localizacao WHERE regiao_id = nova_regiao_id LIMIT 1) WHERE id = 0;
        ELSE
            RAISE EXCEPTION 'Não é possível ir para %', direcao;
        END IF;
    END IF;
END;
$comandoIr$;

CREATE OR REPLACE PROCEDURE comandoEntrar(funcao VARCHAR)
LANGUAGE plpgsql
AS $comandoEntrar$
DECLARE
    nome_estrutura VARCHAR(255);
    localizacao_pc INT;
    regiao_estrutura INT;
BEGIN
    IF funcao LIKE 'entrar em%' THEN
        nome_estrutura := substring(funcao from 11);
        SELECT localizacao_id INTO localizacao_pc FROM pc WHERE id = 0;
        SELECT regiao_id INTO regiao_estrutura FROM estrutura WHERE nome = nome_estrutura;
        IF localizacao_pc = regiao_estrutura THEN
            UPDATE pc SET localizacao_id = (SELECT id FROM localizacao WHERE sala_id = (SELECT sala_inicial FROM estrutura WHERE nome = nome_estrutura)) WHERE id = 0;
        END IF;
    END IF;
END;
$comandoEntrar$;


CREATE OR REPLACE PROCEDURE comandoSair(funcao VARCHAR)
LANGUAGE plpgsql
AS $comandoSair$
DECLARE
    regiao_idn INT;
BEGIN
    IF funcao LIKE 'sair' THEN
        select regiao_id INTO regiao_idn from localizacao where id = (select localizacao_id from pc);
        UPDATE pc SET localizacao_id = (SELECT id from localizacao WHERE regiao_id = regiao_idn AND sala_id IS NULL) WHERE id = 0;
    END IF;
END;
$comandoSair$;

