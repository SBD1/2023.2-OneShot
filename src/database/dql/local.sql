SELECT 
    CASE 
        WHEN l.RoomId IS NOT NULL THEN s.StructureDescription
        ELSE r.RegionName
    END,
    CASE
        WHEN l.RoomId IS NOT NULL THEN ro.RoomName
        ELSE NULL
    END,
    CASE
        WHEN l.RoomId IS NULL THEN ARRAY_AGG(DISTINCT e.StructureName)
        ELSE NULL
    END,
    ARRAY_AGG(DISTINCT o.ObjectName) AS objetos,
    ARRAY_AGG(DISTINCT im.ItemName) AS item_material,
    ARRAY_AGG(DISTINCT ie.ItemName) AS item_equipamento,
    ARRAY_AGG(DISTINCT npc.NpcName) AS NPC_Name
FROM Location l
LEFT JOIN Region r ON l.RegionId = r.RegionId
LEFT JOIN Room ro ON l.RoomId = ro.RoomId
LEFT JOIN Structure s ON ro.StructureId = s.StructureId
LEFT JOIN Structure e ON r.RegionId = e.RegionId
LEFT JOIN Object o ON l.LocationId = o.ObjectLocationId
LEFT JOIN ItemMaterial im ON l.LocationId = im.ItemLocationId
LEFT JOIN ItemEquipment ie ON l.LocationId = ie.ItemLocationId
LEFT JOIN NPC npc ON l.LocationId = npc.NpcLocationId
WHERE l.LocationId = (SELECT PcLocationId FROM PC WHERE CharacterId = 1)
GROUP BY l.RoomId, s.StructureDescription, r.RegionName, ro.RoomName