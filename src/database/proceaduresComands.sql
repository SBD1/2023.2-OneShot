CREATE OR REPLACE PROCEDURE comandoIr(funcao VARCHAR)
LANGUAGE plpgsql
AS $comandoIr$
DECLARE
    localizacao_atual_id INT;
    direcao TEXT;
    direcaoT TEXT;
    nova_regiao_id INT;
BEGIN
    SELECT PcLocation INTO localizacao_atual_id FROM PCs WHERE CharacterId = 1;
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
        EXECUTE format('SELECT %I FROM RegionsGeo WHERE RegionId = (SELECT Region FROM Locations WHERE LocationId = %L)', direcao, localizacao_atual_id) INTO nova_regiao_id;
        IF EXISTS (SELECT 1 FROM Locations WHERE Region = nova_regiao_id) THEN
            UPDATE PCs SET PcLocation = (SELECT LocationId FROM Locations WHERE Region = nova_regiao_id LIMIT 1) WHERE CharacterId = 1;
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
        SELECT PcLocation INTO localizacao_pc FROM PCs WHERE CharacterId = 1;
        SELECT Region INTO regiao_estrutura FROM Structures WHERE StructureName = nome_estrutura;
        IF localizacao_pc = regiao_estrutura THEN
            UPDATE PCs SET PcLocation = (SELECT LocationId FROM Locations WHERE Room = (SELECT InitialRoom FROM Structures WHERE StructureName = nome_estrutura)) WHERE CharacterId = 1;
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
        SELECT Region INTO regiao_idn FROM Locations WHERE LocationId = (SELECT PcLocation FROM PCs WHERE CharacterId = 1);
        UPDATE PCs SET PcLocation = (SELECT LocationId FROM Locations WHERE Region = regiao_idn AND Room IS NULL) WHERE CharacterId = 1;
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
        SELECT PcLocation INTO localizacao_pc FROM PCs WHERE CharacterId = 1;
        SELECT ItemLocation, ItemId INTO localizacao_item, item_id FROM ItensMaterial WHERE ItemName = nome_item;
        IF localizacao_pc = localizacao_item THEN
            UPDATE ItensMaterial SET ItemLocation = NULL WHERE ItemName = nome_item;
            INSERT INTO Inventory (ItemId, CharacterId) VALUES (item_id, 1);
            RAISE NOTICE 'Niko pegou %', nome_item;
        ELSE
            RAISE NOTICE 'Niko não vê %', nome_item;
        END IF;
    END IF;
END;
$comandoPegar$;