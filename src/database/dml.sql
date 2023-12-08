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

INSERT INTO ItemMaterial(ItemName, ItemDescription,ItemLocationId)
VALUES ('Controle da televisão', 'É muito difícil ler no escuro.', 1);

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, ObjectLocationId, EventId, ActivationItem)
VALUES ('Janela', 'Um feixe de luz suave atravessa a janela.', 'Niko enxerga com dificuldade o controle remoto, estão faltando todos os números exceto quatro os quais Niko retira e os guarda.', 1, 1, 1);

INSERT INTO ItemMaterial(ItemName, ItemDescription,ItemLocationId)
VALUES ('Botões do controle', 'niko retirou os botões que não estavam faltando do controle pararecem um tip de senha.', NULL);

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

INSERT INTO Room(RoomName, RoomDescription, StructureId, BlockedBy, eventId)
VALUES ('Sala', 'Niko não vê que a cozinha e a sala são conectadas.', 1, 4, 4);

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

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, ObjectLocationId, EventId)
VALUES ('Planta murcha', 'Uma planta murcha está aqui, dura e seca. Não há necessidade de fazer mais nada por ela.', 'Uma planta murcha está aqui, dura e seca. Um galho cai', 2, 3);

INSERT INTO ItemMaterial (ItemName, ItemDescription)
VALUES ('Galho seco', 'Um galho seco e escamoso da planta do banheiro.');

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, ObjectLocationId, EventId)
VALUES ('Refrigerador', 'O refrigerador está vazio.', 'Dentro do refrigerador há um frasco de álcool, Niko o pega.', 3, 5);

INSERT INTO ItemMaterial (ItemName, ItemDescription)
VALUES ('Frasco de álcool', 'O cheiro do líquido é repugnante.');

INSERT INTO ItemMaterial (ItemName, ItemDescription)
VALUES ('Galho molhado', 'A ponta do galho está molhada de álcool.');

INSERT INTO ItemMaterial (ItemName, ItemDescription)
VALUES ('Frasco vazio', 'O cheiro do álcool permanece.');

INSERT INTO ItemMaterial (ItemName, ItemDescription)
VALUES ('Tocha', 'Não provê muita luz.');

INSERT INTO Combination (Material1Id, Material2Id, Result1Id, Result2Id)
VALUES (3, 4, 5, 6);

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, ObjectLocationId, EventId,ActivationItem)
VALUES ('TV', 'A TV solta uma faísca que parece ser perigosa.', 'Niko prepara o galho...', 3, 6, 5);

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, ObjectLocationId, EventId,ActivationItem)
VALUES ('Lareira', 'Parece que nunca usaram a madeira da lareira. Talvez dê para acender.', 'Niko acendeu a Lareira com a tocha', 3, 7, 7);

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract)
VALUES ('Lareira Acesa', 'As chamas são fracas, mas confortantes.', '');

INSERT INTO ItemMaterial (ItemName, ItemDescription)
VALUES ('Chave do porão', 'Parece antiga.');



-- INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, ObjectLocationId, EventId)
-- VALUES ('TV', 'A TV solta uma faísca que parece ser perigosa.', '', 3, );
