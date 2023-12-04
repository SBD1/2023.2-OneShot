SELECT 
    CASE 
        WHEN l.RoomId IS NOT NULL THEN s.StructureName
        ELSE r.RegionName
    END,
    CASE
        WHEN l.RoomId IS NULL THEN ARRAY_AGG(DISTINCT e.StructureName)
        ELSE NULL
    END,
    ARRAY_AGG(DISTINCT o.ObjectName) AS objetos,
    ARRAY_AGG(DISTINCT i.ItemName) AS Item
FROM Location l
LEFT JOIN Region r ON l.RegionId = r.RegionId
LEFT JOIN Structure s ON l.RoomId = s.StructureId
LEFT JOIN Structure e ON r.RegionId = e.RegionId
LEFT JOIN Object o ON l.LocationId = o.ObjectLocationId
LEFT JOIN ItemMaterial i ON l.LocationId = i.ItemLocationId
WHERE l.LocationId = (SELECT PcLocationId FROM PC WHERE CharacterId = 1)
GROUP BY l.RoomId, s.StructureName, r.RegionName