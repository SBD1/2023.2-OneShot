SELECT im.ItemName,
    im.ItemDescription,
    ie.ItemName,
    ie.ItemDescription
FROM Inventory iy 
LEFT JOIN ItensMaterial im ON iy.ItemId = im.ItemId
LEFT JOIN ItensEquipment ie ON iy.ItemId = ie.ItemId
WHERE iy.CharacterId = 1;