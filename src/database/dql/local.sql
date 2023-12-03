SELECT 
    CASE 
        WHEN l.Room IS NOT NULL THEN s.StructureDescription
        ELSE r.RegionDescription
    END,
    CASE
        WHEN l.Room IS NULL THEN ARRAY_AGG(DISTINCT e.StructureDescription)
        ELSE NULL
    END,
    ARRAY_AGG(DISTINCT o.ObjectDescription) AS objetos,
    ARRAY_AGG(DISTINCT i.ItemDescription) AS itens
FROM Locations l
LEFT JOIN Regions r ON l.Region = r.RegionId
LEFT JOIN Structures s ON l.Room = s.StructureId
LEFT JOIN Structures e ON r.RegionId = e.Region
LEFT JOIN Objects o ON l.LocationId = o.ObjectLocation
LEFT JOIN ItensMaterial i ON l.LocationId = i.ItemLocation
WHERE l.LocationId = (SELECT PcLocation FROM PCs WHERE CharacterId = 1)
GROUP BY l.Room, s.StructureDescription, r.RegionDescription