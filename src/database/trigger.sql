CREATE OR REPLACE FUNCTION geografia_regiao() RETURNS TRIGGER AS $geografia_regiao$
BEGIN
    IF NEW.North IS NOT NULL THEN
        UPDATE RegionsGeo SET South = NEW.RegionId WHERE RegionId = NEW.North;
    END IF;
    IF NEW.South IS NOT NULL THEN
        UPDATE RegionsGeo SET North = NEW.RegionId WHERE RegionId = NEW.South;
    END IF;
    IF NEW.East IS NOT NULL THEN
        UPDATE RegionsGeo SET West = NEW.RegionId WHERE RegionId = NEW.East;
    END IF;
    IF NEW.West IS NOT NULL THEN
        UPDATE RegionsGeo SET East = NEW.RegionId WHERE RegionId = NEW.West;
    END IF;
    RETURN NEW;
END;
$geografia_regiao$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER geografia_regiao
AFTER INSERT ON RegionsGeo
FOR EACH ROW EXECUTE PROCEDURE geografia_regiao();

--------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION InitialRoom() RETURNS TRIGGER AS $InitialRoom$
BEGIN
    IF (SELECT InitialRoom FROM Structures WHERE StructureId = NEW.structure) IS NULL THEN
        UPDATE Structures SET InitialRoom = NEW.RoomId WHERE StructureId = NEW.structure;
    END IF;
    RETURN NEW;
END;
$InitialRoom$ LANGUAGE plpgsql;

CREATE TRIGGER InitialRoom
AFTER INSERT ON Rooms
FOR EACH ROW EXECUTE PROCEDURE InitialRoom();

---------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION comandsManager() RETURNS TRIGGER AS $comandsManager$
BEGIN
    IF NEW.CommandFunction LIKE 'ir para%' THEN
        CALL comandoIr(NEW.CommandFunction);
    ELSIF NEW.CommandFunction LIKE 'entrar em%' THEN
        CALL comandoEntrar(NEW.CommandFunction);
    ELSIF NEW.CommandFunction LIKE 'sair' THEN
        CALL comandoSair(NEW.CommandFunction);
    ELSIF NEW.CommandFunction LIKE 'pegar%' THEN
        CALL comandoPegar(NEW.CommandFunction);
    ELSIF NEW.CommandFunction LIKE 'abrir inventario' THEN
        RETURN NEW;
    ELSIF NEW.CommandFunction LIKE 'fechar inventario' THEN
        RETURN NEW;
    ELSE
        RAISE EXCEPTION 'Comando inválido';
    END IF;

    RETURN NEW;
END;
$comandsManager$ LANGUAGE plpgsql;

CREATE TRIGGER comandsManager
AFTER INSERT ON Commands
FOR EACH ROW EXECUTE PROCEDURE comandsManager();