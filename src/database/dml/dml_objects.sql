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

------------------------------------------------------------------------------------------------

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

