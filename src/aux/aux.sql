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

-----------------------------------------------
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
VALUES ('[???]', 4, 129);

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

--------------------------------------------
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
---------------------------------------------

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
----------sim


INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Sendo Assim, Desejo-lhe uma Boa Viagem.]', 4, NULL);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('Tudo bem, valeu.', 1, 147);
----------nao


INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue, HaveChoice)
VALUES ('[Gostaria de Fazer Mais Alguma Pergunta?]', 4, NULL, TRUE);

INSERT INTO DialogueChoice(DialogueId, Choice, NextDialogue)
VALUES ( 149,'Não', 148);

INSERT INTO DialogueChoice(DialogueId, Choice, NextDialogue)
VALUES ( 149,'SIM', 146);

INSERT INTO Dialogue(DialogueText, CharacterId, NextDialogue)
VALUES ('[Olá Novamente.]', 4, 149);