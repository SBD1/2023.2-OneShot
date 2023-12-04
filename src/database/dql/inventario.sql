SELECT im.ItemName,
    im.ItemDescription,
    ie.ItemName,
    ie.ItemDescription
FROM Inventory iy 
LEFT JOIN ItemMaterial im ON iy.ItemId = im.ItemId
LEFT JOIN ItemEquipment ie ON iy.ItemId = ie.ItemId
WHERE iy.CharacterId = 1;