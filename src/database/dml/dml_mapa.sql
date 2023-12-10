INSERT INTO Phase (PhaseName, PhaseDescription)
VALUES ('Casa Estranha','Tuturial');

INSERT INTO Region (RegionName, RegionDescription, PhaseId)
VALUES ('Casa Estranha','Tuturial', 1);

INSERT INTO RegionGeo (North, South, East, West)
VALUES (NULL, NULL, NULL, NULL);

INSERT INTO Structure (StructureName,StructureDescription, RegionId)
VALUES ('Uma Casa Estranha', 'de uma Casa Estranha', 1);

INSERT INTO Room(RoomName, RoomDescription, StructureId)
VALUES ('Quarto', 'Niko vê um quarto sombrio em que a unica iluminação vem da janela.', 1);

INSERT INTO Location(RegionId, RoomId)
VALUES (1,1);

INSERT INTO Room(RoomName, RoomDescription, StructureId)
VALUES ('Banheiro', 'Niko não vê muita coisa, o banheiro esta sem água e ao olhar para o espelho um par de olhos amarelos e brilhantes olham para Niko.', 1);

INSERT INTO Location(RegionId, RoomId)
VALUES (1,2);

INSERT INTO Room(RoomName, RoomDescription, StructureId, eventId)
VALUES ('Sala', 'Niko não vê que a cozinha e a sala são conectadas.', 1, 4);

INSERT INTO Location(RegionId, RoomId)
VALUES (1,3);

INSERT INTO Connection (ConnectionName, Room1Id, Room2Id)
VALUES ('Porta do banheiro', 1, 2);

INSERT INTO Connection (ConnectionName, Room1Id, Room2Id)
VALUES ('Porta da sala', 1, 3);

INSERT INTO Room (RoomName,RoomDescription,StructureId,EventId)
VALUES ('Porão','Niko vê o porão da casa, parece antigo.',1,9);

INSERT INTO location(RegionId,RoomId)
VALUES (1,4);

INSERT INTO Connection (ConnectionName, Room1Id, Room2Id)
VALUES ('Porta do porão', 3, 4);

INSERT INTO Phase (PhaseName, PhaseDescription)
VALUES ('Terras Áridas','As Terras Áridas é o primeiro grande local em que Niko e o jogador chegam. É uma terra desolada cheia de múltiplos abismos, máquinas arruinadas e fábricas abandonadas. Muitos camarões de fósforo existem nesta área.');

INSERT INTO Region (RegionName, RegionDescription, PhaseId)
VALUES ('Entrada','Vejo o que sobrou de alguns robôs e um robô sem energia.', 2);

INSERT INTO RegionGeo (North, South, East, West)
VALUES (NULL, NULL, NULL, NULL);

INSERT INTO Region (RegionName, RegionDescription, PhaseId)
VALUES ('Posto Avançado','Vejo o que sobrou de alguns robôs e um trilho de trem saindo da fábrica.', 2);

INSERT INTO RegionGeo (North, South, East, West)
VALUES (NULL, NULL, NULL, 2);

INSERT INTO Region (RegionName, RegionDescription, PhaseId)
VALUES ('Penhasco','Vejo o que sobrou de algumas estruturas e um abismo entre os penhascos, é bom ter cuidado.', 2);

INSERT INTO RegionGeo (North, South, East, West)
VALUES (NULL, NULL, NULL, 3);

INSERT INTO Region (RegionName, RegionDescription, PhaseId)
VALUES ('Ponto de Observação','Vejo algo que parece como um memorial e uma cabine.', 2);

INSERT INTO RegionGeo (North, South, East, West)
VALUES (NULL, NULL, NULL, 4);

INSERT INTO Region (RegionName, RegionDescription, PhaseId)
VALUES ('Entrada da Mina','Não consigo ver nada de interessante, apenas a entrada da Mina.', 2);

INSERT INTO RegionGeo (North, South, East, West)
VALUES (NULL, NULL, NULL, 5);

INSERT INTO Region (RegionName, RegionDescription, PhaseId, WhyisBlocked)
VALUES ('Fábrica Velha','Vejo varias saidas de gás bem altas e muitas caldeiras da fábrica antiga.', 2, 'O ar aqui é irrespirável' );

INSERT INTO RegionGeo (North, South, East, West)
VALUES (NULL, 4, NULL, NULL);

INSERT INTO Region (RegionName, RegionDescription, PhaseId)
VALUES ('Dormitórios','Vejo varios robos e um robô bem grande, parece uma espécie de segurança.', 2);

INSERT INTO RegionGeo (North, South, East, West)
VALUES (NULL, NULL, 7, NULL);

INSERT INTO Region (RegionName, RegionDescription, PhaseId, WhyisBlocked)
VALUES ('Pântano dos Camarões','Vejo varias poças de água e elas estão cheias de camarões-luminescentes.', 2, 'tem algo no ar aqui... Dói respirar...');

INSERT INTO RegionGeo (North, South, East, West)
VALUES (NULL, NULL, 8, NULL);

INSERT INTO Region (RegionName, RegionDescription, PhaseId)
VALUES ('Docas','Vejo algumas docas mas apenas uma esta ocupada.', 2);

INSERT INTO RegionGeo (North, South, East, West)
VALUES (9, 2, NULL, NULL);

INSERT INTO Structure (StructureName,StructureDescription, RegionId)
VALUES ('Servidor abandonado','do servidor abandonado', 2);

INSERT INTO Room(RoomName, RoomDescription, StructureId, eventId)
VALUES ('Sala de terminais', 'Vejo o que sobrou de alguns computadores.', 2, 11);

INSERT INTO Structure (StructureName,StructureDescription, RegionId)
VALUES ('Posto Avançado','do posto avançado', 3);

INSERT INTO Room(RoomName, RoomDescription, StructureId)
VALUES ('Interior', 'Vejo algumas estantes e anotações dos robôs que passaram por ali.', 3);

INSERT INTO Room(RoomName, RoomDescription, StructureId)
VALUES ('sala dos fundos', 'Vejo algumas estantes e uma espécie de Gerador', 3);

INSERT INTO Connection (ConnectionName, Room1Id, Room2Id)
VALUES ('Porta dos fundos', 6, 7);

INSERT INTO Structure (StructureName,StructureDescription, RegionId)
VALUES ('Fábrica','da fábrica', 3);

INSERT INTO Room(RoomName, RoomDescription, StructureId)
VALUES ('1º andar', 'Vejo algumas esteiras, algumas prensas hidráulicas desligadas e robôs quebrados.', 4);

INSERT INTO Room(RoomName, RoomDescription, StructureId)
VALUES ('2º andar', 'Vejo algumas esteiras, algumas prensas hidráulicas desligades e restos de robôs.', 4);

INSERT INTO Connection (ConnectionName, Room1Id, Room2Id)
VALUES ('Escada', 8, 9);

INSERT INTO Structure (StructureName,StructureDescription, RegionId)
VALUES ('Cabine de Observação','da cabine de observação', 5);

INSERT INTO Room(RoomName, RoomDescription, StructureId, eventId)
VALUES ('Interior', 'Vejo algumas estantes,uma cama e um tabuleiro de xadres, acho que a Silver mora aqui.', 5, 22);

INSERT INTO Structure (StructureName,StructureDescription, RegionId)
VALUES ('Mina','da Mina', 6);

INSERT INTO Room(RoomName, RoomDescription, StructureId)
VALUES ('Interior', 'Vejo alguns trilhos, mas não sei para onde levam, a mina parece perigosa.', 6);

INSERT INTO Structure (StructureName,StructureDescription, RegionId)
VALUES ('Antiga Fábrica','da antiga fábrica', 7);

INSERT INTO Room(RoomName, RoomDescription, StructureId)
VALUES ('1º andar', 'Vejo algumas esteiras bem antigas e umas caixas de metal.', 7);

INSERT INTO Room(RoomName, RoomDescription, StructureId)
VALUES ('2º andar', 'Vejo varios robôs desligados e mais esteiras.', 7);

INSERT INTO Connection (ConnectionName, Room1Id, Room2Id)
VALUES ('Escada', 12, 13);

INSERT INTO Structure (StructureName,StructureDescription, RegionId)
VALUES ('Dormitório Principal','do dormitório principal', 8);

INSERT INTO Room(RoomName, RoomDescription, StructureId)
VALUES ('Interior', 'Vejo algumas notas de robôs e as cabines de cada robô.', 8);

INSERT INTO Structure (StructureName,StructureDescription, RegionId)
VALUES ('Dormitório Zero','do dormitório zero', 8);

INSERT INTO Room(RoomName, RoomDescription, StructureId)
VALUES ('Interior', 'Vejo algumas notas de robôs, as cabines de cada robô e o que sobrou de um robô.', 9);

INSERT INTO Structure (StructureName,StructureDescription, RegionId)
VALUES ('Enfermaria dos dormitórios','da enfermaria do dormitórios', 8);

INSERT INTO Room(RoomName, RoomDescription, StructureId)
VALUES ('Interior', 'Vejo um kit de primeiro socorros e parece que ta bem movimentada a enfermaria.', 10);

INSERT INTO Structure (StructureName,StructureDescription, RegionId)
VALUES ('Dormitório Nove','do dormitório nove', 8);

INSERT INTO Room(RoomName, RoomDescription, StructureId)
VALUES ('Interior', 'Vejo algumas notas de robôs, as cabines de cada robô e uma celula de energia.', 11);

INSERT INTO Structure (StructureName,StructureDescription, RegionId)
VALUES ('Dormitório Três','do dormitório três', 8);

INSERT INTO Room(RoomName, RoomDescription, StructureId)
VALUES ('Interior', 'Vejo algumas notas de robôs e as cabines de cada robô.', 12);

INSERT INTO Structure (StructureName,StructureDescription, RegionId)
VALUES ('Dormitório Oito','do dormitório oito', 8);

INSERT INTO Room(RoomName, RoomDescription, StructureId)
VALUES ('Interior', 'Vejo algumas notas de robôs, as cabines de cada robô e um robô dentro de uma delas.', 13);

INSERT INTO Structure (StructureName,StructureDescription, RegionId)
VALUES ('Servidor dos dormitórios','do servidor dos dormitórios', 8);

INSERT INTO Room(RoomName, RoomDescription, StructureId)
VALUES ('Sala de terminais', 'Vejo o que sobrou de alguns computadores.', 14);

INSERT INTO Structure (StructureName,StructureDescription, RegionId)
VALUES ('Servidor das docas','do servidor das docas', 10);

INSERT INTO Room(RoomName, RoomDescription, StructureId)
VALUES ('Sala de terminais', 'Vejo o que sobrou de alguns computadores.', 15);

INSERT INTO Location(RegionId)
VALUES (2);

INSERT INTO Location(RegionId, RoomId)
VALUES (2,5);

INSERT INTO Location(RegionId)
VALUES (3);

INSERT INTO Location(RegionId, RoomId)
VALUES (3,6);

INSERT INTO Location(RegionId, RoomId)
VALUES (3,7);

INSERT INTO Location(RegionId, RoomId)
VALUES (3,8);

INSERT INTO Location(RegionId, RoomId)
VALUES (3,9);

INSERT INTO Location(RegionId)
VALUES (4);

INSERT INTO Location(RegionId)
VALUES (5);

INSERT INTO Location(RegionId, RoomId)
VALUES (5,10);

INSERT INTO Location(RegionId)
VALUES (6);

INSERT INTO Location(RegionId, RoomId)
VALUES (6,11);

INSERT INTO Location(RegionId)
VALUES (7);

INSERT INTO Location(RegionId, RoomId)
VALUES (7,12);

INSERT INTO Location(RegionId, RoomId)
VALUES (7,13);

INSERT INTO Location(RegionId)
VALUES (8);

INSERT INTO Location(RegionId, RoomId)
VALUES (8,14);

INSERT INTO Location(RegionId, RoomId)
VALUES (8,15);

INSERT INTO Location(RegionId, RoomId)
VALUES (8,16);

INSERT INTO Location(RegionId, RoomId)
VALUES (8,17);

INSERT INTO Location(RegionId, RoomId)
VALUES (8,18);

INSERT INTO Location(RegionId, RoomId)
VALUES (8,19);

INSERT INTO Location(RegionId, RoomId)
VALUES (8,20);

INSERT INTO Location(RegionId)
VALUES (9);

INSERT INTO Location(RegionId)
VALUES (10);

INSERT INTO Location(RegionId, RoomId)
VALUES (10,21);