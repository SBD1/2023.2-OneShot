INSERT INTO fase VALUES (0, 'Fase teste', 'Fase teste');

INSERT INTO regiao (id, fase_id, nome, descricao)
VALUES (0, 0, 'Regiao teste CENTRAL','está na região CENTRAL');

INSERT INTO regiao (id, fase_id, nome, descricao, sul)
VALUES (1, 0, 'Regiao teste NORTE','está na região NORTE', 0);

INSERT INTO regiao (id, fase_id, nome, descricao, norte)
VALUES (2, 0, 'Regiao teste SUL','está na região SUL', 0);

INSERT INTO regiao (id, fase_id, nome, descricao, oeste)
VALUES (3, 0, 'Regiao teste LESTE','está na região LESTE',0);

INSERT INTO regiao (id, fase_id, nome, descricao, leste)
VALUES (4, 0, 'Regiao teste OESTE','está na região OESTE',0);

INSERT INTO regiao (id, fase_id, nome, descricao, norte, sul, leste, oeste)
VALUES (5, 0, 'Regiao teste Nordeste','está na região Nordeste', NULL, 3, NULL, 1);

INSERT INTO regiao (id, fase_id, nome, descricao, norte, sul, leste, oeste)
VALUES (6, 0, 'Regiao teste Noroeste','está na região Noroeste', NULL, 4, 1, NULL);

INSERT INTO regiao (id, fase_id, nome, descricao, norte, sul, leste, oeste)
VALUES (7, 0, 'Regiao teste Sudeste','está na região Sudeste', 3, NULL, NULL, 2);

INSERT INTO regiao (id, fase_id, nome, descricao, norte, sul, leste, oeste)
VALUES (8, 0, 'Regiao teste Sudoeste','está na região Sudoeste', 4, NULL, 2, NULL);

INSERT INTO localizacao (id, regiao_id)
VALUES (0, 0);

INSERT INTO localizacao (id, regiao_id)
VALUES (1, 1);

INSERT INTO localizacao (id, regiao_id)
VALUES (2, 2);

INSERT INTO localizacao (id, regiao_id)
VALUES (3, 3);

INSERT INTO localizacao (id, regiao_id)
VALUES (4, 4);

INSERT INTO localizacao (id, regiao_id)
VALUES (5, 5);

INSERT INTO localizacao (id, regiao_id) 
VALUES (6, 6);

INSERT INTO localizacao (id, regiao_id)
VALUES (7, 7);

INSERT INTO localizacao (id, regiao_id)
VALUES (8, 8);



INSERT INTO pc(id, nome, localizacao_id)
VALUES (0, 'Niko', 0);