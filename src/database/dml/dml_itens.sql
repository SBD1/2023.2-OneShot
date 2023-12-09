
INSERT INTO ItemMaterial(ItemName, ItemDescription,ItemLocationId)
VALUES ('Controle da televisão', 'É muito difícil ler no escuro.', 1);

INSERT INTO ItemMaterial(ItemName, ItemDescription,ItemLocationId)
VALUES ('Botões do controle', 'niko retirou os botões que não estavam faltando do controle pararecem um tip de senha.', NULL);

INSERT INTO ItemMaterial (ItemName, ItemDescription)
VALUES ('Galho seco', 'Um galho seco e escamoso da planta do banheiro.');

INSERT INTO ItemMaterial (ItemName, ItemDescription)
VALUES ('Frasco de álcool', 'O cheiro do líquido é repugnante.');

INSERT INTO ItemMaterial (ItemName, ItemDescription)
VALUES ('Galho molhado', 'A ponta do galho está molhada de álcool.');

INSERT INTO ItemMaterial (ItemName, ItemDescription)
VALUES ('Frasco vazio', 'O cheiro do álcool permanece.');

INSERT INTO Combination (Material1Id, Material2Id, Result1Id, Result2Id)
VALUES (3, 4, 5, 6);

INSERT INTO ItemMaterial (ItemName, ItemDescription)
VALUES ('Tocha', 'Não provê muita luz.');

INSERT INTO ItemMaterial (ItemName, ItemDescription)
VALUES ('Chave do porão', 'Parece antiga.');

INSERT INTO ItemMaterial(ItemName,ItemDescription)
VALUES ('Lâmpada','Uma lâmpada grande. É o sol.');
