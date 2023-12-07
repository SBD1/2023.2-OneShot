SELECT ConnectionName
FROM Connection
WHERE Room1Id = (SELECT RoomId FROM Location WHERE LocationId = (SELECT PcLocationId FROM PC WHERE CharacterId = 1))
OR Room2Id = (SELECT RoomId FROM Location WHERE LocationId = (SELECT PcLocationId FROM PC WHERE CharacterId = 1))