INSERT INTO Phase (PhaseName, PhaseDescription)
VALUES ('Casa Estranha','Tuturial');

INSERT INTO Region (RegionName, RegionDescription, PhaseId)
VALUES ('Casa Estranha','Tuturial', 1)

INSERT INTO RegionGeo (North, South, East, West)
VALUES (NULL, NULL, NULL, NULL);

INSERT INTO Structure (StructureName,StructureDescription, RegionId)
VALUES ('Casa Estranha', 'Casa', 1);

INSERT INTO Room(RoomName, RoomDescription, StructureId)
VALUES ('Quarto', 'Quarto sombrio em que a unica iluminação vem da janela', 1);