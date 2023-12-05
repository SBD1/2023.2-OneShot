<center>

# <a>Triggers</a>
</center>

## <a>Introdução</a>
Um **<a>Trigger</a>** é um procedimento armazenado no banco de dados que é chamado automaticamente sempre que ocorre um evento especial no banco de dados. Por exemplo, um acionador pode ser chamado quando uma linha é inserida em uma tabela especificada ou quando determinadas colunas da tabela estão sendo atualizadas. Os triggers podem ser usados para aplicar restrições e garantir que os dados inseridos ou atualizados estejam de acordo com determinadas regras e padrões. Automatização Com triggers, tarefas complexas podem ser automatizadas, poupando tempo e reduzindo a possibilidade de erros humanos.

## <a>Triggers Desenvolvidos</a>


**<a>Define a geografia correta entre regiões</a>**
```SQL
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
```

**<a>Define o quarto inicial de uma estrutura</a>**
```SQL
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
```

**<a>Garante a inserção correta na tabela Characters</a>**
```SQL
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
```

**<a>Garante a inserção correta na tabela Character</a>**
```SQL
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
```

**<a>Garante a inserção correta na tabela Item</a>**
```SQL
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
```

**<a>Garante a inserção correta na tabela Item</a>**
```SQL
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
```

**<a>Garante a inserção correta na tabela Evento</a>**
```SQL
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
```

**<a>Garante a inserção correta na tabela Evento</a>**
```SQL
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
```

**<a>Garante a inserção correta na tabela Evento</a>**
```SQL
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
```

**<a>Realiza o controle do jogo</a>**
```SQL
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
    ELSIF NEW.CommandFunction LIKE 'combinar%' THEN
        CALL combinar(NEW.CommandFunction);
    ELSIF NEW.CommandFunction LIKE 'abrir inventario' THEN
        RETURN NEW;
    ELSIF NEW.CommandFunction LIKE 'fechar inventario' THEN
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
```


## <a>Histórico de Versão</a>
<center>

|   Data   | Versão |      Descrição       |                   Autor                    |
| :------: | :----: | :------------------: | :----------------------------------------: |
| 25/11/23 |  1.0   | Criação do documento | [João Lucas](https://github.com/HacKairos) |

</center>

## <a>Bilbiografia</a>
    AVI SILBERSCHATZ, HENRY F. KORTH, S. SUDARSHAN. Database System Concepts. [s.l: s.n.].