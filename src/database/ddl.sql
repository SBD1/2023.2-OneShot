-- Tabela de Eventos
CREATE TABLE IF NOT EXISTS Events(
    EventId SERIAL PRIMARY KEY,
    EventType VARCHAR(10) NOT NULL
);

-- Tabela de Eventos de Chat
CREATE TABLE IF NOT EXISTS ChatEvents(
    EventId INT PRIMARY KEY REFERENCES Events(EventId),
    IsUnique BOOLEAN NOT NULL,
    AlreadyFired BOOLEAN DEFAULT FALSE,
    Command VARCHAR(250) NOT NULL
);

-- Tabela de Eventos de Interação
CREATE TABLE IF NOT EXISTS InteractEvents(
    EventId INT PRIMARY KEY REFERENCES Events(EventId),
    AlreadyFired BOOLEAN DEFAULT FALSE,
    ConsumesItem BOOLEAN NOT NULL,
    Command VARCHAR(250) NOT NULL
);

-- Tabela de Eventos de Sala
CREATE TABLE IF NOT EXISTS RoomEvents(
    EventId INT PRIMARY KEY REFERENCES Events(EventId),
    AlreadyFired BOOLEAN DEFAULT FALSE,
    Command VARCHAR(250) NOT NULL
);

-- Tabela de Fases
CREATE TABLE IF NOT EXISTS Phases(
    PhaseId SERIAL PRIMARY KEY,
    PhaseName VARCHAR(20) NOT NULL,
    PhaseDescription VARCHAR(100) NOT NULL
);

-- Tabela de Regiões
CREATE TABLE IF NOT EXISTS Regions(
    RegionId SERIAL PRIMARY KEY,
    RegionName VARCHAR(20) UNIQUE NOT NULL,
    RegionDescription VARCHAR(250) NOT NULL,
    Phase INT NOT NULL REFERENCES Phases(PhaseId),
    isVisited BOOLEAN DEFAULT FALSE
);

-- Tabela de Geografias
CREATE TABLE IF NOT EXISTS RegionsGeo(
    RegionId SERIAL PRIMARY KEY REFERENCES Regions(RegionId),
    North INT REFERENCES Regions(RegionId),
    South INT REFERENCES Regions(RegionId),
    East INT REFERENCES Regions(RegionId),
    West INT REFERENCES Regions(RegionId)
);

-- Tabela de Estruturas
CREATE TABLE IF NOT EXISTS Structures(
    StructureId SERIAL PRIMARY KEY,
    StructureName VARCHAR(20) UNIQUE NOT NULL,
    StructureDescription VARCHAR(50) NOT NULL,
    Region INT NOT NULL REFERENCES Regions(RegionId)
);

-- Tabela de Salas
CREATE TABLE IF NOT EXISTS Rooms(
    RoomId SERIAL PRIMARY KEY,
    RoomName VARCHAR(20) UNIQUE NOT NULL,
    RoomDescription VARCHAR(250) NOT NULL,
    IsVisited BOOLEAN DEFAULT FALSE,
    Structure INT NOT NULL REFERENCES Structures(StructureId),
    EventId INT REFERENCES Events(EventId)
);

-- Tabela de Conexões
CREATE TABLE IF NOT EXISTS Connections(
    ConnectionId SERIAL PRIMARY KEY,
    ConnectionName VARCHAR(20) NOT NULL,
    Room1 INT NOT NULL REFERENCES Rooms(RoomId),
    Room2 INT NOT NULL REFERENCES Rooms(RoomId)
);

-- Tabela de Localizações
CREATE TABLE IF NOT EXISTS Locations(
    LocationId SERIAL PRIMARY KEY,
    Region INT NOT NULL REFERENCES Regions(RegionId),
    Room INT REFERENCES Rooms(RoomId)
);

-- Tabela de Objetos
CREATE TABLE IF NOT EXISTS Objects(
    ObjectId SERIAL PRIMARY KEY,
    ObjectName VARCHAR(20) NOT NULL,
    ObjectDescription VARCHAR(20) NOT NULL,
    Locks BOOLEAN DEFAULT FALSE,
    DescriptionOnInteract VARCHAR(20) NOT NULL,
    ObjectLocation INT REFERENCES Locations(LocationId),
    EventId INT REFERENCES Events(EventId) 
);

-- Tabela de Personagens
CREATE TABLE IF NOT EXISTS Characters(
    CharacterId SERIAL PRIMARY KEY,
    CharacterType VARCHAR(10) NOT NULL
);

-- Tabela de NPCs
CREATE TABLE IF NOT EXISTS NPCs(
    CharacterId INT PRIMARY KEY REFERENCES Characters(CharacterId),
    NpcName VARCHAR(20) UNIQUE NOT NULL,
    NpcDescription VARCHAR(50) NOT NULL,
    IsWordMachine BOOLEAN DEFAULT FALSE,
    IsGod BOOLEAN DEFAULT FALSE,
    NpcLocation INT REFERENCES Locations(LocationId),
    EventId INT NOT NULL REFERENCES Events(EventId)
);

-- Tabela de PCs
CREATE TABLE IF NOT EXISTS PCs(
    CharacterId INT PRIMARY KEY REFERENCES Characters(CharacterId),
    PcName VARCHAR(4) DEFAULT 'NIKO' UNIQUE NOT NULL,
    KnowsGod BOOLEAN DEFAULT FALSE,
    PcLocation INT REFERENCES Locations(LocationId)
);

-- Tabela de Regiões Visitadas
CREATE TABLE IF NOT EXISTS VisitedRegions(
    CharacterId INT REFERENCES PCs(CharacterId),
    RegionId INT REFERENCES Regions(RegionId),
    PRIMARY KEY (CharacterId, RegionId)
);

-- Tabela de Itens
CREATE TABLE IF NOT EXISTS Itens(
    ItemId SERIAL PRIMARY KEY,
    ItemType VARCHAR(10) NOT NULL
);

-- Tabela de Itens Materiais
CREATE TABLE IF NOT EXISTS ItensMaterial(
    ItemId INT PRIMARY KEY REFERENCES Itens(ItemId),
    ItemName VARCHAR(20) NOT NULL,
    ItemDescription VARCHAR(50) UNIQUE NOT NULL,
    ItemLocation INT REFERENCES Locations(LocationId)
);

-- Tabela de Itens Equipamentos
CREATE TABLE IF NOT EXISTS ItensEquipment(
    ItemId INT PRIMARY KEY REFERENCES Itens(ItemId),
    ItemName VARCHAR(20) NOT NULL,
    ItemDescription VARCHAR(50) UNIQUE NOT NULL,
    ItemLocation INT REFERENCES Locations(LocationId)
);

-- Tabela de Combinações
CREATE TABLE IF NOT EXISTS Combinations(
    CraftId SERIAL PRIMARY KEY,
    Material1 INT NOT NULL REFERENCES ItensMaterial(ItemId),
    Material2 INT NOT NULL REFERENCES ItensMaterial(ItemId),
    Result1 INT NOT NULL REFERENCES Itens(ItemId),
    Result2 INT REFERENCES Itens(ItemId)
);

-- Tabela de Inventário
CREATE TABLE IF NOT EXISTS Inventory(
    CharacterId INT REFERENCES Characters(CharacterId),
    ItemId INT REFERENCES Itens(ItemId),
    PRIMARY KEY (CharacterId, ItemId)
);

-- Tabela de Diálogos
CREATE TABLE IF NOT EXISTS Dialogues(
    DialogueId SERIAL PRIMARY KEY,
    DialogueText VARCHAR(250) NOT NULL,
    CharacterId INT NOT NULL REFERENCES Characters(CharacterId),
    NextDialogue INT REFERENCES Dialogues(DialogueId),
    HaveChoices BOOLEAN NOT NULL
);

-- Tabela de Escolhas de Diálogos
CREATE TABLE IF NOT EXISTS DialoguesChoices(
    DialogueId INT REFERENCES Dialogues(DialogueId),
    Choices SERIAL,
    NextDialogue INT REFERENCES Dialogues(DialogueId),
    PRIMARY KEY (DialogueId, Choices)
);

-- Tabela de Comandos
CREATE TABLE IF NOT EXISTS Commands(
    FunctionId SERIAL PRIMARY KEY,
    CommandFunction VARCHAR(50) NOT NULL,
    Pc INT REFERENCES PCs(CharacterId)
);

-- Alterações em Tabelas

-- Tabela de Regiões
ALTER TABLE Regions ADD Requirement INT REFERENCES ItensEquipment(ItemId);

-- Tabela de Estruturas
ALTER TABLE Structures ADD InitialRoom INT REFERENCES Rooms(RoomId);

-- Tabela de Salas
ALTER TABLE Rooms ADD BlockedBy INT REFERENCES ItensEquipment(ItemId);

-- Tabela de Objetos
ALTER TABLE Objects ADD ActivationItem INT REFERENCES Itens(ItemId);