<center>

# <a>Data Definition Language (DDL)</a>
</center>

## <a>Introdução</a>

DDL é a sigla para **<a>Data Definition Language</a>**. É uma linguagem de definição de dados que permite aos usuários especificar um esquema de banco de dados através de um conjunto de definições. O projeto físico do banco de dados consiste no mapeamento do projeto lógico para um DBMS real . 

O DDL é usado para criar, modificar e excluir objetos relacionados ao banco de dados, como tabelas, índices, visões, etc. O DDL é uma parte importante do projeto físico do banco de dados, pois permite definir a estrutura do banco de dados, incluindo a definição de tabelas, colunas, restrições, índices, etc.

## <a>Tabelas Criadas</a>

**<a>Tabela de Eventos</a>**
```sql
CREATE TABLE IF NOT EXISTS Event(
    EventId SERIAL PRIMARY KEY,
    EventType VARCHAR(10) NOT NULL
);
```
**<a>Tabela de Eventos de Chat</a>**
```sql
CREATE TABLE IF NOT EXISTS ChatEvent(
    EventId INT PRIMARY KEY REFERENCES Event(EventId),
    IsUnique BOOLEAN DEFAULT FALSE,
    AlreadyFired BOOLEAN DEFAULT FALSE,
    Command VARCHAR(250) NOT NULL
);
```
**<a>Tabela de Eventos de Interação</a>**
```sql
CREATE TABLE IF NOT EXISTS InteractEvent(
    EventId INT PRIMARY KEY REFERENCES Event(EventId),
    AlreadyFired BOOLEAN DEFAULT FALSE,
    ConsumesItem BOOLEAN DEFAULT TRUE,
    Command VARCHAR(250) NOT NULL
);
```
**<a>Tabela de Eventos de Sala</a>**
```sql
CREATE TABLE IF NOT EXISTS RoomEvent(
    EventId INT PRIMARY KEY REFERENCES Event(EventId),
    AlreadyFired BOOLEAN DEFAULT FALSE,
    Command VARCHAR(250) NOT NULL
);
```
**<a>Tabela de Fases</a>**
```sql
CREATE TABLE IF NOT EXISTS Phase(
    PhaseId SERIAL PRIMARY KEY,
    PhaseName VARCHAR(20) NOT NULL,
    PhaseDescription VARCHAR(100) NOT NULL
);
```
**<a>Tabela de Regiões</a>**
```sql
CREATE TABLE IF NOT EXISTS Region(
    RegionId SERIAL PRIMARY KEY,
    RegionName VARCHAR(20) UNIQUE NOT NULL,
    RegionDescription VARCHAR(250) NOT NULL,
    PhaseId INT NOT NULL REFERENCES Phase(PhaseId),
    isVisited BOOLEAN DEFAULT FALSE
);
```
**<a>Tabela de Geografias</a>**
```sql
CREATE TABLE IF NOT EXISTS RegionGeo(
    RegionId SERIAL PRIMARY KEY REFERENCES Region(RegionId),
    North INT REFERENCES Region(RegionId),
    South INT REFERENCES Region(RegionId),
    East INT REFERENCES Region(RegionId),
    West INT REFERENCES Region(RegionId)
);
```
**<a>Tabela de Estruturas</a>**
```sql
CREATE TABLE IF NOT EXISTS Structure(
    StructureId SERIAL PRIMARY KEY,
    StructureName VARCHAR(20) UNIQUE NOT NULL,
    StructureDescription VARCHAR(50) NOT NULL,
    RegionId INT NOT NULL REFERENCES Region(RegionId)
);
```
**<a>Tabela de Salas</a>**
```sql
CREATE TABLE IF NOT EXISTS Room(
    RoomId SERIAL PRIMARY KEY,
    RoomName VARCHAR(20) UNIQUE NOT NULL,
    RoomDescription VARCHAR(250) NOT NULL,
    IsVisited BOOLEAN DEFAULT FALSE,
    StructureId INT NOT NULL REFERENCES Structure(StructureId),
    EventId INT REFERENCES Event(EventId)
);
```
**<a>Tabela de Conexões</a>**
```sql
CREATE TABLE IF NOT EXISTS Connection(
    ConnectionId SERIAL PRIMARY KEY,
    ConnectionName VARCHAR(20) NOT NULL,
    Room1Id INT NOT NULL REFERENCES Room(RoomId),
    Room2Id INT NOT NULL REFERENCES Room(RoomId)
);
```
**<a>Tabela de Localizações</a>**
```sql
CREATE TABLE IF NOT EXISTS Location(
    LocationId SERIAL PRIMARY KEY,
    RegionId INT NOT NULL REFERENCES Region(RegionId),
    RoomId INT REFERENCES Room(RoomId)
);
```
**<a>Tabela de Objetos</a>**
```sql
CREATE TABLE IF NOT EXISTS Object(
    ObjectId SERIAL PRIMARY KEY,
    ObjectName VARCHAR(20) NOT NULL,
    ObjectDescription VARCHAR(20) NOT NULL,
    Locks BOOLEAN DEFAULT FALSE,
    DescriptionOnInteract VARCHAR(20) NOT NULL,
    ObjectLocationId INT REFERENCES Location(LocationId),
    EventId INT REFERENCES Event(EventId) 
);
```
**<a>Tabela de Personagens</a>**
```sql
CREATE TABLE IF NOT EXISTS Character(
    CharacterId SERIAL PRIMARY KEY,
    CharacterType VARCHAR(10) NOT NULL
);
```
**<a>Tabela de NPC</a>**
```sql
CREATE TABLE IF NOT EXISTS NPC(
    CharacterId INT PRIMARY KEY REFERENCES Character(CharacterId),
    NpcName VARCHAR(20) UNIQUE NOT NULL,
    NpcDescription VARCHAR(50) NOT NULL,
    IsWordMachine BOOLEAN DEFAULT FALSE,
    IsGod BOOLEAN DEFAULT FALSE,
    NpcLocationId INT REFERENCES Location(LocationId),
    EventId INT NOT NULL REFERENCES Event(EventId)
);
```
**<a>Tabela de PC</a>**
```sql
CREATE TABLE IF NOT EXISTS PC(
    CharacterId INT PRIMARY KEY REFERENCES Character(CharacterId),
    PcName VARCHAR(4) DEFAULT 'NIKO' UNIQUE NOT NULL,
    KnowsGod BOOLEAN DEFAULT FALSE,
    PcLocationId INT REFERENCES Location(LocationId)
);
```
**<a>Tabela de Regiões Visitadas</a>**
```sql
CREATE TABLE IF NOT EXISTS VisitedRegion(
    CharacterId INT REFERENCES PC(CharacterId),
    RegionId INT REFERENCES Region(RegionId),
    PRIMARY KEY (CharacterId, RegionId)
);
```
**<a>Tabela de Item</a>**
```sql
CREATE TABLE IF NOT EXISTS Item(
    ItemId SERIAL PRIMARY KEY,
    ItemType VARCHAR(10) NOT NULL
);
```
**<a>Tabela de Item Materiais</a>**
```sql
CREATE TABLE IF NOT EXISTS ItemMaterial(
    ItemId INT PRIMARY KEY REFERENCES Item(ItemId),
    ItemName VARCHAR(20) UNIQUE NOT NULL,
    ItemDescription VARCHAR(50) UNIQUE NOT NULL,
    ItemLocationId INT REFERENCES Location(LocationId)
);
```
**<a>Tabela de Item Equipamentos</a>**
```sql
CREATE TABLE IF NOT EXISTS ItemEquipment(
    ItemId INT PRIMARY KEY REFERENCES Item(ItemId),
    ItemName VARCHAR(20) UNIQUE NOT NULL,
    ItemDescription VARCHAR(50) UNIQUE NOT NULL,
    ItemLocationId INT REFERENCES Location(LocationId)
);
```
**<a>Tabela de Combinações</a>**
```sql
CREATE TABLE IF NOT EXISTS Combination(
    CraftId SERIAL PRIMARY KEY,
    Material1Id INT NOT NULL REFERENCES ItemMaterial(ItemId),
    Material2Id INT NOT NULL REFERENCES ItemMaterial(ItemId),
    Result1Id INT NOT NULL REFERENCES Item(ItemId),
    Result2Id INT REFERENCES Item(ItemId),
    equipmentId int REFERENCES ItemEquipment(ItemId)
);
```
**<a>Tabela de Inventário</a>**
```sql
CREATE TABLE IF NOT EXISTS Inventory(
    CharacterId INT REFERENCES Character(CharacterId),
    ItemId INT REFERENCES Item(ItemId),
    PRIMARY KEY (CharacterId, ItemId)
);
```
**<a>Tabela de Diálogos</a>**
```sql
CREATE TABLE IF NOT EXISTS Dialogue(
    DialogueId SERIAL PRIMARY KEY,
    DialogueText VARCHAR(250) NOT NULL,
    CharacterId INT NOT NULL REFERENCES Character(CharacterId),
    NextDialogue INT REFERENCES Dialogue(DialogueId),
    HaveChoice BOOLEAN NOT NULL
);
```
**<a>Tabela de Escolhas de Diálogos</a>**
```sql
CREATE TABLE IF NOT EXISTS DialogueChoice(
    DialogueId INT REFERENCES Dialogue(DialogueId),
    ChoiceId SERIAL,
    NextDialogue INT REFERENCES Dialogue(DialogueId),
    PRIMARY KEY (DialogueId, ChoiceId)
);
```
**<a>Tabela de Comandos</a>**
```sql
CREATE TABLE IF NOT EXISTS Command(
    FunctionId SERIAL PRIMARY KEY,
    CommandFunction VARCHAR(50) NOT NULL,
    PcId INT REFERENCES PC(CharacterId)
);
```

## <a>Tabelas Alteradas</a>


**<a>Tabela de Regiões</a>**
```sql
ALTER TABLE Region ADD Requirement INT REFERENCES ItemEquipment(ItemId);
```
**<a>Tabela de Estruturas</a>**
```sql
ALTER TABLE Structure ADD InitialRoom INT REFERENCES Room(RoomId);
```
**<a>Tabela de Salas</a>**
```sql
ALTER TABLE Room ADD BlockedBy INT REFERENCES ItemEquipment(ItemId);
```
**<a>Tabela de Objetos</a>**
```sql
ALTER TABLE Object ADD ActivationItem INT REFERENCES Item(ItemId);
```



## <a>Histórico de Versão</a>
<center>

|   Data   | Versão |      Descrição       |                   Autor                    |
| :------: | :----: | :------------------: | :----------------------------------------: |
| 25/11/23 |  1.0   | Criação do documento | [João Lucas](https://github.com/HacKairos) |

</center>

## <a>Bilbiografia</a>
    AVI SILBERSCHATZ, HENRY F. KORTH, S. SUDARSHAN. Database System Concepts. [s.l: s.n.].