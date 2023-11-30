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

---------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION comandsManager() RETURNS TRIGGER AS $comandsManager$
BEGIN
    IF NEW.funcao LIKE 'ir para%' THEN
        CALL comandoIr(NEW.funcao);
    ELSIF NEW.funcao LIKE 'entrar em%' THEN
        CALL comandoEntrar(NEW.funcao);
    ELSIF NEW.funcao LIKE 'sair' THEN
        CALL comandoSair(NEW.funcao);
    ELSE 
        RAISE EXCEPTION 'Comando inválido';
    END IF;


    RETURN NEW;
END;
$comandsManager$ LANGUAGE plpgsql;

CREATE TRIGGER comandsManager
AFTER INSERT ON comandos
FOR EACH ROW EXECUTE PROCEDURE comandsManager();


