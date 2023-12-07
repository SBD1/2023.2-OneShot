CREATE OR REPLACE FUNCTION geografia_regiao() RETURNS TRIGGER AS $geografia_regiao$
BEGIN
    IF NEW.North IS NOT NULL THEN
        UPDATE RegionGeo SET South = NEW.RegionId WHERE RegionId = NEW.North;
    END IF;
    IF NEW.South IS NOT NULL THEN
        UPDATE RegionGeo SET North = NEW.RegionId WHERE RegionId = NEW.South;
    END IF;
    IF NEW.East IS NOT NULL THEN
        UPDATE RegionGeo SET West = NEW.RegionId WHERE RegionId = NEW.East;
    END IF;
    IF NEW.West IS NOT NULL THEN
        UPDATE RegionGeo SET East = NEW.RegionId WHERE RegionId = NEW.West;
    END IF;
    RETURN NEW;
END;
$geografia_regiao$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER geografia_regiao
AFTER INSERT ON RegionGeo
FOR EACH ROW EXECUTE PROCEDURE geografia_regiao();

---------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION InitialRoom() RETURNS TRIGGER AS $InitialRoom$
BEGIN
    IF (SELECT InitialRoom FROM Structure WHERE StructureId = NEW.StructureId) IS NULL THEN
        UPDATE Structure SET InitialRoom = NEW.RoomId WHERE StructureId = NEW.StructureId;
    END IF;
    RETURN NEW;
END;
$InitialRoom$ LANGUAGE plpgsql;

CREATE TRIGGER InitialRoom
AFTER INSERT ON Room
FOR EACH ROW EXECUTE PROCEDURE InitialRoom();

---------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION pcmanager() RETURNS TRIGGER AS $pcmanager$
BEGIN
    IF EXISTS (SELECT 1 FROM Character C WHERE C.CharacterId = NEW.CharacterId) THEN 
        RAISE EXCEPTION 'PC já existe';
    ELSIF NEW.PcLocationId IS NOT NULL THEN
        INSERT INTO Character (CharacterType) VALUES ('PC') RETURNING CharacterId INTO NEW.CharacterId;
        RETURN NEW;
    ELSE
        RAISE EXCEPTION 'PC não pode ser criado sem uma localização';
    END IF;
END;
$pcmanager$ LANGUAGE plpgsql;

CREATE TRIGGER pcmanager
BEFORE INSERT ON PC
FOR EACH ROW EXECUTE PROCEDURE pcmanager();

---------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION npcmanager() RETURNS TRIGGER AS $npcmanager$
BEGIN
    IF EXISTS (SELECT 1 FROM Character C WHERE C.CharacterId = NEW.CharacterId) THEN 
        RAISE EXCEPTION 'NPC já existe';
    ELSIF ((NEW.NpcName IS NOT NULL) AND (NEW.NpcDescription IS NOT NULL) AND (NEW.EventId IS NOT NULL)) THEN
        INSERT INTO Character (CharacterType) VALUES ('NPC') RETURNING CharacterId INTO NEW.CharacterId;
        RETURN NEW;
    ELSE
        RAISE EXCEPTION 'NPC não pôde ser criado pois algum dado esta faltando';
    END IF;
END;
$npcmanager$ LANGUAGE plpgsql;

CREATE TRIGGER npcmanager
BEFORE INSERT ON NPC
FOR EACH ROW EXECUTE PROCEDURE npcmanager();

---------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION i_materialmanager() RETURNS TRIGGER AS $i_materialmanager$
BEGIN
    IF EXISTS (SELECT 1 FROM Item I WHERE I.ItemId = NEW.ItemId) THEN 
        RAISE EXCEPTION 'Item já existe';
    ELSIF ((NEW.ItemName IS NOT NULL) AND (NEW.ItemDescription IS NOT NULL)) THEN
        INSERT INTO Item (ItemType) VALUES ('material') RETURNING ItemId INTO NEW.ItemId;
        RETURN NEW;
    ELSE
        RAISE EXCEPTION 'Item não pôde ser criado pois algum dado esta faltando';
    END IF;
END;
$i_materialmanager$ LANGUAGE plpgsql;

CREATE TRIGGER i_materialmanager
BEFORE INSERT ON ItemMaterial
FOR EACH ROW EXECUTE PROCEDURE i_materialmanager();

---------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION i_equipmentmanager() RETURNS TRIGGER AS $i_equipmentmanager$
BEGIN
    IF EXISTS (SELECT 1 FROM Item I WHERE I.ItemId = NEW.ItemId) THEN 
        RAISE EXCEPTION 'Item já existe';
    ELSIF ((NEW.ItemName IS NOT NULL) AND (NEW.ItemDescription IS NOT NULL)) THEN
        INSERT INTO Item (ItemType) VALUES ('equipment') RETURNING ItemId INTO NEW.ItemId;
        RETURN NEW;
    ELSE
        RAISE EXCEPTION 'Item não pôde ser criado pois algum dado esta faltando';
    END IF;
END;
$i_equipmentmanager$ LANGUAGE plpgsql;

CREATE TRIGGER i_equipmentmanager
BEFORE INSERT ON ItemEquipment
FOR EACH ROW EXECUTE PROCEDURE i_equipmentmanager();

---------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION e_chatmanager() RETURNS TRIGGER AS $e_chatmanager$
BEGIN
    IF EXISTS (SELECT 1 FROM Event E WHERE E.EventId = NEW.EventId) THEN 
        RAISE EXCEPTION 'Evento já existe';
    ELSIF (NEW.Command IS NOT NULL) THEN
        INSERT INTO Event (EventType) VALUES ('Chat') RETURNING EventId INTO NEW.EventId;
        RETURN NEW;
    ELSE
        RAISE EXCEPTION 'Evento não pôde ser criado pois o comando esta faltando';
    END IF;
END;
$e_chatmanager$ LANGUAGE plpgsql;

CREATE TRIGGER e_chatmanager
BEFORE INSERT ON ChatEvent
FOR EACH ROW EXECUTE PROCEDURE e_chatmanager();

---------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION e_interactmanager() RETURNS TRIGGER AS $e_interactmanager$
BEGIN
    IF EXISTS (SELECT 1 FROM Event E WHERE E.EventId = NEW.EventId) THEN 
        RAISE EXCEPTION 'Evento já existe';
    ELSIF (NEW.Command IS NOT NULL) THEN
        INSERT INTO Event (EventType) VALUES ('Interact') RETURNING EventId INTO NEW.EventId;
        RETURN NEW;
    ELSE
        RAISE EXCEPTION 'Evento não pôde ser criado pois o comando esta faltando';
    END IF;
END;
$e_interactmanager$ LANGUAGE plpgsql;

CREATE TRIGGER e_interactmanager
BEFORE INSERT ON InteractEvent
FOR EACH ROW EXECUTE PROCEDURE e_interactmanager();

---------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION e_roommanager() RETURNS TRIGGER AS $e_roommanager$
BEGIN
    IF EXISTS (SELECT 1 FROM Event E WHERE E.EventId = NEW.EventId) THEN 
        RAISE EXCEPTION 'Evento já existe';
    ELSIF (NEW.Command IS NOT NULL) THEN
        INSERT INTO Event (EventType) VALUES ('Room') RETURNING EventId INTO NEW.EventId;
        RETURN NEW;
    ELSE
        RAISE EXCEPTION 'Evento não pôde ser criado pois o comando esta faltando';
    END IF;
END;
$e_roommanager$ LANGUAGE plpgsql;

CREATE TRIGGER e_roommanager
BEFORE INSERT ON RoomEvent
FOR EACH ROW EXECUTE PROCEDURE e_roommanager();

---------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION roomEventTrigger() RETURNS TRIGGER AS $roomEventTrigger$
DECLARE
    Idquarto INT;
    Idevento INT;
BEGIN
    SELECT RoomId INTO Idquarto FROM location WHERE locationId = NEW.PcLocationId;
    IF Idquarto IS NOT NULL THEN
        -- RAISE NOTICE 'Niko entrou em %', (SELECT RoomName FROM Room WHERE RoomId = Idquarto);
        SELECT EventId INTO Idevento FROM Room WHERE RoomId = Idquarto;
        IF Idevento IS NOT NULL THEN
            CALL eventScheduler(Idevento);
        END IF;
    END IF;


    RETURN NEW;
END;
$roomEventTrigger$ LANGUAGE plpgsql;

CREATE TRIGGER roomEventTrigger
AFTER UPDATE ON PC
FOR EACH ROW EXECUTE PROCEDURE roomEventTrigger();

---------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION location_checker() RETURNS TRIGGER AS $location_checker$
BEGIN
    IF NEW.PcLocationId IS NOT NULL THEN
        IF EXISTS (SELECT 1 FROM Location WHERE LocationId = NEW.PcLocationId) THEN
            RETURN NEW;
        ELSE
            RAISE EXCEPTION 'Localização não existe';
        END IF;
    ELSE
        RAISE EXCEPTION 'Localização não existe';
    END IF;
END;
$location_checker$ LANGUAGE plpgsql;

CREATE TRIGGER location_checker
BEFORE UPDATE OR INSERT ON PC
FOR EACH ROW EXECUTE PROCEDURE location_checker();


---------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION visitedregion() RETURNS TRIGGER AS $visitedregion$
DECLARE
    idRegiao INT;
    idroom INT;
BEGIN
    IF NEW.PcLocationId IS NOT NULL THEN
        SELECT RegionId, RoomId INTO idRegiao, idroom FROM Location WHERE LocationId = NEW.PcLocationId;
        IF idRegiao IS NOT NULL AND idroom IS NULL THEN
            IF (SELECT isVisited FROM Region WHERE RegionId = idRegiao) = FALSE THEN
                INSERT INTO VisitedRegion (CharacterId, RegionId) VALUES (NEW.CharacterId, idRegiao);
                UPDATE Region SET isVisited = TRUE WHERE RegionId = idRegiao;
            END IF;
        END IF;
    END IF;
    RETURN NEW;
END;
$visitedregion$ LANGUAGE plpgsql;

CREATE TRIGGER visitedregion
AFTER UPDATE ON PC
FOR EACH ROW EXECUTE PROCEDURE visitedregion();

---------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION comandsManager() RETURNS TRIGGER AS $comandsManager$
BEGIN
    IF NEW.CommandFunction LIKE 'ir para%' THEN
        CALL Ir(NEW.CommandFunction);
    ELSIF NEW.CommandFunction LIKE 'entrar em%' THEN
        CALL Entrar(NEW.CommandFunction);
    ELSIF NEW.CommandFunction LIKE 'sair' THEN
        CALL Sair(NEW.CommandFunction);
    ELSIF NEW.CommandFunction LIKE 'pegar%' THEN
        CALL Pegar(NEW.CommandFunction);
    ELSIF NEW.CommandFunction LIKE 'combinar%' THEN
        CALL combinar(NEW.CommandFunction);
    ELSIF NEW.CommandFunction LIKE 'conversar com%' THEN
        CALL conversar(NEW.CommandFunction);
    ELSIF NEW.CommandFunction LIKE 'interagir%' THEN
        CALL interagir(NEW.CommandFunction);
    ELSIF NEW.CommandFunction LIKE 'viajar%' THEN
        CALL viajar(NEW.CommandFunction);
    ELSIF NEW.CommandFunction LIKE 'passar pela%' THEN
        CALL passar(NEW.CommandFunction);
    ELSIF NEW.CommandFunction LIKE 'abrir inventario' THEN
        RETURN NEW;
    ELSIF NEW.CommandFunction LIKE 'fechar inventario' THEN
        RETURN NEW;
    ELSIF NEW.CommandFunction LIKE 'viagem rapida' THEN
        RETURN NEW;
    ELSIF NEW.CommandFunction LIKE '' THEN
        RETURN NEW;
    ELSE
        RAISE EXCEPTION 'Comando inválido';
    END IF;

    RETURN NEW;
END;
$comandsManager$ LANGUAGE plpgsql;

CREATE TRIGGER comandsManager
AFTER INSERT ON Command
FOR EACH ROW EXECUTE PROCEDURE comandsManager();
