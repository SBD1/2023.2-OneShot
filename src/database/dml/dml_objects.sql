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
