CREATE OR REPLACE PROCEDURE comandoIr(funcao VARCHAR)
LANGUAGE plpgsql
AS $comandoIr$
DECLARE
    localizacao_atual_id INT;
    direcao TEXT;
    direcaoT TEXT;
    nova_regiao_id INT;
BEGIN
    SELECT PcLocationId INTO localizacao_atual_id FROM PC WHERE CharacterId = 1;
    direcaoT := SUBSTRING(funcao FROM 9);
    IF funcao LIKE 'ir para norte' THEN 
        direcao := 'north';
    ELSIF funcao LIKE 'ir para sul' THEN 
        direcao := 'south';
    ELSIF funcao LIKE 'ir para leste' THEN 
        direcao := 'east';
    ELSIF funcao LIKE 'ir para oeste' THEN 
        direcao := 'west';
    ELSE 
        direcao := NULL;
    END IF;

    IF direcao IS NOT NULL THEN
        EXECUTE format('SELECT %I FROM RegionGeo WHERE RegionId = (SELECT RegionId FROM Location WHERE LocationId = %L)', direcao, localizacao_atual_id) INTO nova_regiao_id;
        IF EXISTS (SELECT 1 FROM Location WHERE RegionId = nova_regiao_id) THEN
            UPDATE PC SET PcLocationId = (SELECT LocationId FROM Location WHERE RegionId = nova_regiao_id LIMIT 1) WHERE CharacterId = 1;
        ELSE
            RAISE EXCEPTION 'Não é possível ir para %', direcaoT;
        END IF;
    ELSE
        RAISE EXCEPTION 'Não é possível ir para %', direcaoT;
    END IF;
END;
$comandoIr$;

---------------------------------------------------------------------------------------

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
        SELECT PcLocationId INTO localizacao_pc FROM PC WHERE CharacterId = 1;
        SELECT RegionId INTO regiao_estrutura FROM Structure WHERE LOWER(StructureName) = nome_estrutura;
        IF localizacao_pc = regiao_estrutura THEN
            UPDATE PC SET PcLocationId = (SELECT LocationId FROM Location WHERE RoomId = (SELECT InitialRoom FROM Structure WHERE LOWER(StructureName) = nome_estrutura)) WHERE CharacterId = 1;
        ELSE
            RAISE EXCEPTION 'Niko não encontra %', nome_estrutura;
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
        SELECT RegionId INTO regiao_idn FROM Location WHERE LocationId = (SELECT PcLocationId FROM PC WHERE CharacterId = 1);
        UPDATE PC SET PcLocationId = (SELECT LocationId FROM Location WHERE RegionId = regiao_idn AND RoomId IS NULL) WHERE CharacterId = 1;
    END IF;
END;
$comandoSair$;

---------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE comandoPegar(funcao VARCHAR)
LANGUAGE plpgsql
AS $comandoPegar$
DECLARE
    nome_item VARCHAR(255);
    localizacao_pc INT;
    localizacao_itemM INT;
    itemM_id INT;
    localizacao_itemE INT;
    itemE_id INT;
BEGIN
    IF funcao LIKE 'pegar%' THEN
        nome_item := substring(funcao from 7);
        SELECT PcLocationId INTO localizacao_pc FROM PC WHERE CharacterId = 1;
        
        SELECT ItemLocationId, ItemId INTO localizacao_itemM, itemM_id FROM ItemMaterial WHERE LOWER(ItemName) = nome_item;
        IF localizacao_pc = localizacao_itemM THEN
            UPDATE ItemMaterial SET ItemLocationId = NULL WHERE LOWER(ItemName) = nome_item;
            INSERT INTO Inventory (ItemId, CharacterId) VALUES (itemM_id, 1);
            RAISE NOTICE 'Niko pegou %', INITCAP(nome_item);
        END IF;

        SELECT ItemLocationId, ItemId INTO localizacao_itemE, itemE_id FROM ItemEquipment WHERE LOWER(ItemName) = nome_item;
        IF localizacao_pc = localizacao_itemE THEN
            UPDATE ItemEquipment SET ItemLocationId = NULL WHERE LOWER(ItemName) = nome_item;
            INSERT INTO Inventory (ItemId, CharacterId) VALUES (itemE_id, 1);
            RAISE NOTICE 'Niko pegou %', INITCAP(nome_item);
        END IF;

        IF localizacao_itemM IS NULL AND localizacao_itemE IS NULL THEN
            RAISE EXCEPTION 'Niko não vê %', INITCAP(nome_item);
        END IF;
    END IF;
END;
$comandoPegar$;

---------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE combinar(funcao VARCHAR)
LANGUAGE plpgsql
AS $combinar$
DECLARE
    nome_item1 VARCHAR(255);
    nome_item2 VARCHAR(255);
    nome_item_resultado1 VARCHAR(255);
    nome_item_resultado2 VARCHAR(255);
    item1_id INT;
    item2_id INT;
    resultado_id1 INT;
    resultado_id2 INT;
BEGIN
    IF funcao LIKE 'combinar%' THEN
        nome_item1 := substring(funcao from 10 for position(' com ' in substring(funcao from 10)) - 1);
        nome_item2 := substring(funcao from 10 + position(' com ' in substring(funcao from 10)) + 4);

        SELECT Inventory.ItemId INTO item1_id FROM Inventory JOIN ItemMaterial ON Inventory.ItemId = ItemMaterial.ItemId WHERE CharacterId = 1 AND LOWER(ItemMaterial.ItemName) = LOWER(nome_item1);
        SELECT Inventory.ItemId INTO item2_id FROM Inventory JOIN ItemMaterial ON Inventory.ItemId = ItemMaterial.ItemId WHERE CharacterId = 1 AND LOWER(ItemMaterial.ItemName) = LOWER(nome_item2);
        
        IF item1_id IS NULL OR item2_id IS NULL THEN
            RAISE EXCEPTION 'Niko não tem % ou % no inventário', INITCAP(nome_item1), INITCAP(nome_item2);
        END IF;

        SELECT Result1Id, Result2Id INTO resultado_id1, resultado_id2 FROM Combination WHERE (Material1Id = item1_id AND Material2Id = item2_id) OR (Material1Id = item2_id AND Material2Id = item1_id);

        IF resultado_id1 IS NULL THEN
            RAISE EXCEPTION 'Niko não pode combinar % e %', INITCAP(nome_item1), INITCAP(nome_item2);
        END IF;

        SELECT ItemName INTO nome_item_resultado1 FROM ItemMaterial WHERE ItemId = resultado_id1;
        DELETE FROM Inventory WHERE CharacterId = 1 AND ItemId IN (item1_id, item2_id);
        INSERT INTO Inventory (ItemId, CharacterId) VALUES (resultado_id1, 1);

        IF resultado_id2 IS NOT NULL THEN
            SELECT ItemName INTO nome_item_resultado2 FROM ItemMaterial WHERE ItemId = resultado_id2;
            INSERT INTO Inventory (ItemId, CharacterId) VALUES (resultado_id2, 1);
            RAISE NOTICE 'Niko combinou % e % para criar %, % não foi consumido no processo', INITCAP(nome_item1), INITCAP(nome_item2), INITCAP(nome_item_resultado1), INITCAP(nome_item_resultado2);
        ELSE 
            RAISE NOTICE 'Niko combinou % e % para criar %', INITCAP(nome_item1), INITCAP(nome_item2), INITCAP(nome_item_resultado1);
        END IF;
    END IF;
END;
$combinar$;

---------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE eventScheduler(event_id INT)
LANGUAGE plpgsql
AS $eventScheduler$
DECLARE
    evento_tipo VARCHAR(20);
    efeito VARCHAR(255);
BEGIN
    SELECT EventType INTO evento_tipo FROM Event E WHERE E.EventId = event_id;
    IF evento_tipo = 'Chat' THEN
        SELECT Command INTO efeito FROM ChatEvent E WHERE E.EventId = event_id;
    ELSIF evento_tipo = 'Interact' THEN
        SELECT Command INTO efeito FROM InteractEvent E WHERE E.EventId = event_id;
    ELSIF evento_tipo = 'Room' THEN
        SELECT Command INTO efeito FROM RoomEvent E WHERE E.EventId = event_id;
    END IF;
    EXECUTE efeito;
END;
$eventScheduler$;
