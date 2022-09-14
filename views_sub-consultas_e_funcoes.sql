-- Chaves estrangeiras
CREATE TABLE curso(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
    categoria_id INTEGER NOT NULL REFERENCES categoria(id)
);

-- Operador IN
SELECT * FROM curso WHERE categoria_id IN (1,2);

-- Queries aninhadas

SELECT * FROM curso WHERE categoria_id IN (
    SELECT id FROM categoria WHERE nome NOT LIKE ('% %')
);

SELECT * FROM curso WHERE categoria_id IN (
    SELECT id FROM categoria WHERE nome LIKE ('% de %')
);

-- Personalizando tabela

   SELECT categoria.nome AS categoria,
        COUNT(curso.id) as numero_cursos
    FROM categoria
    JOIN curso ON curso.categoria_id = categoria.id
GROUP BY categoria;

SELECT categoria,
       numero_cursos
    FROM (
            SELECT categoria.nome AS categoria,
                COUNT(curso.id) as numero_cursos
            FROM categoria
            JOIN curso ON curso.categoria_id = categoria.id
        GROUP BY categoria;
    ) AS categoria_cursos
  WHERE numero_cursos > 3;

SELECT categoria.nome AS categoria,
        COUNT(curso.id) as numero_cursos
    FROM categoria
    JOIN curso ON curso.categoria_id = categoria.id
GROUP BY categoria;
    HAVING numero_cursos > 3;

-- Funções de strings
-- concatenação ||
-- SELECT CONCAT('Vinicius', ' ', NULL);
-- SELECT 'Vinícius' || ' ' || 'Dias';
   SELECT (primeiro_nome || ultimo_nome) AS nome_completo FROM aluno;
-- Funções de data
SELECT (primeiro_nome || ultimo_nome) AS nome_completo, NOW(), data_nascimento FROM aluno;

SELECT (primeiro_nome || ultimo_nome) AS nome_completo, NOW()::DATE, data_nascimento FROM aluno;
  
SELECT (primeiro_nome || ultimo_nome) AS nome_completo,
    NOW()::DATE - data_nascimento
  FROM aluno;

SELECT (primeiro_nome || ultimo_nome) AS nome_completo,
    (NOW()::DATE - data_nascimento)/365 AS idade
  FROM aluno;
   
   
SELECT (primeiro_nome || ultimo_nome) AS nome_completo,
    AGE(data_nascimento) AS idade
  FROM aluno;
   
SELECT (primeiro_nome || ultimo_nome) AS nome_completo,
    EXTRACT(YEAR FROM AGE(data_nascimento)) AS idade
  FROM aluno;
   
-- Criando um view
--CREATE [ OR REPLACE ] [ TEMP | TEMPORARY ] VIEW name [ ( column_name [, ...] ) ]
--    [ WITH ( view_option_name [= view_option_value] [, ... ] ) ]
--    AS query
-- CREATE VIEW nome_para_view
--    AS query_que_queremos_executar
   
CREATE VIEW vw_cursos_por_categoria
    AS SELECT categoria.nome AS categoria,
       COUNT(curso.id) as numero_cursos
   FROM categoria
   JOIN curso ON curso.categoria_id = categoria.id
GROUP BY categoria;

CREATE VIEW vw_cursos_programacao AS SELECT nome FROM curso WHERE categoria_id = 2
