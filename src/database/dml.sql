INSERT INTO fase VALUES (0, 'Fase teste', 'Fase teste');

INSERT INTO regiao (id, fase_id, nome, descricao)
VALUES (0, 0, 'Regiao teste CENTRAL','Niko está na região CENTRAL');

INSERT INTO regiao (id, fase_id, nome, descricao, sul)
VALUES (1, 0, 'Regiao teste NORTE','Niko está na região NORTE', 0);

INSERT INTO regiao (id, fase_id, nome, descricao, norte)
VALUES (2, 0, 'Regiao teste SUL','Niko está na região SUL', 0);

INSERT INTO regiao (id, fase_id, nome, descricao, oeste)
VALUES (3, 0, 'Regiao teste LESTE','Niko está na região LESTE',0);

INSERT INTO regiao (id, fase_id, nome, descricao, leste)
VALUES (4, 0, 'Regiao teste OESTE','Niko está na região OESTE',0);

INSERT INTO regiao (id, fase_id, nome, descricao, norte, sul, leste, oeste)
VALUES (5, 0, 'Regiao teste Nordeste','Niko está na região Nordeste', NULL, 3, NULL, 1);

INSERT INTO regiao (id, fase_id, nome, descricao, norte, sul, leste, oeste)
VALUES (6, 0, 'Regiao teste Noroeste','Niko está na região Noroeste', NULL, 4, 1, NULL);

INSERT INTO regiao (id, fase_id, nome, descricao, norte, sul, leste, oeste)
VALUES (7, 0, 'Regiao teste Sudeste','Niko está na região Sudeste', 3, NULL, NULL, 2);

INSERT INTO regiao (id, fase_id, nome, descricao, norte, sul, leste, oeste)
VALUES (8, 0, 'Regiao teste Sudoeste','Niko está na região Sudoeste', 4, NULL, 2, NULL);

INSERT INTO localizacao (id, regiao_id, sala_id)
VALUES (0, 0, NULL);

INSERT INTO localizacao (id, regiao_id, sala_id)
VALUES (1, 1, NULL);

INSERT INTO localizacao (id, regiao_id, sala_id)
VALUES (2, 2, NULL);

INSERT INTO localizacao (id, regiao_id, sala_id)
VALUES (3, 3, NULL);

INSERT INTO localizacao (id, regiao_id, sala_id)
VALUES (4, 4, NULL);

INSERT INTO localizacao (id, regiao_id, sala_id)
VALUES (5, 5, NULL);

INSERT INTO localizacao (id, regiao_id, sala_id) 
VALUES (6, 6, NULL);

INSERT INTO localizacao (id, regiao_id, sala_id)
VALUES (7, 7, NULL);

INSERT INTO localizacao (id, regiao_id, sala_id)
VALUES (8, 8, NULL);


INSERT INTO estrutura (id, descricao, nome, regiao_id)
VALUES (0,'estrutura teste', 'estrutura teste', 0);

INSERT INTO sala (id, descricao, nome, estrutura_id)
VALUES (0,'Niko está em sala teste', 'Sala teste', 0);

UPDATE estrutura SET sala_inicial = 0 WHERE id = 0;

INSERT INTO estrutura (id, descricao, nome, regiao_id)
VALUES (1,'estrutura teste2', 'estrutura teste2', 1);

INSERT INTO sala (id, descricao, nome, estrutura_id)
VALUES (1,'Niko está em sala teste', 'Sala teste', 1);

UPDATE estrutura SET sala_inicial = 1 WHERE id = 1;

INSERT INTO localizacao (id, regiao_id, sala_id)
VALUES (9, 0, 0);

INSERT INTO localizacao (id, regiao_id, sala_id)
VALUES (10, 1, 1);

INSERT INTO objeto (id, descricao, localizacao_id)
VALUES (0, 'objeto teste', 0);

INSERT INTO item (id, descricao, localizacao_id)
VALUES (0, 'item teste', 0);

-- INSERT INTO objeto (id, descricao, localizacao_id)
-- VALUES (1, 'objeto teste2', 9);

-- INSERT INTO item (id, descricao, localizacao_id)
-- VALUES (1, 'item teste2', 9);





INSERT INTO pc(id, nome, localizacao_id)
VALUES (0, 'Niko', 0);
