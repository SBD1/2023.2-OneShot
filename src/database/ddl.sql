DROP TABLE IF EXISTS comandos;
DROP TABLE IF EXISTS pc;
DROP TABLE IF EXISTS localizacao;
DROP TABLE IF EXISTS regiao;
DROP TABLE IF EXISTS fase;


CREATE TABLE fase (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    descricao VARCHAR(255)
);

CREATE TABLE regiao (
    id INT PRIMARY KEY,
    fase_id INT NOT NULL REFERENCES fase(id),
    nome VARCHAR(255),
    descricao VARCHAR(255),
    norte INT REFERENCES regiao(id),
    sul INT REFERENCES regiao(id),
    leste INT REFERENCES regiao(id),
    oeste INT REFERENCES regiao(id)
);


-- CREATE TABLE estrutura (
--     id INT PRIMARY KEY,
--     regiao_id INT NOT NULL REFERENCES regiao(id),
--     Nome VARCHAR(255)
-- );

-- CREATE TABLE sala(
--     id INT PRIMARY KEY,
--     Nome VARCHAR(255),
--     estrutura_id INT NOT NULL REFERENCES estrutura(id);
-- );

-- CREATE TABLE conexao(
--     id INT PRIMARY KEY,
--     tipo VARCHAR(255),
--     prerequisito INT REFERENCES item(id),
--     sala1_id INT NOT NULL REFERENCES sala(id),
--     sala2_id INT NOT NULL REFERENCES sala(id)
-- );

-- ALTER TABLE sala ADD COLUMN conexao_id INT REFERENCES conexao(id);
-- ALTER TABLE estrutura ADD COLUMN sala_inicial INT REFERENCES sala(id);

CREATE TABLE localizacao (
    id INT PRIMARY KEY,
    regiao_id INT NOT NULL REFERENCES regiao(id)
);

-- CREATE TABLE personagem(
--     id INT PRIMARY KEY,
--     localizacao_id INT NOT NULL REFERENCES localizacao(id)
-- );

-- CREATE TABLE objeto(
--     id INT PRIMARY KEY,
--     localizacao_id INT NOT NULL REFERENCES localizacao(id)
-- );

-- CREATE TABLE item(
--     id INT PRIMARY KEY,
--     localizacao_id INT NOT NULL REFERENCES localizacao(id)
-- );

CREATE TABLE pc(
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    localizacao_id INT NOT NULL REFERENCES localizacao(id)
);

CREATE TABLE comandos(
    comando_id SERIAL PRIMARY KEY,
    funcao VARCHAR(255) 
);