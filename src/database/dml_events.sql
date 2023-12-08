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

INSERT INTO RoomEvent (EventId, Command)
VALUES (0, 'UPDATE Inventory set ItemId=7 Where ItemId=5;UPDATE Object set EventId = NULL where ObjectId = 9;');

INSERT INTO InteractEvent (EventId, Command)
VALUES (0, 'DELETE FROM Inventory WHERE ItemId=7;UPDATE Object SET ObjectLocationId = NULL Where ObjectId = 10;INSERT INTO INVENTORY (CharacterId,ItemId) VALUES (1,8);CALL raiseTexto(''Algo no chão brilha com a luz do fogo.'');CALL raiseTexto(''Parece ser um objeto metálico pequeno, preso em uma rachadura no chão.'');CALL raiseTexto(''Niko o desenterra.'');UPDATE Object SET ObjectLocationId = 3 Where ObjectId = 11;');