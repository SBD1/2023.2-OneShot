INSERT INTO Phases (PhaseName, PhaseDescription)
VALUES ('Fase teste', 'Fase teste');

INSERT INTO Regions (RegionName, RegionDescription, Phase)
VALUES ('Regiao teste CENTRAL','Niko está na região CENTRAL',1);

INSERT INTO RegionsGeo (North, South, East, West)
VALUES (NULL, NULL, NULL, NULL);

INSERT INTO Regions (RegionName, RegionDescription, Phase)
VALUES ('Regiao teste NORTE','Niko está na região NORTE',1);

INSERT INTO RegionsGeo (North, South, East, West)
VALUES (NULL, 1, NULL, NULL);

INSERT INTO Regions (RegionName, RegionDescription, Phase)
VALUES ('Regiao teste SUL','Niko está na região SUL',1);

INSERT INTO RegionsGeo (North, South, East, West)
VALUES (1, NULL, NULL, NULL);

INSERT INTO Regions (RegionName, RegionDescription, Phase)
VALUES ('Regiao teste LESTE','Niko está na região LESTE',1);

INSERT INTO RegionsGeo (North, South, East, West)
VALUES (NULL, NULL, NULL, 1);

INSERT INTO Regions (RegionName, RegionDescription, Phase)
VALUES ('Regiao teste OESTE','Niko está na região OESTE',1);

INSERT INTO RegionsGeo (North, South, East, West)
VALUES (NULL, NULL, 1, NULL);



INSERT INTO Structures (StructureName,StructureDescription, Region)
VALUES ('estrutura teste', 'estrutura teste', 1);

INSERT INTO Structures (StructureName,StructureDescription, Region)
VALUES ('estrutura teste2', 'estrutura teste2', 2);

INSERT INTO Rooms(RoomName, RoomDescription, Structure)
VALUES ('sala teste', 'sala teste', 1);

INSERT INTO Rooms(RoomName, RoomDescription, Structure)
VALUES ('sala teste2', 'sala teste2', 2);



INSERT INTO locations (Region)
VALUES (1);

INSERT INTO locations (Region)
VALUES (2);

INSERT INTO locations (Region)
VALUES (3);

INSERT INTO locations (Region)
VALUES (4);

INSERT INTO locations (Region)
VALUES (5);

INSERT INTO locations (Region, Room)
VALUES (1, 1);

INSERT INTO locations (Region, Room)
VALUES (2, 2);




INSERT INTO Objects (ObjectName, ObjectDescription, DescriptionOnInteract, ObjectLocation)
VALUES ('objeto teste', 'objeto teste', 'objeto teste', 1);

INSERT INTO itens(ItemType)
VALUES ('material');

INSERT INTO ItensMaterial (ItemId, ItemName, ItemDescription, ItemLocation)
VALUES (1, 'item teste', 'item teste', 1);


INSERT INTO Objects (ObjectName, ObjectDescription, DescriptionOnInteract, ObjectLocation)
VALUES ('objeto teste2', 'objeto teste2', 'objeto teste2', 6);

INSERT INTO itens(ItemType)
VALUES ('material');

INSERT INTO ItensMaterial (ItemId, ItemName, ItemDescription, ItemLocation)
VALUES (2, 'item teste2', 'item teste2', 6);


INSERT INTO characters (CharacterType)
VALUES ('pc');

INSERT INTO PCs(CharacterId, PcLocation)
VALUES (1, 1);



