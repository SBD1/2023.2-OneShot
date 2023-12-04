INSERT INTO Phase (PhaseName, PhaseDescription)
VALUES ('Fase teste', 'Fase teste');

INSERT INTO Region (RegionName, RegionDescription, PhaseId)
VALUES ('Regiao teste CENTRAL','Niko está na região CENTRAL',1);

INSERT INTO RegionGeo (North, South, East, West)
VALUES (NULL, NULL, NULL, NULL);

INSERT INTO Region (RegionName, RegionDescription, PhaseId)
VALUES ('Regiao teste NORTE','Niko está na região NORTE',1);

INSERT INTO RegionGeo (North, South, East, West)
VALUES (NULL, 1, NULL, NULL);

INSERT INTO Region (RegionName, RegionDescription, PhaseId)
VALUES ('Regiao teste SUL','Niko está na região SUL',1);

INSERT INTO RegionGeo (North, South, East, West)
VALUES (1, NULL, NULL, NULL);

INSERT INTO Region (RegionName, RegionDescription, PhaseId)
VALUES ('Regiao teste LESTE','Niko está na região LESTE',1);

INSERT INTO RegionGeo (North, South, East, West)
VALUES (NULL, NULL, NULL, 1);

INSERT INTO Region (RegionName, RegionDescription, PhaseId)
VALUES ('Regiao teste OESTE','Niko está na região OESTE',1);

INSERT INTO RegionGeo (North, South, East, West)
VALUES (NULL, NULL, 1, NULL);



INSERT INTO Structure (StructureName,StructureDescription, RegionId)
VALUES ('estrutura teste', 'estrutura teste', 1);

INSERT INTO Structure (StructureName,StructureDescription, RegionId)
VALUES ('estrutura teste2', 'estrutura teste2', 2);

INSERT INTO Room(RoomName, RoomDescription, StructureId)
VALUES ('sala teste', 'sala teste', 1);

INSERT INTO Room(RoomName, RoomDescription, StructureId)
VALUES ('sala teste2', 'sala teste2', 2);



INSERT INTO Location (RegionId)
VALUES (1);

INSERT INTO Location (RegionId)
VALUES (2);

INSERT INTO Location (RegionId)
VALUES (3);

INSERT INTO Location (RegionId)
VALUES (4);

INSERT INTO Location (RegionId)
VALUES (5);

INSERT INTO Location (RegionId, RoomId)
VALUES (1, 1);

INSERT INTO Location (RegionId, RoomId)
VALUES (2, 2);




INSERT INTO Object (ObjectName, ObjectDescription, DescriptionOnInteract, ObjectLocationId)
VALUES ('objeto teste', 'objeto teste', 'objeto teste', 1);


INSERT INTO ItemMaterial (ItemId, ItemName, ItemDescription, ItemLocationId)
VALUES (0, 'item teste', 'item teste', 1);


INSERT INTO Object (ObjectName, ObjectDescription, DescriptionOnInteract, ObjectLocationId)
VALUES ('objeto teste2', 'objeto teste2', 'objeto teste2', 6);

INSERT INTO ItemMaterial (ItemId, ItemName, ItemDescription, ItemLocationId)
VALUES (0, 'item teste2', 'item teste2', 6);


INSERT INTO PC(CharacterId, PcLocationId)
VALUES (0, 1);

INSERT INTO PC(CharacterId, PcLocationId)
VALUES (0, 6);

INSERT INTO ChatEvent (EventId, Command)
VALUES (0, ' ');


INSERT INTO NPC (CharacterId, NpcName, NpcDescription, EventId)
VALUES (0, 'npc teste', 'npc teste', 1);
