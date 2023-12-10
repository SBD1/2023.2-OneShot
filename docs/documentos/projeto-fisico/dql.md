<center>

# <a>Data Query Language (DQL)</a>
</center>

## <a>Introdução</a>
DQL é a sigla para **<a>Data Query Language</a>**. É uma linguagem de consulta de dados que permite aos usuários recuperar dados de um banco de dados. O DQL é usado para consultar os dados armazenados em um banco de dados, como recuperar informações específicas de uma tabela ou visualização. O DQL é uma parte importante do projeto físico do banco de dados, pois permite recuperar os dados armazenados no banco de dados.

## <a>Consultas</a>
O meu projeto realiza diversas consultas o tempo todo como demonstrar a seguir, porem as principais seriam:

**<a>Descrição do local</a>**

```sql
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
```

**<a>Lista de conexões</a>**

```sql
SELECT ConnectionName
FROM Connection
WHERE Room1Id = (SELECT RoomId FROM Location WHERE LocationId = (SELECT PcLocationId FROM PC WHERE CharacterId = 1))
OR Room2Id = (SELECT RoomId FROM Location WHERE LocationId = (SELECT PcLocationId FROM PC WHERE CharacterId = 1))
```

**<a>Abrir inventario</a>**

```sql
SELECT im.ItemName,
    im.ItemDescription,
    ie.ItemName,
    ie.ItemDescription
FROM Inventory iy 
LEFT JOIN ItemMaterial im ON iy.ItemId = im.ItemId
LEFT JOIN ItemEquipment ie ON iy.ItemId = ie.ItemId
WHERE iy.CharacterId = 1;
```

**<a>Lista de regiões visitadas</a>**

```sql
SELECT Region.RegionName
FROM VisitedRegion
INNER JOIN Region ON VisitedRegion.RegionId = Region.RegionId
WHERE VisitedRegion.CharacterId = 1;
```

<details>
<summary><strong>Outras Consultas</strong></summary>

```sql
SELECT PcLocationId INTO localizacao_atual_id FROM PC WHERE CharacterId = 1;
SELECT 1 FROM Location WHERE RegionId = nova_regiao_id
SELECT Requirement, WhyisBlocked INTO equipamento_id, motivo FROM Region WHERE RegionId = nova_regiao_id;
SELECT ItemName into nome_equipamento FROM ItemEquipment WHERE ItemId = equipamento_id;
SELECT LocationId FROM Location WHERE RegionId = nova_regiao_id LIMIT 1
SELECT PcLocationId INTO localizacao_pc FROM PC WHERE CharacterId = 1;
SELECT RegionId INTO regiao_estrutura FROM Structure WHERE LOWER(StructureName) = nome_estrutura;
SELECT LocationId INTO localizacao_estrutura FROM Location WHERE RegionId = regiao_estrutura;
SELECT InitialRoom INTO salainicial_id FROM Structure WHERE LOWER(StructureName) = nome_estrutura;
SELECT BlockedBy INTO id_objeto FROM Room WHERE RoomId = salainicial_id;
SELECT LocationId FROM Location WHERE RoomId = salainicial_id
SELECT Locks FROM Object WHERE ObjectId = id_objeto
SELECT LocationId FROM Location WHERE RoomId = salainicial_id
SELECT ObjectDescription FROM Object WHERE ObjectId = id_objeto
SELECT RegionId INTO regiao_idn FROM Location WHERE LocationId = (SELECT PcLocationId FROM PC WHERE CharacterId = 1);
SELECT LocationId INTO new_location FROM Location WHERE RegionId = regiao_idn AND RoomId IS NULL;
SELECT RegionId INTO regiao_idn FROM Location WHERE LocationId = (SELECT PcLocationId FROM PC WHERE CharacterId = 1);
SELECT LocationId INTO new_location FROM Location WHERE RegionId = regiao_idn AND RoomId IS NULL;
SELECT PcLocationId INTO localizacao_pc FROM PC WHERE CharacterId = 1;
SELECT ItemLocationId, ItemId INTO localizacao_itemM, itemM_id FROM ItemMaterial WHERE LOWER(ItemName) = nome_item;
SELECT ItemLocationId, ItemId INTO localizacao_itemE, itemE_id FROM ItemEquipment WHERE LOWER(ItemName) = nome_item;
SELECT Inventory.ItemId INTO item1_id FROM Inventory JOIN ItemMaterial ON Inventory.ItemId = ItemMaterial.ItemId WHERE CharacterId = 1 AND LOWER(ItemMaterial.ItemName) = LOWER(nome_item1);
SELECT Inventory.ItemId INTO item2_id FROM Inventory JOIN ItemMaterial ON Inventory.ItemId = ItemMaterial.ItemId WHERE CharacterId = 1 AND LOWER(ItemMaterial.ItemName) = LOWER(nome_item2);
SELECT Result1Id, Result2Id, equipmentId INTO resultado_id1, resultado_id2, equipamento_id FROM Combination WHERE (Material1Id = item1_id AND Material2Id = item2_id) OR (Material1Id = item2_id AND Material2Id = item1_id);
SELECT ItemName INTO nome_equipamento FROM ItemEquipment WHERE ItemId = equipamento_id;
SELECT 1 FROM Inventory WHERE CharacterId = 1 AND ItemId = equipamento_id
SELECT ItemName INTO nome_item_resultado1 FROM ItemMaterial WHERE ItemId = resultado_id1;
SELECT ItemName INTO nome_item_resultado2 FROM ItemMaterial WHERE ItemId = resultado_id2;
SELECT EventType INTO evento_tipo FROM Event E WHERE E.EventId = event_id;
SELECT Command INTO efeito FROM ChatEvent E WHERE E.EventId = event_id;
SELECT Command INTO efeito FROM InteractEvent E WHERE E.EventId = event_id;
SELECT Command INTO efeito FROM RoomEvent E WHERE E.EventId = event_id;
SELECT npc.npcName, npc.npclocationid, npc.CharacterId, EventId INTO nome_npc, localizacao_npc, npc_id, evento_id FROM npc WHERE LOWER(npcname) = substring(funcao from 15);
SELECT pc.PcLocationId INTO localizacao_pc FROM pc WHERE pc.CharacterId = 1;
SELECT pc.PcLocationId INTO localizacao_pc FROM pc WHERE pc.CharacterId = 1;
SELECT O.ObjectId, O.objectlocationid, O.ActivationItem, O.DescriptionOnInteract, O.ObjectDescription, O.EventId INTO objeto_id, localizacao_objeto, item_objeto, Descricao_on_interact, Descricao, objeto_evento FROM object O WHERE LOWER(objectname) = objeto_nome;
SELECT O.ObjectId, O.objectlocationid, O.ActivationItem, O.DescriptionOnInteract, O.ObjectDescription, O.EventId INTO objeto_id, localizacao_objeto, item_objeto, Descricao_on_interact, Descricao, objeto_evento FROM object O WHERE LOWER(objectname) = objeto_nome;
SELECT I.itemid INTO Item_Id FROM ItemMaterial I WHERE LOWER(I.ItemName) = item_nome;
SELECT 1 FROM Inventory WHERE CharacterId = 1 AND ItemId = Item_Id
SELECT PcLocationId INTO localizacao_pc FROM PC WHERE CharacterId = 1;
SELECT RegionId INTO regiao_id FROM Region WHERE LOWER(RegionName) = nome_regiao;
SELECT LocationId INTO regiao_local FROM Location WHERE RegionId = regiao_id AND RoomId IS NULL;
SELECT 1 FROM VisitedRegion WHERE RegionId = regiao_id AND CharacterId = 1
SELECT LocationId FROM Location WHERE RegionId = regiao_id AND RoomId IS NULL
SELECT PcLocationId into localizacao_pc FROM PC WHERE CharacterId = 1;
SELECT RoomId into quarto_pc FROM Location WHERE LocationId = localizacao_pc;
SELECT Room2Id into quarto_alvo FROM Connection WHERE LOWER(ConnectionName) = nome_conexao AND Room1Id = quarto_pc ;
SELECT Room1Id into quarto_alvo FROM Connection WHERE LOWER(ConnectionName) = nome_conexao AND Room2Id = quarto_pc ;  
SELECT BlockedBy INTO id_objeto FROM Room WHERE RoomId = quarto_alvo;
SELECT LocationId FROM Location WHERE RoomId = quarto_alvo
SELECT ObjectDescription FROM Object WHERE ObjectId = id_objeto
SELECT PcLocationId INTO pc_location FROM PC WHERE CharacterId = 1;
SELECT RegionID, RoomId INTO region_id, room_id FROM Location WHERE LocationId = pc_location;
SELECT RegionDescription INTO descricao FROM Region WHERE RegionId = region_id;
SELECT RoomDescription INTO descricao FROM Room WHERE RoomId = room_id;
SELECT InitialRoom FROM Structure WHERE StructureId = NEW.StructureId
SELECT 1 FROM Character C WHERE C.CharacterId = NEW.CharacterId
SELECT 1 FROM Character C WHERE C.CharacterId = NEW.CharacterId
SELECT 1 FROM Item I WHERE I.ItemId = NEW.ItemId
SELECT 1 FROM Event E WHERE E.EventId = NEW.EventId
SELECT RoomId INTO Idquarto FROM location WHERE locationId = NEW.PcLocationId;
SELECT EventId INTO Idevento FROM Room WHERE RoomId = Idquarto;
SELECT 1 FROM Location WHERE LocationId = NEW.PcLocationId
SELECT RegionId, RoomId INTO idRegiao, idroom FROM Location WHERE LocationId = NEW.PcLocationId;
SELECT IsVisited FROM Region WHERE RegionId = idRegiao
```

</details>




## <a>Histórico de Versão</a>
<center>

|   Data   | Versão |        Descrição         |                   Autor                    |
| :------: | :----: | :----------------------: | :----------------------------------------: |
| 25/11/23 |  1.0   |   Criação do documento   | [João Lucas](https://github.com/HacKairos) |
| 10/12/23 |  2.0   | Atualização do documento | [João Lucas](https://github.com/HacKairos) |

</center>

## <a>Bilbiografia</a>
    AVI SILBERSCHATZ, HENRY F. KORTH, S. SUDARSHAN. Database System Concepts. [s.l: s.n.].