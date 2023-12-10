
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