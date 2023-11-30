CREATE OR REPLACE FUNCTION geografia_regiao() RETURNS TRIGGER AS $geografia_regiao$
BEGIN
    IF NEW.norte IS NOT NULL THEN
        UPDATE regiao SET sul = NEW.id WHERE id = NEW.norte;
    END IF;
    IF NEW.sul IS NOT NULL THEN
        UPDATE regiao SET norte = NEW.id WHERE id = NEW.sul;
    END IF;
    IF NEW.leste IS NOT NULL THEN
        UPDATE regiao SET oeste = NEW.id WHERE id = NEW.leste;
    END IF;
    IF NEW.oeste IS NOT NULL THEN
        UPDATE regiao SET leste = NEW.id WHERE id = NEW.oeste;
    END IF;
    RETURN NEW;

END;
$geografia_regiao$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER geografia_regiao
AFTER INSERT ON regiao
FOR EACH ROW EXECUTE PROCEDURE geografia_regiao();

CREATE OR REPLACE FUNCTION comandos() RETURNS TRIGGER AS $comandos$
BEGIN
    IF NEW.funcao LIKE 'ir para norte' THEN
        IF EXISTS (SELECT 1 FROM localizacao WHERE regiao_id = (SELECT norte FROM regiao WHERE id = (SELECT regiao_id FROM localizacao WHERE id = (SELECT localizacao_id FROM pc WHERE id = 0)))) THEN
            UPDATE pc SET localizacao_id = (SELECT id FROM localizacao WHERE regiao_id = (SELECT norte FROM regiao WHERE id = (SELECT regiao_id FROM localizacao WHERE id = (SELECT localizacao_id FROM pc WHERE id = 0))) LIMIT 1) WHERE id = 0;
        END IF;
    ELSIF NEW.funcao LIKE 'ir para sul' THEN
        IF EXISTS (SELECT 1 FROM localizacao WHERE regiao_id = (SELECT sul FROM regiao WHERE id = (SELECT regiao_id FROM localizacao WHERE id = (SELECT localizacao_id FROM pc WHERE id = 0)))) THEN
            UPDATE pc SET localizacao_id = (SELECT id FROM localizacao WHERE regiao_id = (SELECT sul FROM regiao WHERE id = (SELECT regiao_id FROM localizacao WHERE id = (SELECT localizacao_id FROM pc WHERE id = 0))) LIMIT 1) WHERE id = 0;
        END IF;
    ELSIF NEW.funcao LIKE 'ir para leste' THEN
        IF EXISTS (SELECT 1 FROM localizacao WHERE regiao_id = (SELECT leste FROM regiao WHERE id = (SELECT regiao_id FROM localizacao WHERE id = (SELECT localizacao_id FROM pc WHERE id = 0)))) THEN
            UPDATE pc SET localizacao_id = (SELECT id FROM localizacao WHERE regiao_id = (SELECT leste FROM regiao WHERE id = (SELECT regiao_id FROM localizacao WHERE id = (SELECT localizacao_id FROM pc WHERE id = 0))) LIMIT 1) WHERE id = 0;
        END IF;
    ELSIF NEW.funcao LIKE 'ir para oeste' THEN
        IF EXISTS (SELECT 1 FROM localizacao WHERE regiao_id = (SELECT oeste FROM regiao WHERE id = (SELECT regiao_id FROM localizacao WHERE id = (SELECT localizacao_id FROM pc WHERE id = 0)))) THEN
            UPDATE pc SET localizacao_id = (SELECT id FROM localizacao WHERE regiao_id = (SELECT oeste FROM regiao WHERE id = (SELECT regiao_id FROM localizacao WHERE id = (SELECT localizacao_id FROM pc WHERE id = 0))) LIMIT 1) WHERE id = 0;
        END IF;
    END if;       
    RETURN NEW;
END;
$comandos$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER comandos
AFTER INSERT ON comandos
FOR EACH ROW EXECUTE PROCEDURE comandos();

CREATE OR REPLACE FUNCTION comandoEntrar() RETURNS TRIGGER AS $$
DECLARE
    nome_estrutura VARCHAR(255);
    localizacao_pc INT;
    regiao_estrutura INT;
BEGIN
    IF NEW.funcao LIKE 'entrar em%' THEN
        nome_estrutura := substring(NEW.funcao from 11);
        SELECT localizacao_id INTO localizacao_pc FROM pc WHERE id = 0;
        SELECT regiao_id INTO regiao_estrutura FROM estrutura WHERE nome = nome_estrutura;
        IF localizacao_pc = regiao_estrutura THEN
            UPDATE pc SET localizacao_id = (SELECT id FROM localizacao WHERE sala_id = (SELECT id FROM sala WHERE estrutura_id = (SELECT id FROM estrutura WHERE nome = nome_estrutura))) WHERE id = 0;
        END IF;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER comandoEntrar
AFTER INSERT ON comandos
FOR EACH ROW EXECUTE PROCEDURE comandoEntrar();

