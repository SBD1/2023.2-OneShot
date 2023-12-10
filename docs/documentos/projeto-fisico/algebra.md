<center>

# <a>Álgebra Relacional (DDL)</a>
</center>

## <a>Introdução</a>
A **<a>Álgebra Relacional</a>** é uma linguagem de consulta formal, porém procedimental, ou seja, o usuário dá as instruções ao sistema para que o mesmo realize uma sequência de operações na base de dados para calcular o resultado desejado. Ela define operadores para atuar nas tabelas e é utilizada para realizar manipulações de dados no modelo relacional. A Álgebra Relacional é um conjunto de operações que utilizam como recurso de entrada uma ou mais relações, produzindo então, uma nova relação. 

A Álgebra Relacional é uma parte importante do projeto físico do banco de dados, pois permite definir a estrutura do banco de dados, incluindo a definição de tabelas, colunas, restrições, índices, etc. Alguns dos operadores da Álgebra Relacional incluem união, interseção, diferença, produto, seleção, projeção e junção. Cada operador tem uma função específica e uma representação na construção de consultas. 

## <a>Consultas</a>
O meu projeto realiza diversas consultas o tempo todo como demonstrar a seguir, porem as principais seriam:

**<a>Descrição do local</a>**

```txt
π CASE WHEN l.RoomId IS NOT NULL THEN s.StructureDescription ELSE r.RegionName END, CASE WHEN l.RoomId IS NOT NULL THEN ro.RoomName ELSE NULL END, CASE WHEN l.RoomId IS NULL THEN ARRAY_AGG(DISTINCT e.StructureName) ELSE NULL END, ARRAY_AGG(DISTINCT o.ObjectName), ARRAY_AGG(DISTINCT im.ItemName), ARRAY_AGG(DISTINCT ie.ItemName), ARRAY_AGG(DISTINCT npc.NpcName)
(σ l.LocationId = (SELECT PcLocationId FROM PC WHERE CharacterId = 1)
((Location l ⨝ l.RegionId = r.RegionId Region r) ⨝ l.RoomId = ro.RoomId Room ro ⨝ ro.StructureId = s.StructureId Structure s ⨝ r.RegionId = e.RegionId Structure e ⨝ l.LocationId = o.ObjectLocationId Object o ⨝ l.LocationId = im.ItemLocationId ItemMaterial im ⨝ l.LocationId = ie.ItemLocationId ItemEquipment ie ⨝ l.LocationId = npc.NpcLocationId NPC npc))
```

**<a>Lista de conexões</a>**

```txt
π ConnectionName
(σ Room1Id = (SELECT RoomId FROM Location WHERE LocationId = (SELECT PcLocationId FROM PC WHERE CharacterId = 1)) OR Room2Id = (SELECT RoomId FROM Location WHERE LocationId = (SELECT PcLocationId FROM PC WHERE CharacterId = 1)) Connection)
```

**<a>Abrir inventario</a>**

```txt
π im.ItemName, im.ItemDescription, ie.ItemName, ie.ItemDescription
(σ iy.CharacterId = 1 (Inventory iy ⨝ iy.ItemId = im.ItemId ItemMaterial im ⨝ iy.ItemId = ie.ItemId ItemEquipment ie))
```

**<a>Lista de regiões visitadas</a>**

```txt
π Region.RegionName
(σ VisitedRegion.CharacterId = 1 (VisitedRegion ⨝ VisitedRegion.RegionId = Region.RegionId Region))
```

<details>
<summary><strong>Outras Consultas</strong></summary>
```
ρ localizacao_atual_id (π PcLocationId (σ CharacterId = 1 PC))
```

```
σ RegionId = nova_regiao_id Location
```

```
ρ equipamento_id, motivo (π Requirement, WhyisBlocked (σ RegionId = nova_regiao_id Region))
```

```
ρ nome_equipamento (π ItemName (σ ItemId = equipamento_id ItemEquipment))
```

```
ρ new_location (π LocationId (σ RegionId = nova_regiao_id (σ RoomId IS NULL Location)))
```

```
ρ localizacao_pc (π PcLocationId (σ CharacterId = 1 PC))
```

```
ρ regiao_estrutura (π RegionId (σ LOWER(StructureName) = nome_estrutura Structure))
```

```
ρ localizacao_estrutura (π LocationId (σ RegionId = regiao_estrutura Location))
```

```
ρ salainicial_id (π InitialRoom (σ LOWER(StructureName) = nome_estrutura Structure))
```

```
ρ id_objeto (π BlockedBy (σ RoomId = salainicial_id Room))
```

```
π LocationId (σ RoomId = salainicial_id Location)
```

```
π Locks (σ ObjectId = id_objeto Object)
```

```
π LocationId (σ RoomId = salainicial_id Location)
```

```
π ObjectDescription (σ ObjectId = id_objeto Object)
```

```
ρ regiao_idn (π RegionId (σ LocationId = (π PcLocationId (σ CharacterId = 1 PC)) Location))
```

```
ρ new_location (π LocationId (σ RegionId = regiao_idn (σ RoomId IS NULL Location)))
```

```
ρ regiao_idn (π RegionId (σ LocationId = (π PcLocationId (σ CharacterId = 1 PC)) Location))
```

```
ρ new_location (π LocationId (σ RegionId = regiao_idn (σ RoomId IS NULL Location)))
```

```
ρ localizacao_pc (π PcLocationId (σ CharacterId = 1 PC))
```

```
ρ localizacao_itemM, itemM_id (π ItemLocationId, ItemId (σ LOWER(ItemName) = nome_item ItemMaterial))
```

```
ρ localizacao_itemE, itemE_id (π ItemLocationId, ItemId (σ LOWER(ItemName) = nome_item ItemEquipment))
```

```
ρ item1_id (π Inventory.ItemId (σ CharacterId = 1 AND LOWER(ItemMaterial.ItemName) = LOWER(nome_item1) (Inventory ⨝ Inventory.ItemId = ItemMaterial.ItemId ItemMaterial)))
```

```
ρ item2_id (π Inventory.ItemId (σ CharacterId = 1 AND LOWER(ItemMaterial.ItemName) = LOWER(nome_item2) (Inventory ⨝ Inventory.ItemId = ItemMaterial.ItemId ItemMaterial)))
```

```
ρ resultado_id1, resultado_id2, equipamento_id (π Result1Id, Result2Id, equipmentId (σ (Material1Id = item1_id AND Material2Id = item2_id) OR (Material1Id = item2_id AND Material2Id = item1_id) Combination))
```

```
ρ nome_equipamento (π ItemName (σ ItemId = equipamento_id ItemEquipment))
```

```
σ CharacterId = 1 AND ItemId = equipamento_id Inventory
```

```
ρ nome_item_resultado1 (π ItemName (σ ItemId = resultado_id1 ItemMaterial))
```

```
ρ nome_item_resultado2 (π ItemName (σ ItemId = resultado_id2 ItemMaterial))
```

```
ρ evento_tipo (π EventType (σ E.EventId = event_id Event E))
```

```
ρ efeito (π Command (σ E.EventId = event_id ChatEvent E))
```

```
ρ efeito (π Command (σ E.EventId = event_id InteractEvent E))
```

```
ρ efeito (π Command (σ E.EventId = event_id RoomEvent E))
```

```
ρ nome_npc, localizacao_npc, npc_id, evento_id (π npc.npcName, npc.npclocationid, npc.CharacterId, EventId (σ LOWER(npcname) = substring(funcao from 15) npc))
```

```
ρ localizacao_pc (π PcLocationId (σ pc.CharacterId = 1 pc))
```

```
ρ localizacao_pc (π PcLocationId (σ pc.CharacterId = 1 pc))
```

```
ρ objeto_id, localizacao_objeto, item_objeto, Descricao_on_interact, Descricao, objeto_evento (π O.ObjectId, O.objectlocationid, O.ActivationItem, O.DescriptionOnInteract, O.ObjectDescription, O.EventId (σ LOWER(objectname) = objeto_nome object O))
```

```
ρ objeto_id, localizacao_objeto, item_objeto, Descricao_on_interact, Descricao, objeto_evento (π O.ObjectId, O.objectlocationid, O.ActivationItem, O.DescriptionOnInteract, O.ObjectDescription, O.EventId (σ LOWER(objectname) = objeto_nome object O))
```

```
ρ Item_Id (π I.itemid (σ LOWER(I.ItemName) = item_nome ItemMaterial I))
```

```
σ CharacterId = 1 AND ItemId = Item_Id Inventory
```

```
ρ localizacao_pc (π PcLocationId (σ CharacterId = 1 PC))
```

```
ρ regiao_id (π RegionId (σ LOWER(RegionName) = nome_regiao Region))
```

```
ρ regiao_local (π LocationId (σ RegionId = regiao_id AND RoomId IS NULL Location))
```

```
σ RegionId = regiao_id AND CharacterId = 1 VisitedRegion
```

```
π LocationId (σ RegionId = regiao_id AND RoomId IS NULL Location)
```

```
ρ localizacao_pc (π PcLocationId (σ CharacterId = 1 PC))
```

```
ρ quarto_pc (π RoomId (σ LocationId = localizacao_pc Location))
```

```
ρ quarto_alvo (π Room2Id (σ LOWER(ConnectionName) = nome_conexao AND Room1Id = quarto_pc Connection))
```

```
ρ quarto_alvo (π Room1Id (σ LOWER(ConnectionName) = nome_conexao AND Room2Id = quarto_pc Connection))
```

```
ρ id_objeto (π BlockedBy (σ RoomId = quarto_alvo Room))
```

```
π LocationId (σ RoomId = quarto_alvo Location)
```

```
π ObjectDescription (σ ObjectId = id_objeto Object)
```

```
ρ pc_location (π PcLocationId (σ CharacterId = 1 PC))
```

```
ρ region_id, room_id (π RegionID, RoomId (σ LocationId = pc_location Location))
```

```
ρ descricao (π RegionDescription (σ RegionId = region_id Region))
```

```
ρ descricao (π RoomDescription (σ RoomId = room_id Room))
```

```
π InitialRoom (σ StructureId = NEW.StructureId Structure)
```

```
σ C.CharacterId = NEW.CharacterId Character C
```

```
σ C.CharacterId = NEW.CharacterId Character C
```

```
σ I.ItemId = NEW.ItemId Item I
```

```
σ E.EventId = NEW.EventId Event E
```

```
ρ Idquarto (π RoomId (σ locationId = NEW.PcLocationId location))
```

```
ρ Idevento (π EventId (σ RoomId = Idquarto Room))
```

```
σ LocationId = NEW.PcLocationId Location
```

```
ρ idRegiao, idroom (π RegionId, RoomId (σ LocationId = NEW.PcLocationId Location))
```

```
π IsVisited (σ RegionId = idRegiao Region)
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