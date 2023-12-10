CREATE OR REPLACE PROCEDURE Ir(funcao VARCHAR)
LANGUAGE plpgsql
AS $Ir$
DECLARE
    localizacao_atual_id INT;
    direcao TEXT;
    direcaoT TEXT;
    nova_regiao_id INT;
    equipamento_id INT;
    nome_equipamento VARCHAR(150);
    motivo varchar(150);
BEGIN
    SELECT PcLocationId INTO localizacao_atual_id FROM PC WHERE CharacterId = 1;
    direcaoT := SUBSTRING(funcao FROM 9);
    direcao := CASE
        WHEN funcao LIKE 'ir para norte' THEN 'north'
        WHEN funcao LIKE 'ir para sul' THEN 'south'
        WHEN funcao LIKE 'ir para leste' THEN 'east'
        WHEN funcao LIKE 'ir para oeste' THEN 'west'
        ELSE NULL
    END;
    IF direcao IS NOT NULL THEN
        EXECUTE format('SELECT %I FROM RegionGeo WHERE RegionId = (SELECT RegionId FROM Location WHERE LocationId = %L)', direcao, localizacao_atual_id) INTO nova_regiao_id;
        IF EXISTS (SELECT 1 FROM Location WHERE RegionId = nova_regiao_id) THEN
            SELECT Requirement, WhyisBlocked INTO equipamento_id, motivo FROM Region WHERE RegionId = nova_regiao_id;
            SELECT ItemName into nome_equipamento FROM ItemEquipment WHERE ItemId = equipamento_id;
            IF equipamento_id IS NOT NULL THEN
                IF NOT EXISTS (SELECT 1 FROM Inventory WHERE CharacterId = 1 AND ItemId = equipamento_id) THEN
                    RAISE EXCEPTION 'Niko não consegue ir para %, %', INITCAP(direcaoT), motivo;
                ELSE
                    UPDATE PC SET PcLocationId = (SELECT LocationId FROM Location WHERE RegionId = nova_regiao_id LIMIT 1) WHERE CharacterId = 1;  
                END IF;
            ELSE
                UPDATE PC SET PcLocationId = (SELECT LocationId FROM Location WHERE RegionId = nova_regiao_id LIMIT 1) WHERE CharacterId = 1;
            END IF;
        ELSE
            RAISE EXCEPTION 'Não é possível ir para %', INITCAP(direcaoT);
        END IF;
    ELSE
        RAISE EXCEPTION 'Não é possível ir para %', INITCAP(direcaoT);
    END IF;
END;
$Ir$;

---------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE Entrar(funcao VARCHAR)
LANGUAGE plpgsql
AS $Entrar$
DECLARE
    nome_estrutura VARCHAR(150);
    localizacao_pc INT;
    regiao_estrutura INT;
    salainicial_id INT;
    id_objeto INT;  -- id_objeto deve ser INT, não BOOLEAN
    localizacao_estrutura INT;
BEGIN
    nome_estrutura := substring(funcao from 11);
    SELECT PcLocationId INTO localizacao_pc FROM PC WHERE CharacterId = 1;
    SELECT RegionId INTO regiao_estrutura FROM Structure WHERE LOWER(StructureName) = nome_estrutura;
    SELECT LocationId INTO localizacao_estrutura FROM Location WHERE RegionId = regiao_estrutura;

    IF localizacao_pc = localizacao_estrutura THEN
        SELECT InitialRoom INTO salainicial_id FROM Structure WHERE LOWER(StructureName) = nome_estrutura;
        SELECT BlockedBy INTO id_objeto FROM Room WHERE RoomId = salainicial_id;
        IF id_objeto IS NULL THEN
            UPDATE PC SET PcLocationId = (SELECT LocationId FROM Location WHERE RoomId = salainicial_id) WHERE CharacterId = 1;
        ELSE
            IF (SELECT Locks FROM Object WHERE ObjectId = id_objeto) = FALSE THEN
                UPDATE PC SET PcLocationId = (SELECT LocationId FROM Location WHERE RoomId = salainicial_id) WHERE CharacterId = 1;
            ELSE
                RAISE EXCEPTION '%', (SELECT ObjectDescription FROM Object WHERE ObjectId = id_objeto);
            END IF;
        END IF;
    ELSE
        RAISE EXCEPTION 'Niko não encontra %', nome_estrutura;
    END IF;
END;
$Entrar$;

---------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE Sair(funcao VARCHAR)
LANGUAGE plpgsql
AS $Sair$
DECLARE
    regiao_idn INT;
    new_location INT;
BEGIN
    SELECT RegionId INTO regiao_idn FROM Location WHERE LocationId = (SELECT PcLocationId FROM PC WHERE CharacterId = 1);
    SELECT LocationId INTO new_location FROM Location WHERE RegionId = regiao_idn AND RoomId IS NULL;
    IF new_location IS NULL THEN
        RAISE EXCEPTION 'Niko não consegue sair';
    ELSE
        UPDATE PC SET PcLocationId = new_location WHERE CharacterId = 1;
    END IF;
END;
$Sair$;

---------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE Pegar(funcao VARCHAR)
LANGUAGE plpgsql
AS $Pegar$
DECLARE
    nome_item VARCHAR(150);
    localizacao_pc INT;
    localizacao_itemM INT;
    itemM_id INT;
    localizacao_itemE INT;
    itemE_id INT;
BEGIN
    nome_item := substring(funcao from 7);
    SELECT PcLocationId INTO localizacao_pc FROM PC WHERE CharacterId = 1;
    
    SELECT ItemLocationId, ItemId INTO localizacao_itemM, itemM_id FROM ItemMaterial WHERE LOWER(ItemName) = nome_item;
    IF localizacao_pc = localizacao_itemM THEN
        UPDATE ItemMaterial SET ItemLocationId = NULL WHERE LOWER(ItemName) = nome_item;
        INSERT INTO Inventory (ItemId, CharacterId) VALUES (itemM_id, 1);
        RAISE NOTICE 'NOTICE Niko pegou %', INITCAP(nome_item);
    END IF;

    SELECT ItemLocationId, ItemId INTO localizacao_itemE, itemE_id FROM ItemEquipment WHERE LOWER(ItemName) = nome_item;
    IF localizacao_pc = localizacao_itemE THEN
        UPDATE ItemEquipment SET ItemLocationId = NULL WHERE LOWER(ItemName) = nome_item;
        INSERT INTO Inventory (ItemId, CharacterId) VALUES (itemE_id, 1);
        RAISE NOTICE 'NOTICE Niko pegou %', INITCAP(nome_item);
    END IF;

    IF localizacao_itemM IS NULL AND localizacao_itemE IS NULL THEN
        RAISE EXCEPTION 'Niko não vê %', INITCAP(nome_item);
    END IF;
END;
$Pegar$;

---------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE combinar(funcao VARCHAR)
LANGUAGE plpgsql
AS $combinar$
DECLARE
    nome_item1 VARCHAR(150);
    nome_item2 VARCHAR(150);
    nome_item_resultado1 VARCHAR(150);
    nome_item_resultado2 VARCHAR(150);
    nome_equipamento VARCHAR(150);
    item1_id INT;
    item2_id INT;
    resultado_id1 INT;
    resultado_id2 INT;
    equipamento_id INT;
BEGIN
    nome_item1 := substring(funcao from 10 for position(' com ' in substring(funcao from 10)) - 1);
    nome_item2 := substring(funcao from 10 + position(' com ' in substring(funcao from 10)) + 4);

    SELECT Inventory.ItemId INTO item1_id FROM Inventory JOIN ItemMaterial ON Inventory.ItemId = ItemMaterial.ItemId WHERE CharacterId = 1 AND LOWER(ItemMaterial.ItemName) = LOWER(nome_item1);
    SELECT Inventory.ItemId INTO item2_id FROM Inventory JOIN ItemMaterial ON Inventory.ItemId = ItemMaterial.ItemId WHERE CharacterId = 1 AND LOWER(ItemMaterial.ItemName) = LOWER(nome_item2);
    
    IF item1_id IS NULL THEN
        RAISE EXCEPTION 'Niko não tem % no inventário', INITCAP(nome_item1);
    ELSIF item2_id IS NULL THEN
        RAISE EXCEPTION 'Niko não tem % no inventário', INITCAP(nome_item2);
    END IF;

    SELECT Result1Id, Result2Id, equipmentId INTO resultado_id1, resultado_id2, equipamento_id FROM Combination WHERE (Material1Id = item1_id AND Material2Id = item2_id) OR (Material1Id = item2_id AND Material2Id = item1_id);
    SELECT ItemName INTO nome_equipamento FROM ItemEquipment WHERE ItemId = equipamento_id;

    IF resultado_id1 IS NULL THEN
        RAISE EXCEPTION 'Niko não pode combinar % e %', INITCAP(nome_item1), INITCAP(nome_item2);
    END IF;

    if equipamento_id is not null then
        IF NOT EXISTS (SELECT 1 FROM Inventory WHERE CharacterId = 1 AND ItemId = equipamento_id) THEN
            RAISE EXCEPTION 'Niko não conseguiu combinar % e %, pois não possui %', INITCAP(nome_item1), INITCAP(nome_item2), INITCAP(nome_equipamento);
        END IF;
    end if;

    SELECT ItemName INTO nome_item_resultado1 FROM ItemMaterial WHERE ItemId = resultado_id1;
    DELETE FROM Inventory WHERE CharacterId = 1 AND ItemId IN (item1_id, item2_id);
    INSERT INTO Inventory (ItemId, CharacterId) VALUES (resultado_id1, 1);

    IF resultado_id2 IS NOT NULL THEN
        SELECT ItemName INTO nome_item_resultado2 FROM ItemMaterial WHERE ItemId = resultado_id2;
        INSERT INTO Inventory (ItemId, CharacterId) VALUES (resultado_id2, 1);
        RAISE NOTICE 'NOTICE Niko combinou % e % para criar %, % não foi consumido no processo', INITCAP(nome_item1), INITCAP(nome_item2), INITCAP(nome_item_resultado1), INITCAP(nome_item_resultado2);
    ELSE 
        RAISE NOTICE 'NOTICE Niko combinou % e % para criar %', INITCAP(nome_item1), INITCAP(nome_item2), INITCAP(nome_item_resultado1);
    END IF;
END;
$combinar$;

---------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE eventScheduler(event_id INT)
LANGUAGE plpgsql
AS $eventScheduler$
DECLARE
    evento_tipo VARCHAR(150);
    efeito VARCHAR(700);
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

---------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE Conversar(funcao VARCHAR)
LANGUAGE plpgsql
AS $Conversar$
DECLARE
    nome_npc VARCHAR(150);
    localizacao_npc INT;
    localizacao_pc INT;
    npc_id INT;
    evento_id INT;
BEGIN
    SELECT npc.npcName, npc.npclocationid, npc.CharacterId, EventId INTO nome_npc, localizacao_npc, npc_id, evento_id FROM npc WHERE LOWER(npcname) = substring(funcao from 15);
    SELECT pc.PcLocationId INTO localizacao_pc FROM pc WHERE pc.CharacterId = 1;
    IF nome_npc IS NULL THEN
        RAISE EXCEPTION 'Niko não vê %', INITCAP(substring(funcao from 15));
    END IF;
    IF evento_id IS NULL THEN
        RAISE EXCEPTION 'Evento não registrado';
    END IF;
    IF localizacao_npc = localizacao_pc THEN
        CALL eventScheduler(evento_id);
    ELSE
        RAISE EXCEPTION 'Niko não vê %', INITCAP(nome_npc);
    END IF;


END;
$Conversar$;

---------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE dialoguecall(event_id INT)
LANGUAGE plpgsql
AS $dialoguecall$
BEGIN
    RAISE NOTICE 'DIALOGUE EVENT %', event_id;
END
$dialoguecall$;

---------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE Interagir(funcao VARCHAR)
LANGUAGE plpgsql
AS $Interagir$
DECLARE
    objeto_nome VARCHAR(150);
    item_nome VARCHAR(150);
    objeto_id INT;
    objeto_evento INT;
    item_objeto INT;
    Item_Id INT;
    localizacao_objeto INT;
    localizacao_pc INT;
    evento_id INT;
    Descricao VARCHAR(255);
    Descricao_on_interact VARCHAR(255);
BEGIN
    SELECT pc.PcLocationId INTO localizacao_pc FROM pc WHERE pc.CharacterId = 1;
    funcao := split_part(funcao, ' com ', 2);
    
    IF position(' utilizando ' in funcao) = 0 THEN
        objeto_nome := funcao;
        item_nome := NULL;

        SELECT O.ObjectId, O.objectlocationid, O.ActivationItem, O.DescriptionOnInteract, O.ObjectDescription, O.EventId INTO objeto_id, localizacao_objeto, item_objeto, Descricao_on_interact, Descricao, objeto_evento FROM object O WHERE LOWER(objectname) = objeto_nome;
        IF objeto_id IS NULL OR localizacao_objeto != localizacao_pc THEN
            RAISE EXCEPTION 'Niko não vê %', INITCAP(objeto_nome);
        END IF;
        IF item_objeto IS NULL AND objeto_evento IS NOT NULL THEN
            RAISE NOTICE 'NOTICE %', Descricao_on_interact;
            CALL eventScheduler (objeto_evento);
        ELSE
            RAISE NOTICE 'NOTICE %', Descricao;
        END IF; 

    ELSE
        objeto_nome := split_part(funcao, ' utilizando ', 1);
        item_nome := split_part(funcao, ' utilizando ', 2);

        SELECT O.ObjectId, O.objectlocationid, O.ActivationItem, O.DescriptionOnInteract, O.ObjectDescription, O.EventId INTO objeto_id, localizacao_objeto, item_objeto, Descricao_on_interact, Descricao, objeto_evento FROM object O WHERE LOWER(objectname) = objeto_nome;
        SELECT I.itemid INTO Item_Id FROM ItemMaterial I WHERE LOWER(I.ItemName) = item_nome;
        
        IF objeto_id IS NULL OR localizacao_objeto != localizacao_pc THEN
            RAISE EXCEPTION 'Niko não vê %', INITCAP(objeto_nome);
        END IF;

        IF NOT EXISTS (SELECT 1 FROM Inventory WHERE CharacterId = 1 AND ItemId = Item_Id) THEN
            RAISE EXCEPTION 'Niko não não possui %', INITCAP(item_nome);
        END IF;

        IF item_objeto IS NULL OR item_objeto != Item_Id THEN
            RAISE EXCEPTION 'Niko não consegue utilizar % em %',INITCAP(item_nome), INITCAP(objeto_nome);
        END IF;

        RAISE NOTICE 'NOTICE %', Descricao_on_interact;
        CALL eventScheduler (objeto_evento);

    END IF;
END;
$Interagir$;

---------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE viajar(funcao VARCHAR)
LANGUAGE plpgsql
AS $viajar$
DECLARE
    nome_regiao VARCHAR(150);
    localizacao_pc INT;
    regiao_id INT;
    regiao_local INT;
BEGIN
    nome_regiao := split_part(funcao, ' para ', 2);
    SELECT PcLocationId INTO localizacao_pc FROM PC WHERE CharacterId = 1;
    SELECT RegionId INTO regiao_id FROM Region WHERE LOWER(RegionName) = nome_regiao;
    SELECT LocationId INTO regiao_local FROM Location WHERE RegionId = regiao_id AND RoomId IS NULL;
        IF EXISTS (SELECT 1 FROM Location WHERE LocationId = localizacao_pc AND RoomId IS NOT NULL) THEN
        RAISE EXCEPTION 'Niko não consegue viajar de dentro de um estrutura';
    END IF;
    IF regiao_id IS NULL OR NOT EXISTS (SELECT 1 FROM VisitedRegion WHERE RegionId = regiao_id AND CharacterId = 1) THEN
        RAISE EXCEPTION 'Niko não conhece %', INITCAP(nome_regiao);
    END IF;
    IF localizacao_pc = regiao_local THEN
        RAISE EXCEPTION 'Niko já está em %', INITCAP(nome_regiao);
    END IF;
    UPDATE PC SET PcLocationId = (SELECT LocationId FROM Location WHERE RegionId = regiao_id AND RoomId IS NULL) WHERE CharacterId = 1;
END;
$viajar$;

---------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE passar(funcao VARCHAR)
LANGUAGE plpgsql
AS $passar$
DECLARE
    nome_conexao VARCHAR(150);
    localizacao_pc INT;
    quarto_pc INT;
    quarto_alvo INT;
    locked BOOLEAN;
    id_objeto INT;

BEGIN
    nome_conexao := split_part(funcao, ' pela ', 2);
    SELECT PcLocationId into localizacao_pc FROM PC WHERE CharacterId = 1;
    SELECT RoomId into quarto_pc FROM Location WHERE LocationId = localizacao_pc;
    IF quarto_pc IS NULL THEN
        RAISE EXCEPTION 'Niko não entendeu que %', INITCAP(nome_conexao);
    ELSE
        SELECT Room2Id into quarto_alvo FROM Connection WHERE LOWER(ConnectionName) = nome_conexao AND Room1Id = quarto_pc ;
        IF quarto_alvo IS NULL THEN
            SELECT Room1Id into quarto_alvo FROM Connection WHERE LOWER(ConnectionName) = nome_conexao AND Room2Id = quarto_pc ;
        END IF;
        IF quarto_alvo IS NULL THEN
            RAISE EXCEPTION 'Niko não entendeu que %', INITCAP(nome_conexao);
        ELSE
            SELECT BlockedBy INTO id_objeto FROM Room WHERE RoomId = quarto_alvo;
            IF id_objeto IS NULL THEN
                UPDATE PC SET PcLocationId = (SELECT LocationId FROM Location WHERE RoomId = quarto_alvo) WHERE CharacterId = 1;
            ELSE
                SELECT Locks INTO locked FROM Object WHERE ObjectId = id_objeto;
                IF locked = FALSE THEN
                    UPDATE PC SET PcLocationId = (SELECT LocationId FROM Location WHERE RoomId = quarto_alvo) WHERE CharacterId = 1;
                ELSE
                    RAISE EXCEPTION '%', (SELECT ObjectDescription FROM Object WHERE ObjectId = id_objeto);
                END IF;
            END IF;
        END IF;
    END IF;
END;
$passar$;

---------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE olhar()
LANGUAGE plpgsql
AS $olhar$
DECLARE
    pc_location INT;
    room_id INT;
    region_id INT;
    descricao VARCHAR (250);

BEGIN
    SELECT PcLocationId INTO pc_location FROM PC WHERE CharacterId = 1;
    SELECT RegionID, RoomId INTO region_id, room_id FROM Location WHERE LocationId = pc_location;
    IF room_id IS NULL THEN
        SELECT RegionDescription INTO descricao FROM Region WHERE RegionId = region_id;
    ELSE
        SELECT RoomDescription INTO descricao FROM Room WHERE RoomId = room_id;
    END IF;

    RAISE NOTICE 'NOTICE %', descricao;
END; 
$olhar$;

---------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE raiseTexto(texto VARCHAR)
LANGUAGE plpgsql
AS $raiseTexto$
BEGIN
    RAISE NOTICE 'NOTICE %', texto;
END;
$raiseTexto$;

----------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE ajuda()
LANGUAGE plpgsql
AS $ajuda$
BEGIN
    RAISE NOTICE 'MENU AJUDA';
END;
$ajuda$;

-----------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE fimdojogo()
LANGUAGE plpgsql
AS $fimdojogo$
BEGIN
    RAISE NOTICE 'GAME END';
END
$fimdojogo$;