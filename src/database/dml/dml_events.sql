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