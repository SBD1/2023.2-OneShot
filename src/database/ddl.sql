-- Tabela de Eventos
CREATE TABLE IF NOT EXISTS Event(
    EventId SERIAL PRIMARY KEY,
    EventType VARCHAR(10) NOT NULL
);

-- Tabela de Eventos de Chat
CREATE TABLE IF NOT EXISTS ChatEvent(
    EventId INT PRIMARY KEY REFERENCES Event(EventId),
    IsUnique BOOLEAN DEFAULT FALSE,
    AlreadyFired BOOLEAN DEFAULT FALSE,
    Command VARCHAR(450) NOT NULL
);

-- Tabela de Eventos de Interação
CREATE TABLE IF NOT EXISTS InteractEvent(
    EventId INT PRIMARY KEY REFERENCES Event(EventId),
    AlreadyFired BOOLEAN DEFAULT FALSE,
    ConsumesItem BOOLEAN DEFAULT TRUE,
    Command VARCHAR(450) NOT NULL
);

-- Tabela de Eventos de Sala
CREATE TABLE IF NOT EXISTS RoomEvent(
    EventId INT PRIMARY KEY REFERENCES Event(EventId),
    AlreadyFired BOOLEAN DEFAULT FALSE,
    Command VARCHAR(450) NOT NULL
);


-- Tabela de Fases
CREATE TABLE IF NOT EXISTS Phase(
    PhaseId SERIAL PRIMARY KEY,
    PhaseName VARCHAR(150) NOT NULL,
    PhaseDescription VARCHAR(250) NOT NULL
);

-- Tabela de Regiões
CREATE TABLE IF NOT EXISTS Region(
    RegionId SERIAL PRIMARY KEY,
    RegionName VARCHAR(150) UNIQUE NOT NULL,
    RegionDescription VARCHAR(250) NOT NULL,
    PhaseId INT NOT NULL REFERENCES Phase(PhaseId),
    isVisited BOOLEAN DEFAULT FALSE,
    WhyisBlocked VARCHAR(150)
);

-- Tabela de Geografias
CREATE TABLE IF NOT EXISTS RegionGeo(
    RegionId SERIAL PRIMARY KEY REFERENCES Region(RegionId),
    North INT REFERENCES Region(RegionId),
    South INT REFERENCES Region(RegionId),
    East INT REFERENCES Region(RegionId),
    West INT REFERENCES Region(RegionId)
);

-- Tabela de Estruturas
CREATE TABLE IF NOT EXISTS Structure(
    StructureId SERIAL PRIMARY KEY,
    StructureName VARCHAR(150) NOT NULL UNIQUE,
    StructureDescription VARCHAR(150) NOT NULL,
    RegionId INT NOT NULL REFERENCES Region(RegionId)
);

-- Tabela de Salas
CREATE TABLE IF NOT EXISTS Room(
    RoomId SERIAL PRIMARY KEY,
    RoomName VARCHAR(150) NOT NULL,
    RoomDescription VARCHAR(250) NOT NULL,
    IsVisited BOOLEAN DEFAULT FALSE,
    StructureId INT NOT NULL REFERENCES Structure(StructureId),
    EventId INT REFERENCES Event(EventId)
);

-- Tabela de Conexões
CREATE TABLE IF NOT EXISTS Connection(
    ConnectionId SERIAL PRIMARY KEY,
    ConnectionName VARCHAR(150) NOT NULL,
    Room1Id INT NOT NULL REFERENCES Room(RoomId),
    Room2Id INT NOT NULL REFERENCES Room(RoomId)
);

-- Tabela de Localizações
CREATE TABLE IF NOT EXISTS Location(
    LocationId SERIAL PRIMARY KEY,
    RegionId INT NOT NULL REFERENCES Region(RegionId),
    RoomId INT REFERENCES Room(RoomId)
);

-- Tabela de Objetos
CREATE TABLE IF NOT EXISTS Object(
    ObjectId SERIAL PRIMARY KEY,
    ObjectName VARCHAR(150) NOT NULL,
    ObjectDescription VARCHAR(250) NOT NULL,
    Locks BOOLEAN DEFAULT FALSE,
    DescriptionOnInteract VARCHAR(250) NOT NULL,
    ObjectLocationId INT REFERENCES Location(LocationId),
    EventId INT REFERENCES Event(EventId)
);

-- Tabela de Personagens
CREATE TABLE IF NOT EXISTS Character(
    CharacterId SERIAL PRIMARY KEY,
    CharacterType VARCHAR(150) NOT NULL
);

-- Tabela de NPC
CREATE TABLE IF NOT EXISTS NPC(
    CharacterId INT PRIMARY KEY REFERENCES Character(CharacterId),
    NpcName VARCHAR(150) UNIQUE NOT NULL,
    NpcDescription VARCHAR(150) NOT NULL,
    IsWordMachine BOOLEAN DEFAULT FALSE,
    IsGod BOOLEAN DEFAULT FALSE,
    NpcLocationId INT REFERENCES Location(LocationId),
    EventId INT REFERENCES Event(EventId)
);

-- Tabela de PC
CREATE TABLE IF NOT EXISTS PC(
    CharacterId INT PRIMARY KEY REFERENCES Character(CharacterId),
    PcName VARCHAR(4) DEFAULT 'NIKO',
    KnowsGod BOOLEAN DEFAULT FALSE,
    PcLocationId INT REFERENCES Location(LocationId)
);

-- Tabela de Regiões Visitadas
CREATE TABLE IF NOT EXISTS VisitedRegion(
    CharacterId INT REFERENCES PC(CharacterId),
    RegionId INT REFERENCES Region(RegionId),
    PRIMARY KEY (CharacterId, RegionId)
);

-- Tabela de Item
CREATE TABLE IF NOT EXISTS Item(
    ItemId SERIAL PRIMARY KEY,
    ItemType VARCHAR(10) NOT NULL
);

-- Tabela de Item Materiais
CREATE TABLE IF NOT EXISTS ItemMaterial(
    ItemId INT PRIMARY KEY REFERENCES Item(ItemId),
    ItemName VARCHAR(150) UNIQUE NOT NULL,
    ItemDescription VARCHAR(150) UNIQUE NOT NULL,
    ItemLocationId INT REFERENCES Location(LocationId)
);

-- Tabela de Item Equipamentos
CREATE TABLE IF NOT EXISTS ItemEquipment(
    ItemId INT PRIMARY KEY REFERENCES Item(ItemId),
    ItemName VARCHAR(150) UNIQUE NOT NULL,
    ItemDescription VARCHAR(150) UNIQUE NOT NULL,
    ItemLocationId INT REFERENCES Location(LocationId)
);

-- Tabela de Combinações
CREATE TABLE IF NOT EXISTS Combination(
    CraftId SERIAL PRIMARY KEY,
    Material1Id INT NOT NULL REFERENCES ItemMaterial(ItemId),
    Material2Id INT NOT NULL REFERENCES ItemMaterial(ItemId),
    Result1Id INT NOT NULL REFERENCES Item(ItemId),
    Result2Id INT REFERENCES Item(ItemId),
    equipmentId int REFERENCES ItemEquipment(ItemId)
);

-- Tabela de Inventário
CREATE TABLE IF NOT EXISTS Inventory(
    CharacterId INT REFERENCES Character(CharacterId),
    ItemId INT REFERENCES Item(ItemId),
    PRIMARY KEY (CharacterId, ItemId)
);

-- Tabela de Diálogos
CREATE TABLE IF NOT EXISTS Dialogue(
    DialogueId SERIAL PRIMARY KEY,
    DialogueText VARCHAR(250) NOT NULL,
    CharacterId INT NOT NULL REFERENCES Character(CharacterId),
    NextDialogue INT REFERENCES Dialogue(DialogueId),
    HaveChoice BOOLEAN NOT NULL DEFAULT FALSE,
    AllChoices BOOLEAN NOT NULL DEFAULT FALSE
);

-- Tabela de Escolhas de Diálogos
CREATE TABLE IF NOT EXISTS DialogueChoice(
    DialogueId INT REFERENCES Dialogue(DialogueId),
    ChoiceId SERIAL,
    Choice VARCHAR(50) NOT NULL,
    NextDialogue INT REFERENCES Dialogue(DialogueId),
    PRIMARY KEY (DialogueId, ChoiceId)
);

-- Tabela de Comandos
CREATE TABLE IF NOT EXISTS Command(
    FunctionId SERIAL PRIMARY KEY,
    CommandFunction VARCHAR(150) NOT NULL,
    PcId INT REFERENCES PC(CharacterId)
);

-- Alterações em Tabelas

-- Tabela de Regiões
ALTER TABLE Region ADD Requirement INT REFERENCES ItemEquipment(ItemId);

-- Tabela de Estruturas
ALTER TABLE Structure ADD InitialRoom INT REFERENCES Room(RoomId);

-- Tabela de Salas
ALTER TABLE Room ADD BlockedBy INT REFERENCES Object(ObjectId);

-- Tabela de Objetos
ALTER TABLE Object ADD ActivationItem INT REFERENCES Item(ItemId);