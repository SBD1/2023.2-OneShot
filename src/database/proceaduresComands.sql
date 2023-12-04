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
        SELECT RegionId INTO regiao_estrutura FROM Structure WHERE StructureName = nome_estrutura;
        IF localizacao_pc = regiao_estrutura THEN
            UPDATE PC SET PcLocationId = (SELECT LocationId FROM Location WHERE RoomId = (SELECT InitialRoom FROM Structure WHERE StructureName = nome_estrutura)) WHERE CharacterId = 1;
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


CREATE OR REPLACE PROCEDURE comandoPegar(funcao VARCHAR)
LANGUAGE plpgsql
AS $comandoPegar$
DECLARE
    nome_item VARCHAR(255);
    localizacao_pc INT;
    localizacao_item INT;
    item_id INT;
BEGIN
    IF funcao LIKE 'pegar%' THEN
        nome_item := substring(funcao from 7);
        SELECT PcLocationId INTO localizacao_pc FROM PC WHERE CharacterId = 1;
        SELECT ItemLocationId, ItemId INTO localizacao_item, item_id FROM ItemMaterial WHERE ItemName = nome_item;
        IF localizacao_pc = localizacao_item THEN
            UPDATE ItemMaterial SET ItemLocationId = NULL WHERE ItemName = nome_item;
            INSERT INTO Inventory (ItemId, CharacterId) VALUES (item_id, 1);
            RAISE NOTICE 'Niko pegou %', nome_item;
        ELSE
            RAISE NOTICE 'Niko não vê %', nome_item;
        END IF;
    END IF;
END;
$comandoPegar$;