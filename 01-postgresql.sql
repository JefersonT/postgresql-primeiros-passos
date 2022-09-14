--Criar um banco de dados
create database alura;

-- show database no prompt : $ \]

-- deletar database
drop database nome_banco;

drop database alura2;

--criando uma tabela simplificado
CREATE TABLE aluno(
    id SERIAL,
    nome VARCHAR(255),
    cpf CHAR(11),
    observação TEXT,
    idade INTEGER,
    dinheiro NUMERIC(10,2),
    altura REAL,
    ativo BOOLEAN,
    data_nascimento DATE,
    hora_aula TIME,
    matriculado_em TIMESTAMP
);

--Selecionar dados de uma tabela
select * from aluno;


-- Inserindo dados em uma tabela
--INSERT INTO table [ ( column [, ...] ) ]
--    { DEFAULT VALUES | VALUES ( { expression | DEFAULT } [, ...] ) | query }

INSERT INTO aluno (
    nome
) VALUES (
    'Diogo'
);

INSERT INTO aluno (
    nome,
    cpf,
    observação
) VALUES (
    'Diogo',
    '12345678901',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac dui et nisl vestibulum consequat. Integer vitae magna egestas, finibus libero dapibus, maximus magna. Fusce suscipit mi ut dui vestibulum, non vehicula felis fringilla. Vestibulum eget massa blandit, viverra quam non, convallis libero. Morbi ut nunc ligula. Duis tristique purus augue, nec sodales sem scelerisque dignissim. Sed vel rutrum mi. Nunc accumsan magna quis tempus rhoncus. Duis volutpat nulla a aliquet feugiat. Vestibulum rhoncus mi diam, eu consectetur sapien eleifend in. Donec sed facilisis velit. Duis tempus finibus venenatis. Mauris neque nisl, pulvinar eu volutpat eu, laoreet in massa. Quisque vestibulum eros ac tortor facilisis vulputate. Sed iaculis purus non sem tempus mollis. Curabitur felis lectus, aliquam id nunc ut, congue accumsan tellus.'
);

INSERT INTO aluno (
    nome,
    cpf,
    observação,
    idade,
    dinheiro,
    altura,
    ativo,
    data_nascimento,
    hora_aula,
    matriculado_em
) VALUES (
    'Diogo',
    '12345678901',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac dui et nisl vestibulum consequat. Integer vitae magna egestas, finibus libero dapibus, maximus magna. Fusce suscipit mi ut dui vestibulum, non vehicula felis fringilla. Vestibulum eget massa blandit, viverra quam non, convallis libero. Morbi ut nunc ligula. Duis tristique purus augue, nec sodales sem scelerisque dignissim. Sed vel rutrum mi. Nunc accumsan magna quis tempus rhoncus. Duis volutpat nulla a aliquet feugiat. Vestibulum rhoncus mi diam, eu consectetur sapien eleifend in. Donec sed facilisis velit. Duis tempus finibus venenatis. Mauris neque nisl, pulvinar eu volutpat eu, laoreet in massa. Quisque vestibulum eros ac tortor facilisis vulputate. Sed iaculis purus non sem tempus mollis. Curabitur felis lectus, aliquam id nunc ut, congue accumsan tellus.',
    35,
    100.50,
    1.81,
    TRUE,
    '1984-08-27',
    '17:30:00',
    '2020-02-08 12:32:45'
);

INSERT INTO aluno (
    nome,
    cpf,
    observação,
    idade,
    dinheiro,
    altura,
    ativo,
    data_nascimento,
    hora_aula,
    matriculado_em
) VALUES (
    'Diogo',
    '12345678901',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac dui et nisl vestibulum consequat. Integer vitae magna egestas, finibus libero dapibus, maximus magna. Fusce suscipit mi ut dui vestibulum, non vehicula felis fringilla. Vestibulum eget massa blandit, viverra quam non, convallis libero. Morbi ut nunc ligula. Duis tristique purus augue, nec sodales sem scelerisque dignissim. Sed vel rutrum mi. Nunc accumsan magna quis tempus rhoncus. Duis volutpat nulla a aliquet feugiat. Vestibulum rhoncus mi diam, eu consectetur sapien eleifend in. Donec sed facilisis velit. Duis tempus finibus venenatis. Mauris neque nisl, pulvinar eu volutpat eu, laoreet in massa. Quisque vestibulum eros ac tortor facilisis vulputate. Sed iaculis purus non sem tempus mollis. Curabitur felis lectus, aliquam id nunc ut, congue accumsan tellus.',
    35,
    100.50,
    1.81,
    TRUE,
    '1984-08-27',
    '17:30:00',
    '2020-02-08 12:32:45'
);

--  Atualizar dados de um registro da tabela
-- UPDATE [ ONLY ] table_name [ * ] [ [ AS ] alias ]
--    SET { column_name = { expression | DEFAULT } |
--          ( column_name [, ...] ) = [ ROW ] ( { expression | DEFAULT } [, ...] ) |
--          ( column_name [, ...] ) = ( sub-SELECT )
--        }
--                [ WHERE condition | WHERE CURRENT OF cursor_name ]


UPDATE aluno
    SET nome = 'Nico',
    cpf = '10987654321',
    observação = 'Teste',
    idade = 38,
    dinheiro = 15.23,
    altura = 1.90,
    ativo = FALSE,
    data_nascimento = '1980-01-15',
    hora_aula = '13:00:00',
    matriculado_em = '2020-01-02 15:00:00'
WHERE id = 4;

INSERT INTO aluno (nome) VALUES ('Vinícius Dias');
INSERT INTO aluno (nome) VALUES ('Nico Steppat');
INSERT INTO aluno (nome) VALUES ('João Roberto');
INSERT INTO aluno (nome) VALUES ('Diego');

-- Excluindo um registro da tabela
--DELETE FROM [ ONLY ] table_name [ * ] [ [ AS ] alias ]
--    [ USING from_item [, ...] ]
--    [ WHERE condition | WHERE CURRENT OF cursor_name ]

   
delete FROM aluno 
    WHERE nome = 'Nico';

-- Selecionando colunas específicas
SELECT nome,
       idade,
       matriculado_em
    FROM aluno;
   
-- Selecionando colunas específicas e definindo aliases para ela
SELECT nome AS "Nome do Aluno",
   idade,
   matriculado_em AS quando_se_matriculou
FROM aluno;
   
-- Filtrando por campo do tipo texto simples
SELECT *
    FROM aluno
 WHERE nome = 'Diogo';

-- Filtrando por campo de texto com qualquer caracter naquela posição "_"
SELECT * 
    FROM aluno
 WHERE nome LIKE 'Di_go';

-- Filtrando por campo de texto com começo com D
SELECT * 
    FROM aluno
 WHERE nome LIKE 'D%';

-- Filtando por campo de texto que possua " "
SELECT * 
    FROM aluno
 WHERE nome LIKE '% %';

-- Filtrando campos nulos
SELECT *
    FROM aluno
 WHERE cpf IS NULL;

-- Filtrando campos com valor entre dois valores
SELECT *
    FROM aluno
 WHERE idade BETWEEN 10 AND 20;

-- Filtrando campos por valor
SELECT *
    FROM aluno
 WHERE idade = 35;

SELECT *
    FROM aluno
 WHERE idade > 10;

SELECT *
    FROM aluno
 WHERE idade < 80;

SELECT *
    FROM aluno
 WHERE idade != 35;

SELECT *
    FROM aluno
 WHERE idade <> 35;

-- Filtrando Utilizando operadores E e OU
SELECT *
    FROM aluno
  WHERE nome LIKE 'D%'
    AND cpf IS NOT NULL;
   
SELECT *
    FROM aluno
  WHERE nome LIKE 'Diogo'
    OR nome LIKE 'Rodrigo';

SELECT *
    FROM aluno
  WHERE nome LIKE 'Diogo'
    AND nome LIKE 'Nico%';

SELECT *
    FROM aluno
  WHERE nome LIKE 'Thiago'
     OR nome LIKE 'Miguel';

-- Criando tabela com chave primaria
CREATE TABLE curso (
    id INTEGER PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

INSERT INTO curso (id, nome) VALUES (1, 'HTML');
INSERT INTO curso (id, nome) VALUES (2, 'Javascript');
INSERT INTO curso (id, nome) VALUES (3, 'Python');

SELECT * FROM aluno_curso

CREATE TABLE aluno (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

INSERT INTO aluno (nome) VALUES ('Diogo');
INSERT INTO aluno (nome) VALUES ('Vinícius');


CREATE TABLE aluno_curso (
    aluno_id INTEGER,
    curso_id INTEGER,
    PRIMARY KEY (aluno_id, curso_id)
);

-- Deletando tabela
DROP TABLE aluno_curso;

-- criando tabela com chave estrangeira
CREATE TABLE aluno_curso (
    aluno_id INTEGER,
        curso_id INTEGER,
        PRIMARY KEY (aluno_id, curso_id),

        FOREIGN KEY (aluno_id)
         REFERENCES aluno (id),

        FOREIGN KEY (curso_id)
         REFERENCES curso (id)

);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1);

-- Consultas com relacionamentos
SELECT *
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id;
 
 
SELECT aluno.nome as aluno,
       curso.nome as curso
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso ON curso.id = aluno_curso.curso_id;
 
SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso ON curso.id = aluno_curso.curso_id;
 
SELECT aluno.nome as "Nome do Aluno",
        curso.nome as "Nome do Curso"
    FROM aluno
INNER JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
INNER JOIN curso ON curso.id = aluno_curso.curso_id;
 
SELECT aluno.nome as "Nome do Aluno",
        curso.nome as "Nome do Curso"
    FROM aluno
LEFT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
LEFT JOIN curso ON curso.id = aluno_curso.curso_id;

SELECT aluno.nome as "Nome do Aluno",
        curso.nome as "Nome do Curso"
    FROM aluno
RIGHT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
RIGHT JOIN curso ON curso.id = aluno_curso.curso_id;

SELECT aluno.nome as "Nome do Aluno",
        curso.nome as "Nome do Curso"
    FROM aluno
FULL JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
FULL JOIN curso ON curso.id = aluno_curso.curso_id;

SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
    FROM aluno
CROSS JOIN curso;

SELECT * FROM aluno;
SELECT * FROM aluno_curso;
SELECT * FROM curso;

DROP TABLE aluno_curso

-- DELETE CASCADE
CREATE TABLE aluno_curso (
    aluno_id INTEGER,
    curso_id INTEGER,
    PRIMARY KEY (aluno_id, curso_id),

    FOREIGN KEY (aluno_id)
     REFERENCES aluno (id)
     ON DELETE cascade,

    FOREIGN KEY (curso_id)
     REFERENCES curso (id)

);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,3);

SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
    FROM aluno
    JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    JOIN curso ON curso.id = aluno_curso.curso_id;

DELETE FROM aluno WHERE id = 1;


UPDATE aluno
    SET id = 10
    WHERE id = 2;
   
UPDATE aluno
    SET id = 20
    WHERE id = 4;

-- UPDATE CASCADE
CREATE TABLE aluno_curso (
    aluno_id INTEGER,
        curso_id INTEGER,
        PRIMARY KEY (aluno_id, curso_id),

        FOREIGN KEY (aluno_id)
         REFERENCES aluno (id)
         ON DELETE CASCADE
         ON  UPDATE cascade,

        FOREIGN KEY (curso_id)
         REFERENCES curso (id)

);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1);

SELECT 
        aluno.id as aluno_id,
        aluno.nome as "Nome do Aluno",
        curso.id as "curso_id",
        curso.nome as "Nome do Curso"
    FROM aluno
    JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    JOIN curso ON curso.id = aluno_curso.curso_id;

UPDATE aluno SET id = 20 WHERE id = 2;

CREATE TABLE funcionarios(
    id SERIAL PRIMARY KEY,
    matricula VARCHAR(10),
    nome VARCHAR(255),
    sobrenome VARCHAR(255)
);

INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M001', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M002', 'Vinícius', 'Dias');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M003', 'Nico', 'Steppat');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M004', 'João', 'Roberto');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M005', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M006', 'Alberto', 'Martins');

--Ordenando as consultas
SELECT * 
    FROM funcionarios
    ORDER BY nome;

SELECT *
    FROM funcionarios
    ORDER BY 3, 4, 2;

SELECT *
    FROM funcionarios
    ORDER BY 4 DESC, nome DESC, 2;
   
SELECT 
        aluno.id as aluno_id,
        aluno.nome as "Nome do Aluno",
        curso.id as "curso_id",
        curso.nome as "Nome do Curso"
    FROM aluno
    JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    JOIN curso ON curso.id = aluno_curso.curso_id
    ORDER BY aluno.nome;
   
SELECT 
        aluno.id as aluno_id,
        aluno.nome as "Nome do Aluno",
        curso.id as "curso_id",
        curso.nome as "Nome do Curso"
    FROM aluno
    JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    JOIN curso ON curso.id = aluno_curso.curso_id
    ORDER BY curso.nome, aluno.nome;

-- Limitando consultas
SELECT * FROM funcionarios LIMIT 5;

SELECT *
  FROM funcionarios
  ORDER BY nome
LIMIT 5;


-- Se precisarmos do retorno de dados que não estão no começo da tabela, 
-- ou seja, exibir o resultado após avançar algumas linhas, codamos o comando OFFSET 
SELECT *
  FROM funcionarios
  ORDER BY id
 LIMIT 5
OFFSET 1;



-- Funções de agregação

-- COUNT - Retorna a quantidade de registros
-- SUM -   Retorna a soma dos registros
-- MAX -   Retorna o maior valor dos registros
-- MIN -   Retorna o menor valor dos registros
-- AVG -   Retorna a média dos registros
SELECT COUNT (id)
  FROM funcionarios;

SELECT COUNT (id),
       SUM(id),
       MAX(id),
       MIN(id),
       ROUND(AVG(id),0)
  FROM funcionarios;

 
 -- Agrupando consultas
 SELECT DISTINCT
        nome
  FROM funcionarios
  ORDER BY nome;
 
 SELECT DISTINCT
        nome,
        sobrenome
  FROM funcionarios
  ORDER BY nome;
 
-- Esse código retorna uma mensagem de erro, informando que nossos dados precisam estar no GROUP BY .
 SELECT DISTINCT
       nome,
       sobrenome,
       COUNT(*)
  FROM funcionarios
  ORDER BY nome;
 
-- correto
SELECT
       nome,
       sobrenome,
       COUNT(*)
  FROM funcionarios
  GROUP BY nome, sobrenome
  ORDER BY nome;
 
SELECT *
    FROM aluno
    JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
    JOIN curso ON curso.id = aluno_curso.curso_id;
   
   
SELECT curso.nome,
        COUNT (aluno.id)
    FROM aluno
    JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
    JOIN curso ON curso.id = aluno_curso.curso_id
    GROUP BY 1
    ORDER BY 1;
 

--Filtrando consultas agrupadas

SELECT curso.nome,
        COUNT (aluno.id)
    FROM curso
    LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
    LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id
GROUP BY 1
  having count(aluno.id) = 0;

SELECT nome
    FROM funcionarios
    GROUP BY nome
    HAVING COUNT(id) > 1;
   
SELECT nome,
       COUNT(id)
    FROM funcionarios
    GROUP BY nome
    HAVING COUNT(id) > 1;


