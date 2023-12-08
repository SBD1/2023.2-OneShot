INSERT INTO Phase (PhaseName, PhaseDescription)
VALUES ('Casa Estranha','Tuturial');

INSERT INTO Region (RegionName, RegionDescription, PhaseId)
VALUES ('Casa Estranha','Tuturial', 1);

INSERT INTO RegionGeo (North, South, East, West)
VALUES (NULL, NULL, NULL, NULL);

INSERT INTO Structure (StructureName,StructureDescription, RegionId)
VALUES ('Uma Casa Estranha', 'Uma Casa Estranha', 1);

INSERT INTO Room(RoomName, RoomDescription, StructureId)
VALUES ('Quarto', 'Niko vê um quarto sombrio em que a unica iluminação vem da janela.', 1);

INSERT INTO Location(RegionId, RoomId)
VALUES (1,1);

INSERT INTO PC(CharacterId, PcLocationId)
VALUES (0, 1);

INSERT INTO NPC(CharacterId, NpcName, NpcDescription, IsGod)
VALUES (0, '@user@', 'Deus', TRUE);

INSERT INTO NPC(CharacterId, NpcName, NpcDescription, IsWordMachine)
VALUES (0, '???', 'Entidade', TRUE);

INSERT INTO InteractEvent (EventId, Command)
VALUES (0, 'UPDATE Inventory SET ItemId=2 WHERE ItemId=1');


INSERT INTO ItemMaterial(ItemName, ItemDescription,ItemLocationId)
VALUES ('Controle da televisão', 'É muito difícil ler no escuro.', 1);

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, ObjectLocationId, EventId, ActivationItem)
VALUES ('Janela', 'Um feixe de luz suave atravessa a janela.', 'Niko enxerga com dificuldade o controle remoto, estão faltando todos os números exceto quatro os quais Niko retira e os guarda.', 1, 1, 1);

INSERT INTO ItemMaterial(ItemName, ItemDescription,ItemLocationId)
VALUES ('Botões do controle', 'niko retirou os botões que não estavam faltando do controle pararecem um tip de senha.', NULL);

INSERT INTO InteractEvent (EventId, Command)
VALUES (0, 'call dialoguecall(12);call raiseTexto(''Niko ouve o som do destrancar de uma porta.'');DELETE FROM Inventory WHERE ItemId=2;UPDATE Object SET Locks = FALSE WHERE ObjectId = 4 OR ObjectId = 3;UPDATE Object set ObjectLocationId= NULL WHERE ObjectId = 2;UPDATE Object set ObjectLocationId= 1 WHERE ObjectId = 5;');

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, ObjectLocationId, EventId, ActivationItem)
VALUES ('Computador', 'ACESSO NEGADO', 'Niko conseguiu acessar o computador', 1, 2, 2);

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, Locks )
VALUES ('Porta do banheiro', 'A porta do banheiro esta trancada.', '', TRUE);

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, Locks )
VALUES ('Porta da sala', 'A porta da sala esta trancada.', '', TRUE);


INSERT INTO Room(RoomName, RoomDescription, StructureId, BlockedBy)
VALUES ('Banheiro', 'Niko não vê muita coisa, o banheiro esta sem água e ao olhar para o espelho um par de olhos amarelos e brilhantes olham para Niko.', 1, 3);

INSERT INTO Location(RegionId, RoomId)
VALUES (1,2);

INSERT INTO Room(RoomName, RoomDescription, StructureId, BlockedBy)
VALUES ('Sala', 'Niko não vê muita coisa e o banheiro esta sem água.', 1, 4);

INSERT INTO Location(RegionId, RoomId)
VALUES (1,3);

INSERT INTO Connection (ConnectionName, Room1Id, Room2Id)
VALUES ('Porta do banheiro', 1, 2);

INSERT INTO Connection (ConnectionName, Room1Id, Room2Id)
VALUES ('Porta da sala', 1, 3);

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract)
VALUES ('Computador Desligado', 'O computador esta desligado.', '');

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, ObjectLocationId)
VALUES ('Espelho', 'Um par de olhos amarelos e brilhantes olham para Niko.', '', 2);

INSERT INTO InteractEvent (EventId, Command)
VALUES (0, 'Update Object set EventId = NULL where ObjectId = 7;INSERT INTO INVENTORY (CharacterId,ItemId) VALUES (1,3);'); 

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, ObjectLocationId, EventId)
VALUES ('Planta murcha', 'Uma planta murcha está aqui, dura e seca. Não há necessidade de fazer mais nada por ela.', 'Uma planta murcha está aqui, dura e seca. Um galho cai', 2, 3);

INSERT INTO ItemMaterial (ItemName, ItemDescription)
VALUES ('Galho seco', 'Um galho seco e escamoso da planta do banheiro.');

