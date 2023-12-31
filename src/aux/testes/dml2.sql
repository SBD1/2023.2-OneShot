-- INSERT INTO Phase (PhaseName, PhaseDescription)
-- VALUES ('Casa Estranha','Tuturial');

-- INSERT INTO Region (RegionName, RegionDescription, PhaseId)
-- VALUES ('Casa Estranha','Tuturial', 1)

-- INSERT INTO RegionGeo (North, South, East, West)
-- VALUES (NULL, NULL, NULL, NULL);

-- INSERT INTO Structure (StructureName,StructureDescription, RegionId)
-- VALUES ('Casa Estranha', 'Casa', 1);

-- INSERT INTO Room(RoomName, RoomDescription, StructureId)
-- VALUES ('Quarto', 'Quarto sombrio em que a unica iluminação vem da janela', 1);


INSERT INTO Phase (PhaseName, PhaseDescription)
VALUES ('Fase teste', 'Fase teste');

INSERT INTO Region (RegionName, RegionDescription, PhaseId)
VALUES ('Regiao teste CENTRAu','Niko olha em volta e ve uma estrutra antiga que parece uma fabrica',1);

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
VALUES ('Estrutura teste5', 'Estrutura teste', 1);

INSERT INTO Structure (StructureName,StructureDescription, RegionId)
VALUES ('Estrutura teste2', 'Estrutura teste2', 2);

INSERT INTO InteractEvent (EventId, Command)
VALUES (0, 'UPDATE object set Locks = FALSE where objectId = 1;UPDATE object set objectlocationId = NULL where objectId = 1;');



INSERT INTO Room(RoomName, RoomDescription, StructureId)
VALUES ('sala teste', 'Niko olha em volta e enxerga uma sala antiga e uma porta', 1 );

INSERT INTO Room(RoomName, RoomDescription, StructureId)
VALUES ('sala teste2', 'sala teste2', 1);

INSERT INTO Connection (ConnectionName, Room1Id, Room2Id)
VALUES ('Porta', 1, 2);

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
VALUES (1, 2);

INSERT INTO Object (ObjectName, ObjectDescription,DescriptionOnInteract, ObjectLocationId, Locks, eventId)
VALUES ('alavanca','A porta esta trancada','Niko destrancou a porta',6, TRUE, 1);

UPDATE Room SET BlockedBy = 1 WHERE RoomId = 2;












INSERT INTO ItemMaterial (ItemId, ItemName, ItemDescription, ItemLocationId)
VALUES (0, 'A', 'Descrição do item A', 6);

INSERT INTO ItemMaterial (ItemId, ItemName, ItemDescription, ItemLocationId)
VALUES (0, 'Item B', 'Descrição do item B', 6);

INSERT INTO ItemMaterial (ItemId, ItemName, ItemDescription, ItemLocationId)
VALUES (0, 'C', 'Descrição do item C', NULL);

INSERT INTO ItemEquipment (ItemId, ItemName, ItemDescription, ItemLocationId)
VALUES (0, 'luva', 'Equipamento', 1);

INSERT INTO combination (Material1Id, Material2Id, Result1Id, Result2Id)
VALUES (1, 2, 3, NULL);

INSERT INTO Object (ObjectName, ObjectDescription, DescriptionOnInteract, ObjectLocationId, EventId, ActivationItem)
VALUES ('Objeto', 'Niko precisa de um item', 'Niko interage com Objeto e sente um frio na espinha', 6, 1, 1);

INSERT INTO PC(CharacterId, PcLocationId)
VALUES (0, 6);

INSERT INTO NPC (CharacterId, NpcName, NpcDescription, NpcLocationId, EventId)
VALUES (0, 'npc teste', 'npc teste',1, 1);

-- INSERT INTO Inventory (CharacterId, ItemId)
-- VALUES (1, 1);

-- INSERT INTO Inventory (CharacterId, ItemId)
-- VALUES (1, 2);

INSERT INTO DIALOGUE(DialogueText, CharacterId, NextDialogue, HaveChoice)
VALUES ('Se fuder niko', 2, NULL, FALSE);

INSERT INTO DIALOGUE(DialogueText, CharacterId, NextDialogue, HaveChoice)
VALUES ('Olá, eu sou o Niko', 1, 1, FALSE);


UPDATE Region SET Requirement = 4 WHERE RegionId = 2;