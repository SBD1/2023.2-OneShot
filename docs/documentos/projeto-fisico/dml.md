<center>

# <a>Data Manipulation Language (DML)</a>
</center>

## <a>Introdução</a>
DML é a sigla para **<a>Data Manipulation Language</a>**. É uma linguagem de manipulação de dados que permite aos usuários inserir, atualizar e excluir dados em um banco de dados. 

O DML é usado para manipular os dados armazenados em um banco de dados, como adicionar novos registros, atualizar informações existentes ou excluir registros. O DML é uma parte importante do projeto físico do banco de dados, pois permite manipular os dados armazenados no banco de dados.

## <a>Dados</a>
A inserção de dados foi divida em 6 arquivos diferentes que estarão sendo representados a seguir:

<details>
<summary><strong><a>DML de Eventos</a></strong></summary>

```sql
INSERT INTO InteractEvent (EventId, Command)
VALUES (0, 'UPDATE Inventory SET ItemId=2 WHERE ItemId=1');

INSERT INTO InteractEvent (EventId, Command)
VALUES (0, 'CALL dialoguecall(12);CALL raiseTexto(''Niko ouve o som do destrancar de uma porta.'');DELETE FROM Inventory WHERE ItemId=2;UPDATE Object SET Locks = FALSE WHERE ObjectId = 4 OR ObjectId = 3;UPDATE Object set ObjectLocationId= NULL WHERE ObjectId = 2;UPDATE Object set ObjectLocationId= 1 WHERE ObjectId = 5;');

INSERT INTO InteractEvent (EventId, Command)
VALUES (0, 'UPDATE Object set EventId = NULL where ObjectId = 7;INSERT INTO INVENTORY (CharacterId,ItemId) VALUES (1,3);'); 

INSERT INTO RoomEvent (EventId, Command)
VALUES (0, 'CALL dialoguecall(13);UPDATE Room set EventId = NULL WHERE RoomId = 3;');

INSERT INTO InteractEvent (EventId, Command)
VALUES (0, 'UPDATE Object set EventId = NULL where ObjectId = 8;INSERT INTO INVENTORY (CharacterId,ItemId) VALUES (1,4);'); 

INSERT INTO InteractEvent (EventId, Command)
VALUES (0, 'UPDATE Inventory set ItemId=7 Where ItemId=5;UPDATE Object set EventId = NULL where ObjectId = 9;');

INSERT INTO InteractEvent (EventId, Command)
VALUES (0, 'DELETE FROM Inventory WHERE ItemId=7;UPDATE Object SET ObjectLocationId = NULL Where ObjectId = 10;INSERT INTO INVENTORY (CharacterId,ItemId) VALUES (1,8);CALL raiseTexto(''Algo no chão brilha com a luz do fogo.'');CALL raiseTexto(''Parece ser um objeto metálico pequeno, preso em uma rachadura no chão.'');CALL raiseTexto(''Niko o desenterra.'');UPDATE Object SET ObjectLocationId = 3 Where ObjectId = 11;');

INSERT INTO InteractEvent (EventId, Command)
VALUES (0, 'UPDATE Object set ObjectLocationId=NULL WHERE ObjectId= 12;DELETE FROM Inventory WHERE ItemId=8;Update Object set locks = FALSE  where ObjectId = 12;Update Object set EventId = NULL where ObjectId = 12;');

INSERT INTO RoomEvent (EventId, Command)
VALUES (0, 'INSERT INTO Inventory (CharacterId,ItemId) VALUES (1,9);CALL raiseTexto(''Ao abrir a porta do porão Niko se depara com a escada que leva até o porão'');CALL raiseTexto(''Niko desce as escadas e se depara com uma lâmpada apagada'');CALL raiseTexto(''Niko se aproxima da lâmpada e ao toca-la ...'');CALL raiseTexto(''A lâmpada se acende e tudo fica mais iluminado'');');

INSERT INTO InteractEvent (EventId,Command)
VALUES (0, 'CALL raiseTexto(''Niko perde a conciência após isso e acorda em um novo local com um robô ? encarando.'');UPDATE pc set PcLocationId = 6 WHERE CharacterId = 1;');

INSERT INTO RoomEvent (EventId, Command)
VALUES (0, 'CALL dialoguecall(108);UPDATE Room set EventId = NULL WHERE RoomId = 5;');

INSERT INTO ChatEvent (EventId, Command)
VALUES (0, 'CALL dialoguecall(150);');

INSERT INTO InteractEvent (EventId,Command)
VALUES (0, 'INSERT INTO Inventory (CharacterId,ItemId) VALUES (1,13);UPDATE Object SET ObjectLocationId = NULL Where ObjectId = 14;');

INSERT INTO InteractEvent (EventId,Command)
VALUES (0, 'UPDATE Object set ObjectLocationId = NULL Where ObjectId = 28;UPDATE Object set ObjectLocationId = 29 Where ObjectId = 29;DELETE FROM Inventory WHERE ItemId=15;UPDATE Object SET ObjectLocationId = NULL Where ObjectId = 16;UPDATE Object SET ObjectLocationId = 9 Where ObjectId = 17;UPDATE Region SET RegionDescription = ''Vejo o que sobrou de alguns robôs e alguns com sua energia reestabelecida'' WHERE RegionId = 2;UPDATE Region SET RegionDescription = ''Vejo o que sobrou de alguns robôs e alguns com sua energia reestabelecida'' WHERE RegionId = 3;UPDATE Object SET ObjectLocationId = 8 Where ObjectId = 18;UPDATE Object SET ObjectLocationId = NULL Where ObjectId = 15;');

INSERT INTO InteractEvent (EventId,Command)
VALUES (0, 'UPDATE Object SET ObjectLocationId = NULL Where ObjectId = 18;UPDATE Object SET ObjectLocationId = 8 Where ObjectId = 15;CALL dialoguecall(208);');

INSERT INTO InteractEvent (EventId,Command)
VALUES (0, 'UPDATE Inventory SET ItemId = 19 WHERE ItemId = 20;UPDATE Object SET ObjectLocationId = NULL Where ObjectId = 19;UPDATE Object SET ObjectLocationId = 11 Where ObjectId = 20;');

INSERT INTO InteractEvent (EventId,Command)
VALUES (0, 'UPDATE Inventory SET ItemId = 26 WHERE ItemId = 28;INSERT INTO INVENTORY (CharacterId,ItemId) VALUES (1,25); UPDATE Object SET ObjectLocationId = NULL Where ObjectId = 21;UPDATE Object SET ObjectLocationId = 11 Where ObjectId = 22;');

INSERT INTO InteractEvent (EventId,Command)
VALUES (0, 'UPDATE Object SET ObjectLocationId = NULL Where ObjectId = 24;UPDATE Object SET Locks = FALSE Where ObjectId = 24;');

INSERT INTO InteractEvent (EventId,Command)
VALUES (0, 'UPDATE Object SET ObjectLocationId = NULL Where ObjectId = 25;INSERT INTO Inventory (CharacterId, ItemId) VALUES (1,22);');

INSERT INTO InteractEvent (EventId,Command)
VALUES (0, 'UPDATE Inventory set ItemId = 23 WHERE ItemId = 22;UPDATE Object SET ObjectLocationId = NULL Where ObjectId = 26;');

INSERT INTO InteractEvent (EventId,Command)
VALUES (0, 'UPDATE Inventory set ItemId = 16 WHERE ItemId = 6;;UPDATE Object SET ObjectLocationId = NULL Where ObjectId = 27;');

INSERT INTO RoomEvent (EventId, Command)
VALUES (0, 'CALL dialoguecall(181);UPDATE Room set EventId = NULL WHERE RoomId = 10;UPDATE Object SET ObjectLocationId = 15 Where ObjectId = 23;UPDATE Object SET ObjectLocationId = 15 Where ObjectId = 23;UPDATE Object SET EventId = 25 Where ObjectId = 23;');

INSERT INTO ChatEvent (EventId, Command)
VALUES (0, 'CALL dialoguecall(191);UPDATE NPC SET EventId = 24 WHERE CharacterId = 5;');

INSERT INTO ChatEvent (EventId, Command)
VALUES (0, 'CALL dialoguecall(193);');

INSERT INTO InteractEvent (EventId,Command)
VALUES (0, 'CALL dialoguecall(198); UPDATE Object SET ObjectLocationId = NULL Where ObjectId = 23; UPDATE Object SET Locks = FALSE Where ObjectId = 23; UPDATE Pc SET PcLocationId = 16 WHERE CharacterId = 1;');

INSERT INTO InteractEvent (EventId,Command)
VALUES (0, 'CALL dialoguecall(221);UPDATE Object SET ObjectLocationId = NULL Where ObjectId = 29;UPDATE Object SET ObjectLocationId = 29 Where ObjectId = 30;');

INSERT INTO InteractEvent (EventId,Command)
VALUES (0, 'CALL dialoguecall(241);UPDATE Object SET ObjectLocationId = NULL Where ObjectId = 30;UPDATE NPC SET EventId =29 WHERE CharacterId = 5;UPDATE NPC SET EventId = 28 WHERE CharacterId = 6;UPDATE NPC SET NpcLocationId = 29 WHERE CharacterId = 6;');

INSERT INTO ChatEvent (EventId, Command)
VALUES (0, 'CALL dialoguecall(243);');

INSERT INTO ChatEvent (EventId, Command)
VALUES (0, 'CALL dialoguecall(268);INSERT INTO INVENTORY (CharacterId,ItemId) VALUES (1,24);UPDATE NPC SET EventId =30 WHERE CharacterId = 5;UPDATE NPC SET EventId =32 WHERE CharacterId = 6;');

INSERT INTO ChatEvent (EventId, Command)
VALUES (0, 'CALL dialoguecall(319);UPDATE NPC SET EventId =31 WHERE CharacterId = 5;');

INSERT INTO ChatEvent (EventId, Command)
VALUES (0, 'CALL dialoguecall(321);');

INSERT INTO ChatEvent (EventId, Command)
VALUES (0, 'CALL dialoguecall(331); CALL fimdojogo();');
```

</details>

<details>
<summary><strong><a>DML de Mapa</a></strong></summary>

```sql
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
```

</details>

<details>
<summary><strong><a>DML de Personagens</a></strong></summary>

```sql
INSERT INTO PC(CharacterId, PcLocationId)
VALUES (0, 1);

INSERT INTO NPC(CharacterId, NpcName, NpcDescription, IsGod)
VALUES (0, '@user@', 'Deus', TRUE);

INSERT INTO NPC(CharacterId, NpcName, NpcDescription, IsWordMachine)
VALUES (0, '???', 'Entidade', TRUE);

INSERT INTO NPC(CharacterId, NpcName, NpcDescription, NpcLocationId, EventId)
VALUES (0, 'Robô profeta', 'O Robô profeta é um robô simpático e amigável que vive nos arredores do mundo, esperando pelo messias.',7, 12);

INSERT INTO NPC(CharacterId, NpcName, NpcDescription, NpcLocationId, EventId)
VALUES (0, 'Silver', 'A engenheira-chefe das Terras Áridas, uma robô um tanto melancólica que vive sozinha perto das minas.',14, 23);

INSERT INTO NPC(CharacterId, NpcName, NpcDescription, NpcLocationId)
VALUES (0, 'Remobô', 'Um pequeno robô preso a um barco a remo, enferrujado pela névoa do oceano.',NULL);
```

</details>

<details>
<summary><strong><a>DML de Itens</a></strong></summary>

```sql
INSERT INTO ItemMaterial(ItemName, ItemDescription,ItemLocationId)
VALUES ('Controle da televisão', 'É muito difícil ler no escuro.', 1);

INSERT INTO ItemMaterial(ItemName, ItemDescription)
VALUES ('Botões do controle', 'niko retirou os botões que não estavam faltando do controle pararecem um tipo de senha.');

INSERT INTO ItemMaterial (ItemName, ItemDescription)
VALUES ('Galho seco', 'Um galho seco e escamoso da planta do banheiro.');

INSERT INTO ItemMaterial (ItemName, ItemDescription)
VALUES ('Frasco de álcool', 'O cheiro do líquido é repugnante.');

INSERT INTO ItemMaterial (ItemName, ItemDescription)
VALUES ('Galho molhado', 'A ponta do galho está molhada de álcool.');

INSERT INTO ItemMaterial (ItemName, ItemDescription)
VALUES ('Frasco vazio', 'O cheiro do álcool permanece.');

INSERT INTO ItemMaterial (ItemName, ItemDescription)
VALUES ('Tocha', 'Não provê muita luz.');

INSERT INTO ItemMaterial (ItemName, ItemDescription)
VALUES ('Chave do porão', 'Parece antiga.');

INSERT INTO ItemMaterial(ItemName,ItemDescription)
VALUES ('Lâmpada','Uma lâmpada grande. É o sol.');

INSERT INTO ItemMaterial(ItemName,ItemDescription,ItemLocationId)
VALUES ('Câmera','Câmera quebrada com uma grande lente parafusada.', 16);

INSERT INTO ItemMaterial(ItemName,ItemDescription,ItemLocationId)
VALUES ('Chave de fenda','Chave Phillips',14);

INSERT INTO ItemMaterial(ItemName,ItemDescription)
VALUES ('Lente','Grande lente de vidro.');

INSERT INTO ItemMaterial(ItemName,ItemDescription)
VALUES ('Bateria quebrada','Pelo jeito, uma bateria. Tem vidro quebrado dentro dela.');

INSERT INTO ItemMaterial(ItemName,ItemDescription)
VALUES ('Bateria descarregada','Bateria recarregável intacta. Vazia no momento.');

INSERT INTO ItemMaterial(ItemName,ItemDescription)
VALUES ('Bateria carregada','Bateria recarregável funcionando com força total.');

INSERT INTO ItemMaterial(ItemName,ItemDescription)
VALUES ('Frasco de fumaça','Está cheio de fumaça tóxica.');

INSERT INTO ItemMaterial(ItemName,ItemDescription)
VALUES ('Frasco de ácido','Está cheio de ácido líquido espesso');

INSERT INTO ItemMaterial(ItemName,ItemDescription)
VALUES ('Esponja molhada','Esponja encharcada de solução de limpeza ácida.');

INSERT INTO ItemMaterial(ItemName,ItemDescription)
VALUES ('Pé de cabra','Pé de cabra improvisado feito de cano.');

INSERT INTO ItemMaterial(ItemName,ItemDescription,ItemLocationId)
VALUES ('Haste de metal','Surpreendentemente leve.', 30);

INSERT INTO ItemMaterial(ItemName,ItemDescription,ItemLocationId)
VALUES ('Esponja','Esponja chata com superfície áspera.', 19);

INSERT INTO ItemMaterial(ItemName,ItemDescription)
VALUES ('Seringa vazia','A agulha é especialmente grande.');

INSERT INTO ItemMaterial(ItemName,ItemDescription)
VALUES ('Seringa cheia','Está cheia do líquido estranho da lagoa.');

INSERT INTO ItemMaterial(ItemName,ItemDescription)
VALUES ('Âmbar','Um pedaço de âmbar reluzente com um trevo preto dentro.');

INSERT INTO ItemMaterial(ItemName,ItemDescription)
VALUES ('Diário estranho','Encontrado nas Terras Áridas. Está em uma língua desconhecida');

INSERT INTO ItemEquipment(ItemName,ItemDescription)
VALUES ('Máscara de gás','Uma máscara para filtrar o ar.');

INSERT INTO ItemEquipment(ItemName,ItemDescription,ItemLocationId)
VALUES ('Luvas de borracha','Luvas projetadas para impedir dano químico.', 18);

INSERT INTO ItemMaterial(ItemName,ItemDescription)
VALUES ('Senha', 'A senha do cofre encontrada por  @user@');

UPDATE Region set requirement = 26 WHERE RegionId = 7 OR RegionId = 9;

INSERT INTO Combination (Material1Id, Material2Id, Result1Id, Result2Id)
VALUES (3, 4, 5, 6);

INSERT INTO Combination (Material1Id, Material2Id, Result1Id)
VALUES (10, 11, 12);

INSERT INTO Combination (Material1Id, Material2Id, Result1Id)
VALUES (12, 13, 14);

INSERT INTO Combination (Material1Id, Material2Id, Result1Id, Result2Id)
VALUES (9, 14, 15, 9);

INSERT INTO Combination (Material1Id, Material2Id, Result1Id)
VALUES (16, 23, 17);

INSERT INTO Combination (Material1Id, Material2Id, Result1Id,equipmentId)
VALUES (21, 17, 18, 27);
```

</details>

<details>
<summary><strong><a>DML de Objetos</a></strong></summary>

```sql
INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, ObjectLocationId, EventId, ActivationItem)
VALUES ('Janela', 'Um feixe de luz suave atravessa a janela.', 'Niko enxerga com dificuldade o controle remoto, estão faltando todos os números exceto quatro os quais Niko retira e os guarda.', 1, 1, 1);

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, ObjectLocationId, EventId, ActivationItem)
VALUES ('Computador', 'ACESSO NEGADO', 'Niko conseguiu acessar o computador', 1, 2, 2);

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, Locks )
VALUES ('Porta do banheiro', 'A porta do banheiro esta trancada.', '', TRUE);

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, Locks )
VALUES ('Porta da sala', 'A porta da sala esta trancada.', '', TRUE);

UPDATE Room SET BlockedBy = 3 WHERE RoomId = 2;

UPDATE Room SET BlockedBy = 4 WHERE RoomId = 3;

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract)
VALUES ('Computador Desligado', 'O computador esta desligado.', '');

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, ObjectLocationId)
VALUES ('Espelho', 'Um par de olhos amarelos e brilhantes olham para Niko.', '', 2);

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, ObjectLocationId, EventId)
VALUES ('Planta murcha', 'Uma planta murcha está aqui, dura e seca. Não há necessidade de fazer mais nada por ela.', 'Uma planta murcha está aqui, dura e seca. Um galho cai', 2, 3);

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, ObjectLocationId, EventId)
VALUES ('Refrigerador', 'O refrigerador está vazio.', 'Dentro do refrigerador há um frasco de álcool, Niko o pega.', 3, 5);

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, ObjectLocationId, EventId,ActivationItem)
VALUES ('TV', 'A TV solta uma faísca que parece ser perigosa.', 'Niko prepara o galho...', 3, 6, 5);

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, ObjectLocationId, EventId,ActivationItem)
VALUES ('Lareira', 'Parece que nunca usaram a madeira da lareira. Talvez dê para acender.', 'Niko acendeu a Lareira com a tocha', 3, 7, 7);

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract)
VALUES ('Lareira Acesa', 'As chamas são fracas, mas confortantes.', '');

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, ObjectLocationId, EventId,ActivationItem, locks)
VALUES ('Fechadura do porão', 'A porta do porão esta trancada', 'Niko destrancou a porta do porão', 3, 8, 8, TRUE);

UPDATE Room SET BlockedBy = 12 WHERE RoomId = 4;

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, ObjectLocationId, EventId,ActivationItem)
VALUES ('Moldura','Uma moldura antiga no formato de lampada ?','A lâmpada encaixa perfeitamente na moldura', 3, 10, 9);

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, ObjectLocationId, EventId,ActivationItem)
VALUES ('Caixa','Essa caixa parece interessante! Gostaria de ter alguma coisa para abri-la...','Há um cubo pequeno de metal e um vidro quebrado aqui... Parece ser alguma peça de máquina. Está escrito “Bateria solar” na lateral."', 8, 13, 19);

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, ObjectLocationId)
VALUES ('Computador Desligado', 'O computador esta desligado.', '', 8);

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, ObjectLocationId, EventId, ActivationItem)
VALUES ('Gerador','Nossa! que máquina grande! Mas parece que não faz nada... Tem um buraco retangular no meio. Parece que há algo que se encaixa aqui.','Tomara que a bateria carregada faça alguma coisa... Nossa!',9,14,15);

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract)
VALUES ('Gerador ligado','Nossa esse gerador é capaz de alimentar toda a região.','Tomara que a bateria dure o suficiente!');

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, EventId)
VALUES ('Computador ligado','','Niko interage com o computador',15);

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, ObjectLocationId, EventId,ActivationItem)
VALUES ('Prensa Hidraulica','Ai, a máquina ainda está ligada! Melhor não ficarmos tão perto dela... E se meu cachecol se prender nela? Ela vai me puxar e... não vou nem terminar de falar.', 'Ah... você quer que eu esmague o cano aqui, @user@. Ah, mas não quero chegar muito perto... Que assustador...',11,16, 20);

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract)
VALUES ('Prensa Hidraulica', 'Espero não termos que usar de novo, @user@...', '');

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, ObjectLocationId, EventId,ActivationItem)
VALUES ('Cofre', 'Um cofre de metal. Parece que precisa de uma senha para abrir.','Caramba funcionou, Ah uma parece que tem uma mascara de gás e também tem... este livro esquisito!, não consigo lê-lo' ,12, 17, 28);

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract)
VALUES ('Cofre vazio', 'Vazio', '');

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, Locks )
VALUES ('Corda na entrada', 'Tem uma corda na entrada... Há uma placa:
somente pessoas autorizadas! Visitantes devem procurar a engenheira-chefe para ter permissão para entrar na mina.', '', TRUE);

UPDATE Room SET BlockedBy = 23 WHERE RoomId = 11;

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, ObjectLocationId, EventId,ActivationItem, Locks)
VALUES ('Barricada', 'A porta está bloqueada por várias tábuas... Mas parece que elas estão soltas! Talvez consiga arrancá-las com uma ferramenta adequada...', 'Que bom que guardei o pé de cabra! Isso que chamo de malhação...', 18, 18, 19, TRUE);

UPDATE Room SET BlockedBy = 24 WHERE RoomId = 13;

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, ObjectLocationId, EventId)
VALUES ('Kit de primeiros socorros', 'Um kit de primeiros socorros.', 'Um kit de primeiros socorros tem uma seringa dentro dele', 23, 19);

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, ObjectLocationId, EventId,ActivationItem)
VALUES ('Poça especial','Essa lagoa parece ser diferente... A água parece... gelatina? Uma bolha surgiu na superfície da lagoa.','Então... temos que encher a seringa, @user@?Acho que é tipo um funil...
Mas acho que o líquido é muito grosso para passar na agulha... Ei, não é que entrou?! Eca.', 28,20,22);

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, ObjectLocationId, EventId,ActivationItem)
VALUES ('Saida de gas pequena', 'Há uma ventilação no chão! Todos os outros estão muito alto.','Você quer que eu encha a garrafa com esse gás, @user@? Isso deve servir.', 28, 21, 6);

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, ObjectLocationId)
VALUES ('Robo desligado', '...','',29);

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, EventId)
VALUES ('Robo', 'Aguente firme...','Ola ?' ,26);

INSERT INTO Object (ObjectName, ObjectDescription , DescriptionOnInteract, EventId, ActivationItem)
VALUES ('Remobô', 'Aguente firme...','...' ,27, 18);
```

</details>


<details>
<summary><strong><a>DML de Dialogos</a></strong></summary>

```sql
INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Você só tem uma chance, @user@', 3 , NULL);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('E o mais importante...', 3 , 1);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Sua “missão” é ajudar Niko a ir embora.', 3 , 2);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Suas ações aqui afetarão Niko.', 3 , 3);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Então lembre-se disso:', 3 , 4);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('... Ainda quer tentar?', 3 , 5);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Este lugar nunca mereceu a salvação.', 3 , 6);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Isso ficará evidente quando você for lá fora.', 3 , 7);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Mas já é tarde demais.Não resta muito do mundo.', 3 , 8);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('.... Por quê?', 3 , 9);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Você me encontrou.', 3 , 10);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('...', 3 , 11);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Olááá? . . .  alguém', 1 , NULL);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Ooo...', 1, NULL);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Deve Haver um Mapa Aqui neste Posto Avançado...]', 4 ,14);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[À Medida em que For Indo para o Centro, Você Passará pelas Outras Regiões.]', 4 ,15);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Ah, então é isso aquela construção alta...', 1, 16);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Aquela Torre que Você Vê Lá Longe Já Guardou o Sol.]', 4 ,17);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Você Está na Margem, nas Terras Áridas.]', 4 ,18);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[O Mundo se Divide em Três Regiões.]', 4 ,19);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Mas o Tempo Não Espera Ninguém, Nem os Salvadores.]', 4 ,20);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Nem Tão Avariado.]', 4 ,21);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Nosso Mundo Nem Sempre Foi Tão Escuro.]', 4 ,22);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Não consigo ver muito além, está tão escuro...', 1, 23);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Não sei exatamente onde estou...', 1, 24);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Ah...', 1, NULL);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Se o Sol se Quebrar, O Mundo Acabará num Instante.]', 4 ,26);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[O Sol é Muito Frágil, Portanto Tenha Cuidado.]', 4 ,27);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Sim, Então Comece a sua Peregrinação.]', 4 ,28);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Ela parece muito... longe!', 1, 29);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Você Precisa Levá-lo à Torre.]', 4 ,30);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Mas Agora que Você Está Aqui com o Novo Sol, Está Tudo Bem.]', 4 ,31);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Ah...', 1, 32);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Quando a Última Luz Morrer, Nosso Mundo Também Morrerá.]', 4 ,33);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Agora É Nossa Única Fonte de Luz, Mas Sua Energia é Finita.]', 4 ,34);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Felizmente, para Nós, Este Elemento Guardou a Energia da Luz do Antigo Sol.]', 4 ,35);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[A Superfície Deste Mundo é Abundante em um Elemento Chamado Luminescência.]', 4 ,36);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[O Mundo Ainda Está por um Fio.]', 4 ,37);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Mas um Dia a Luz Apagou.]', 4 ,38);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Anos Atrás, Nosso Antigo Sol Ficava no Alto Daquela Torre e Espalhava sua Vida na Terra.]', 4 ,39);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Sim!]', 4 ,40);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Seu... sol?', 1, 41);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Em Suas Mãos Está Nosso Novo Sol.]', 4 ,42);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Eu a encontrei na casa onde eu acordei...', 1, 43);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Ah...', 1, NULL);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Desculpe.]', 4 ,45);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Não Consigo Ajudar Você Além da Minha Programação.]', 4 ,46);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Assim Como a Minha Missão É Contar Tudo Sobre Nosso Mundo a Você.]', 4 ,47);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Sua Missão É Salvar Nosso Mundo.]', 4 ,48);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[...]', 4 ,49);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Eu só queria ir para casa...', 1, 50);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Agora parece que estou num pesadelo...', 1, 51);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Eu estava com minha mãe algumas horas atrás...', 1, 52);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Eu ainda nem sei como vim parar aqui!', 1, 53);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Eu... não tenho certeza...', 1, 54);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Desculpe a grosseria, mas eu...', 1, 55);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Ah...', 1, 56);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Não Hesite em Pedir Ajuda a @user@... Afinal, Você É o Messias.]', 4 ,NULL);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Isso é incrível...', 1, 58);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Eu ouvi alguém! Na realidade seu nome é @user@...', 1, 59);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Meu nome é Niko...', 1, 60);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('P- ... Prazer conhecer você, @user@!', 1, 61);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Ah!', 1, 62);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('(Sim, estou aqui.)', 2, 63);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('... @user@ ? Você está... aí?', 1, 64);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Alô?', 1, 65);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('certo ...', 1, 66);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Feche os Olhos e Concentre-se.]', 4 ,67);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[... Uma Habilidade que Ninguém Mais Possui, Muito Menos Eu.]', 4 ,68);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[O Portador do Nosso Sol Tem a Habilidade Secreta de se Comunicar Diretamente com @user@.]', 4 ,69);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Acho que não.', 1, 70);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Você Ainda... Não Falou Com @user@]', 4 ,71);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Mas não vi mais ninguém...', 1, 72);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('É mesmo?', 1, 73);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Na Realidade, Já Está Sendo Seu Guia.]', 4 ,74);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[@user@ Será Seu Guia Nesta Jornada.]', 4 ,75);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Se Você Está Aqui, Isso Significa que @user@ Também Está.]', 4 ,76);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('... @user@', 1, 77);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Eu Chutaria que Estão Tentando Enviar uma Mensagem para @user@.]', 4 ,78);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Hm...]', 4 ,79);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Será que essas mensagens eram para outra pessoa?', 1, 80);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Mas... Eu sou Niko!', 1, 81);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Ele falou coisas do tipo “Suas ações aqui afetarão Niko.”', 1, 82);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Encontrei um... computador naquela casa.', 1, 83);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Excelente, se tiver mais alguma duvida estarei a leste no Posto Avançado  ... Boa Sorte.]', 4 ,NULL);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Acho que por enquanto é tudo que queria perguntar.', 1, 85);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue, HaveChoice, AllChoices)
VALUES ('Pode me falar sobre...', 1, 86, TRUE, TRUE);

INSERT INTO DialogueChoice(DialogueId, Choice, NextDialogue)
VALUES (87, '... este mundo?', 25);

INSERT INTO DialogueChoice(DialogueId, Choice, NextDialogue)
VALUES (87, '... a lâmpada?', 44);

INSERT INTO DialogueChoice(DialogueId, Choice, NextDialogue)
VALUES (87, '... voltar para casa?', 57);

INSERT INTO DialogueChoice(DialogueId, Choice, NextDialogue)
VALUES (87, '... o computador?', 84);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Ahm, bom...', 1, 87);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Pode me Perguntar Qualquer Coisa!]', 4 ,88);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Agora Eu lhe Fornecerei Informações Essenciais!]', 4 ,89);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('...hm.', 1, 90);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Você Salvará o Nosso Mundo da Escuridão Eterna.]', 4 ,91);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Você É o Messias que Estávamos Esperando!]', 4 ,92);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Exatamente Como Disse Minha Profecia! Isso!]', 4 ,93);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Ah!... Quer Dizer que Você Acordou em um Local Escuro e Desconhecido?]', 4 ,94);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Acordei em uma... casa esquisita. Estava tudo muito escuro!', 1, 95);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Não sei ao certo...', 1, 96);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Primeiramente, Poderia me Dizer Como Chegou Aqui?]', 4 ,97);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Ah, Certo!... Permita-me Explicar Algumas Coisas.]', 4 ,98);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Perdoe-me... Estou meio perdido...', 1, 99);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('...', 1, 100);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Ahm, valeu...', 1, 101);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[É uma Grande Honra Estar em Sua Presença.. Sim!]', 4 ,102);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Boas-vindas ao Nosso Mundo, amigo!]', 4 ,103);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Sim!]', 4 ,104);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('E- ... eu?', 1, 105);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[A Lâmpada...! Você Chegou!]', 4 ,106);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Ah!]', 4 , 107);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Entendo...', 1, NULL);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Não Houve Tempo.]', 4, 109);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Não... evoluiu?', 1, 110);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Não Posso Desejar Companhia...  Ainda Não Evoluí.]', 4, 111);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Você tem algum amigo, pelo menos? Amigos...robôs?', 1, 112);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Quer dizer... que você só fica parado aqui? Deve ser chato...', 1, 113);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('... não ... projetaram?', 1, 114);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Não me Projetaram para Vaguear.]', 4, 115);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Não Sei Informar.]', 4, 116);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('... além de robôs, digo.', 1, 117);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('... existe... ALGUÉM morando nesta região?', 1, 118);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[É Por Isso que Esse Lugar se Chama “Terras Áridas”.]', 4, 119);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Aqui é tão... vazio...', 4, 120);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('entendo ...', 1, NULL);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Afinal, Eu Sou um Robô.]', 4, 122);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Ah. Minha Programação É o que me Guia.]', 4, 123);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('... Sua...  o quê?', 1, 124);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Só Significa que Isso Está Gravado em Minha Programação.]', 4, 125);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Mas você disse “minha profecia”...', 1, 126);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Ó, Céus, Não!]', 4, 127);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Calma aí...  O profeta é VOCÊ, né?', 1, 128);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[? ? ?]', 4, 129);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('O que mais você viu na profecia?', 1, 130);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Como Assim?]', 4, 131);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('O que mais você... ahm, previu?', 1, 132);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('ah...', 1, 133);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[O Messias Acordará em uma Casa Estranha, Encontrará o Sol e Iluminará o Mundo.]',4, 134);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[O Profeta Previu que um Messias Chegará de Outras Terras.]',4, 135);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Então... O que exatamente é essa profecia?',1, 136);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Ahm... Entendo.', 1, NULL);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[@user@ Saberá o que Fazer Quando Chegar a Hora.]', 4, 138);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Mas... Como faço para chegar lá em cima?', 1, 139);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Não Tenho Permissão para Responder Isso.]', 4, 140);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Nem consigo ver o topo dela...', 1, 141);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Essa torre é muito alta?', 1, 142);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue, HaveChoice)
VALUES ('Pode me falar sobre...', 1, NULL, TRUE);

INSERT INTO DialogueChoice(DialogueId, Choice, NextDialogue)
VALUES (144, '... as Terras Áridas', 121);

INSERT INTO DialogueChoice(DialogueId, Choice, NextDialogue)
VALUES (144, '... a profecia', 137);

INSERT INTO DialogueChoice(DialogueId, Choice, NextDialogue)
VALUES (144, '... a torre', 143);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Prossiga, Pode Perguntar.]', 4, 144);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('isso!', 1, 145);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Sendo Assim, Desejo-lhe uma Boa Viagem.]', 4, NULL);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Tudo bem, valeu.', 1, 147);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue, HaveChoice)
VALUES ('[Gostaria de Fazer Mais Alguma Pergunta?]', 4, NULL, TRUE);

INSERT INTO DialogueChoice(DialogueId, Choice, NextDialogue)
VALUES ( 149,'SIM', 146);

INSERT INTO DialogueChoice(DialogueId, Choice, NextDialogue)
VALUES ( 149,'Não', 148);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Olá Novamente.]', 4, 149);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[No entanto, não conte com isso.]', 5 , NULL);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Ah!', 1 , 151);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Talvez ela mande você de volta para casa quando concluir sua missão.]', 5 , 152);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[E quanto mais alto, mais forte ela é.]', 5 , 153);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Sabemos que a Torre tem um poder que ninguém compreende.]', 5 , 154);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Sim, no topo dela.]', 5 , 155);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('É onde preciso colocar a lâmp... ahm... o sol, não é?', 1 , 156);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Então você deve ir em direção à Torre.]', 5 , 157);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Ah, então você acabou de chegar aqui?]', 5 , 158);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('E não podemos apenas desistir...', 1 , 159);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Nós... não vimos muita coisa, na verdade...', 1 , 160);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Você viu como isso é ruim, não é?]', 5 , 161);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Essa decadência... duvido que o sol vá revertê-la.]', 5 , 162);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[O mundo está acabando há muito tempo.]', 5 , 163);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Para ser sincera, acho que você deveria apenas... deixar o mundo morrer naturalmente.]', 5 , 164);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Isso vai soar meio frio, mas...]', 5 , 165);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[... ah.]', 5 , 166);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Eu sei.]', 5 , 167);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Mas aquele robô tem certeza disso...', 1 , 168);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Uma criança como você ser o nosso Messias... não parece certo.]', 5 , 169);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Bem, enfim...]', 5 , 170);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Mas os gatos andam em quatro patas!', 1 , 171);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Você tem olhos de gato...]', 5 , 172);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Eu sou uma pessoa!', 1 , 173);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('N-não!', 1 , 174);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[É isso que você é, certo? Uma espécie de gato?]', 5 , 175);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Ou, pelo menos, alguém que não pareça um gatinho.]', 5 , 176);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Eu esperava alguém... mais alto.]', 5 , 177);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('É o que me disseram.', 1 , 178);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Então, você é o “messias”?]', 5 , 179);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[A lâmpada...]', 5 , 180);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Ele nunca me disse nada sobre isso.]', 5 , NULL );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('É?', 1 , 182 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[...]', 5 , 183 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Eu já conheci alguém que a quis estudar, mas...]', 5 , 184 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Pelo que sei, ela está lá desde o início dos tempos.]', 5 , 185 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Construiu?]', 5 , 186 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Então... quem a construiu?', 1 , 187 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Bem, é o que se sabe.]', 5 , 188 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Não sei. Ninguém nunca entrou nela.]', 5 , 189 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('O que há dentro da Torre?', 1 , 190 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Não, tudo bem, valeu!', 1, NULL);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Precisa de mais alguma ajuda?]', 5 , 192);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Ah, que bom!', 1 , NULL );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Se precisa entrar, é meu dever acompanhar você.]', 5 , 194 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Essas minas estão abandonadas há muito tempo, não posso garantir sua segurança.]', 5 , 195 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Eu vi você vindo para cá.]', 5 , 196 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Espere!]', 5 , 197 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Agora, encontre-o.', 3 , NULL);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Eu consegui salvá-lo porque sei que Niko precisa dele para continuar sua missão.', 3 , 199);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Mas esse código, esse DOCUMENTO, é uma exceção.', 3 , 200);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('... na maioria das vezes, peças dispersas desse mundo se perdem por aí.', 3 , 201);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Você... ainda não entende o quanto esse mundo está deteriorado, não é, @user@?', 3 , 202);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Você entende o que quero dizer, @user@', 3 , 203);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Bem, o código não se encontra NESSE mundo.', 3 , 204);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Acredito que precise de um código para destrancar uma caixa.', 3 , 205);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Mas esse avanço termina aqui.', 3 , 206);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Vejo que está progredindo nesse mundo, @user@.', 3 , 207);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Aguente firme... @user@ e eu vamos encontrar uma forma de ajudar você!', 1 , NULL );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[É VERDADE.]', 6 , 209 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Bom, você ainda está bem enferrujado...', 1 , 210 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[NÃO CONSIGO ME MEXER.]', 6 , 211 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Você... está bem?', 1 , 212 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[...]', 6 , 213 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[QUER QUE EU LEVE VOCÊ A ALGUM LUGAR?]', 6 , 214 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[EU SOU O REMOBÔ Nº 310.]', 6 , 215 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[OLÁ. PRAZER CONHECER VOCÊ.]', 6 , 216 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Mas sim!', 1 , 217 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Bom, @user@ me ajudou!', 1 , 218 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[FOI VOCÊ QUE CONSERTOU O GERADOR?]', 6 , 219 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[ESTOU FUNCIONANDO!]', 6 , 220 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[ELA SABERÁ O QUE FAZER.]', 6 , NULL );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[EM CASO DE FALHA, É NECESSÁRIO FALAR COM A ENGENHEIRA-CHEFE.]', 6 , 222 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Posso ajudar de alguma maneira?', 1 , 223 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[REPITO: NÃO POSSO EXECUTAR MINHA PROGRAMAÇÃO]', 6 , 224 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[NADA BOM MESMO.]', 6 , 225 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Puxa... Não me parece nada bom.', 1 , 226 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[MEUS CIRCUITOS DE NAVEGAÇÃO SOFRERAM PANE.]', 6 , 227 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[O VALE, PORTO NÚMERO - ]', 6 , 228 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[O DESTINO MAIS PRÓXIMO À TORRE É...]', 6 , 229 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[CALCULANDO...]', 6 , 230 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Pode me levar até a Torre?', 1 , 231 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[AONDE DESEJA IR?]', 6 , 232 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[AGORA POSSO CUMPRIR MINHA MISSÃO NOVAMENTE.]', 6 , 233 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[OBRIGADO!]', 6 , 234 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[... CONSIGO ME MEXER NOVAMENTE.]', 6 , 235 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[... EU...]', 6 , 236 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('E aí?', 1 , 237 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Pronto!', 1 , 238 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[NÃO TENHO OUTRA OPÇÃO.]', 6 , 239 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Certo... paradinho...', 1 , 240 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[PODERIA ATÉ LHE INFORMAR AS COORDENADAS, MAS...]', 6 , NULL );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[ELA MORA PERTO DA ENTRADA DA MINA.]', 6 , 242 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[JÁ CONVERSOU COM A ENGENHEIRA-CHEFE?]', 6 , 243 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Ah, valeu!', 1 , NULL );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Pegue.]', 5 , 245 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Você precisa terminar sua missão mais do que preciso de uma recordação.]', 5 , 246 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Deixe para lá.]', 5 , 247 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Minha programação diz que sim, mas ainda há um conflito dentro de mim.]', 5 , 248 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Ah... Eu não sei se consigo falar sobre isso.]', 5 , 249 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('?', 1 , 250 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[É também...]', 5 , 251 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[O trevo preto? É uma planta comum em nosso mundo.]', 5 , 252 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('O que há dentro do âmbar?', 1 , 253 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Âmbar encontrado no Vale.]', 5 , 254 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Do que é feito?', 1 , 255 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('É um colar muito bonito!', 1 , 256 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Se você deixar o remobô usar isso, o sistema de rastreamento reserva deverá ativar-se.]', 5 , 257 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Os remobôs têm a habilidade de encontrar materiais de seus locais de origem.]', 5 , 258 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Tenho algo que possa ajudar.]', 5 , 259 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Hm...]', 5 , 260 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Parece que sim! @user@ e eu consertamos todo o resto...', 1 , 261 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Só os circuitos de navegação?]', 5 , 262 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Ele falou alguma coisa sobre os circuitos de navegação estragados.', 1 , 263 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Certo. Qual é o problema?]', 5 , 264 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('... mas ele está com alguns problemas e pediu para eu falar com você.', 1 , 265 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Encontrei um robô que pode me levar até a Torre!', 1 , 266 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Com licença de novo, senhorita...', 1 , 267 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Ah, você também!', 1 , NULL );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Espero que chegue em casa com segurança.]', 5 , 269 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[... Obrigada por me ouvir.]', 5 , 270 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Certo, acho que já segurei você por muito tempo...]', 5 , 271 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Xeque-mate.]', 5 , 272 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Mas...', 1 , 273 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Não há garantias de que funcionará.]', 5 , 274 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Assim como supostamente as Terras Áridas foram apenas uma segunda chance para mim.]', 5 , 275 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[De certa forma, supostamente você é só uma segunda chance para o povo.]', 5 , 276 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[A única coisa que você pode fazer é concluir sua peregrinação.]', 5 , 277 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Quando foi que sua rainha chegou aí...?', 1 , 278 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('O-o quê?!', 1 , 279 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Xeque.]', 5 , 280 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Então... não há nada que eu possa fazer?', 1 , 281 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[A morte repentina do sol foi apenas a gota d’água para tudo piorar de vez.]', 5 , 282 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[A decadência começou antes de o sol desaparecer.]', 5 , 283 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Provavelmente, o sol não salvará o mundo.]', 5 , 284 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Eu já disse isso, não?]', 5 , 285 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Não.]', 5 , 286 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Porque o sol se foi...?', 1 , 287 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[O mundo pode estar muito diferente agora.]', 5 , 288 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[... só não sei se tudo isso continua do mesmo jeito.]', 5 , 289 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Eu ainda tenho os dados, as coordenadas, as lembranças...]', 5 , 290 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[No passado, sim.]', 5 , 291 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Ah! Você já esteve em alguma outra região? Ouvi dizer que há mais duas.', 1 , 292 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Cavalo.]', 5 , 293 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('... lá se vai meu cavalinho...', 1 , 294 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Não sei exatamente aonde.]', 5 , 295 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Todos os outros robôs evoluídos foram levados para outras regiões.]', 5 , 296 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Mas eu sou um deles.]', 5 , 297 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Eu não sei explicar direito o que são os robôs evoluídos.]', 5 , 298 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('... lá se vai meu outro bispo...', 1 , 299 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Como assim, exatamente?', 1 , 300 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Evoluir...  é complicado.]', 5 , 301 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('... lá se vai o meu bispo...', 1 , 302 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Cuidado.]', 5 , 303 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[A maioria dos robôs não são evoluídos.]', 5 , 304 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Às vezes, é difícil entender.', 1 , 305 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('E agora você!', 1 , 306 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Eu conversei com outros robôs e todos eles falaram sobre programação, código, essas coisas...', 1 , 307 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Então... Como é isso? Ser um robô e tal...', 1 , 308 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Obrigada. Está no meu código.]', 5 , 309 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Você tem talento!', 1 , 310 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Mas é o mínimo que eu possa fazer!', 1 , 311 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Digo, eu não sei muito bem as regras...', 1 , 312 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Então, joga uma partida comigo?]', 5 , 313 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Eu já joguei com crianças mais velhas!', 1 , 314 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Sim! É... mais ou menos...', 1 , 315 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Você...  sabe jogar xadrez?]', 5 , 316 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Na verdade...]', 5 , 317 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Antes de partir... Posso ajudar de alguma maneira?', 1 , 318 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Não há nenhum motivo para você ficar nas Terras Áridas.]', 5 , NULL);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Pode sair...]', 5 , 320);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[CAPACIDADE DENTRO DOS CONFORMES. SEGUINDO VIAGEM.]', 6 , NULL );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Ah. Bom... Acho que não vou precisar mais do pé de cabra... Nem dessa máscara de gás, nem das luvas...', 1 , 322 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[VOCÊ PRECISARÁ DEIXAR ALGO PARA TRÁS.]', 6 , 323 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[AGUARDE. CAPACIDADE DO BARCO EXCEDIDA.]', 6 , 324 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[CONFIGURANDO TRAJETO...]', 6 , 325 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[ATIVANDO SISTEMA DE RASTREAMENTO...]', 6 , 326 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[AGORA ME LEMBRO!]', 6 , 327 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[É UM ÂMBAR DO VALE.]', 6 , 328 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[AH!]', 6 , 329 );

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[...]', 6 , 330 );
```

</details>



## <a>Histórico de Versão</a>
<center>

|   Data   | Versão |        Descrição         |                   Autor                    |
| :------: | :----: | :----------------------: | :----------------------------------------: |
| 25/11/23 |  1.0   |   Criação do documento   | [João Lucas](https://github.com/HacKairos) |
| 10/12/23 |  2.0   | Atualização do documento | [João Lucas](https://github.com/HacKairos) |

</center>

## <a>Bilbiografia</a>
    AVI SILBERSCHATZ, HENRY F. KORTH, S. SUDARSHAN. Database System Concepts. [s.l: s.n.].