SELECT 
    CASE 
        WHEN l.sala_id IS NOT NULL THEN s.descricao
        ELSE r.descricao
    END,
    CASE
        WHEN l.sala_id IS NULL THEN ARRAY_AGG(DISTINCT e.descricao)
        ELSE NULL
    END,
    ARRAY_AGG(DISTINCT o.descricao) AS objetos,
    ARRAY_AGG(DISTINCT i.descricao) AS itens
FROM localizacao l
LEFT JOIN regiao r ON l.regiao_id = r.id
LEFT JOIN sala s ON l.sala_id = s.id
LEFT JOIN estrutura e ON r.id = e.regiao_id
LEFT JOIN objeto o ON l.id = o.localizacao_id
LEFT JOIN item i ON l.id = i.localizacao_id
WHERE l.id = (SELECT localizacao_id FROM pc WHERE id = 0)
GROUP BY l.sala_id, s.descricao, r.descricao