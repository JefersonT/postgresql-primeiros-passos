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

-- Schemas
create schema academico;
-- Para criar tabelas no schema específico basta adicionar o nome do schema antes do nome da tabela (nome_schema.nome_tabela)
--criando uma tabela simplificado
CREATE TABLE academico.aluno(
    id serial primary key,
    primeiro_nome varchar(255) not null,
    ultimo_nome varchar(255) not null,
    data_nascimento date not null
);

create table academico.categoria (
  id serial primary key,
  nome varchar(255) not null unique
);

create table academico.curso(
  id serial primary key,
  nome varchar(255) not null,
  categoria_id integer not null references academico.categoria(id)
);

create table academico.aluno_curso (
  aluno_id integer not null references academico.aluno(id),
  curso_id integer not null references academico.curso(id),
  primary key (aluno_id, curso_id)
);
-- Tabela temporaria
create
temporary table a (
  coluna1 varchar(255) not null check(coluna1 <> ''),
  coluna2 varchar(255) not null,
  unique (coluna1, coluna2)
);

insert into a values ('a', 'b');

-- Alterar uma table
alter table a rename to teste;
select
* from teste;

-- alterar nome da coluna
alter table teste rename coluna1 to primeira_coluna;
alter table teste rename coluna2 to segunda_coluna;

--Conferindo a documentação (https://www.postgresql.org/docs/12/sql-altertable.html) caso precise, monte o SQL necessário para adicionar uma coluna nome, que é um VARCHAR(128) na tabela pessoa

-- ADD coluna
ALTER TABLE teste ADD COLUMN tercera_coluna VARCHAR(128);


-- ''-> valores ""-> Campos

create schema teste;
-- insert apartir de uma select
create temporary table cursos_programacao ( 
  id_curso integer primary key,
  nome_curso varchar(255) not null
);

insert into cursos_programacao
select academico.curso.id,
     academico.curso.nome
  from academico.curso
  where categoria_id = 2;
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
 
select * from cursos_programacao;

-- importação de arquivo
copy academico.aluno from /local/arquivo/dados.csv;

-- exportação de arquivo
copy academico.aluno to /local/arquivo/dados.csv;


select * from academico.curso order by id;



create table teste.cursos_programacao ( 
  id_curso integer primary key,
  nome_curso varchar(255) not null
);

insert into teste.cursos_programacao
select academico.curso.id,
     academico.curso.nome
  from academico.curso
  where categoria_id = 2;
 
select * from teste.cursos_programacao;


-- atualizar dados da table
update academico.curso set nome = 'Python Básico' where id = 1;
update academico.curso set nome = 'Java Básico' where id = 2;

update academico.curso set nome = 'Python Intermediário' where id = 1;
update academico.curso set nome = 'Java Intermediário' where id = 2;

update teste.cursos_programacao set nome_curso = nome from academico.curso where teste.cursos_programacao.id_curso = academico.curso.id;

-- Delete 
DELETE FROM curso
      USING categoria
      WHERE categoria.id = curso.categoria_id
        AND categoria.nome = 'Teste'
;

-- Transação -> delimita o inicio e o fim de uma transação permitindo retornar ao estado de inicio de uma transação caso algo errado ocorra
start transaction; -- Inicia uma transação
begin; -- inicia uma transação
rollback; -- desfaz tudo que fez dentro da transação em andamento
commit; --finalizar a transação (confirma a transações)

--FUNÇÕES
-- criando uma função
create function nome_funcao() returns integer as '
  select (5 * 3) - 2
' language sql;

create function soma_dois_num(num1 integer, num2 integer) returns integer as '
  select num1 + num2;
' language sql;

create function soma_dois_num(integer, integer) returns integer as '
  select $1 + $2;
' language sql;

create table a (nome varchar(255) not null);
create function crea_a(nome varchar) returns varchar as '
  insert into a (nome) values (crea_a.nome);
  select nome;
' language sql;

create function crea_b() returns void as $$
  insert into a (nome) values ('Yá Gama');
$$ language sql;


create function soma_e_produto (in n1 integer, in n2 integer, out soma integer, out produto integer) as $$
  select n1 + n2 as soma, n1 * n2 as produto;
$$ language sql;



create table instrutor (
  id serial primary key,
  nome varchar(255) not null,
  salario decimal(10,2)
);

insert into instrutor (nome, salario) values ('Vinicius Dias', 100);
insert into instrutor (nome, salario) values ('Marcos Andrade', 200);
insert into instrutor (nome, salario) values ('Mathes Fontelene', 400);
insert into instrutor (nome, salario) values ('Lucas Santos', 300);
insert into instrutor (nome, salario) values ('Pricilla Andrea', 500);

create function dobro_do_salario(instrutor) returns decimal as $$
  select $1.salario * 2 as dobro;
$$ language sql;

create or replace function cria_instrutor_falso() returns instrutor as $$
  select 22, 'Nome Falso', 22::decimal;
$$ language sql;


create function instrutores_bem_pagos(v_salario decimal) returns setof instrutor as $$
  select * from instrutor where salario > v_salario;
$$ language sql;


-- utilizando a função

select nome_funcao() as Valor;
select soma_dois_num(3, 4) as Soma;
select crea_a('Jeferson');
select crea_b();
select nome, dobro_do_salario(instrutor.*) as desejo from instrutor;
select * from cria_instrutor_falso();
select * from instrutores_bem_pagos(300);
select * from soma_e_produto(2, 4);

select * from a;

-- deletando uma função
drop function nomeFuncao;
drop function soma_dois_num;
drop function crea_b;
-- PLPGSQL
create or replace function primeira_pl() returns integer as $$
  begin 
    return 1;
  end
$$ language plpgsql;

select primeira_pl();

-- Usando Variáveis com plpgsql

create or replace function primeira_pl() returns integer as $$
  declare
    primeira_variavel integer default 3;
    segunda_variavel integer;
  begin
  	primeira_variavel := primeira_variavel * 2;
  	segunda_variavel := primeira_variavel + 10;
  	return segunda_variavel;
  end;
$$ language plpgsql;

select primeira_pl();

drop function primeira_ps;
-- sub blocos, em sub blocos as variáveis não são a mesma do bloco pai, mesmo possuindo o mesmo nome.
create or replace function primeira_pl() returns integer as $$
  declare
    primeira_variavel integer default 3;
  begin
  	primeira_variavel := primeira_variavel * 2;
    declare
      primeira_variavel integer default 10;
    begin
    	primeira_variavel := primeira_variavel * 10;
    end;
  	return primeira_variavel;
  end;
$$ language plpgsql;

select primeira_pl();
  
--O que aprendemos nessa aula:
--
--    Entendemos as limitações do SQL quando se trata de programação;
--    Conhecemos a linguagem PLpgSQL, que é uma linguagem de Programação Procedural criada pelo PostgreSQL como uma extensão ao SQL;
--    Aprendemos sobre a estrutura básica de criação de uma função usando PLpgSQL;
--    Aprendemos a definir variáveis;
--    Entendemos o conceito de blocos e escopos usando PLpgSQL.


-- retornando void
create  table a (nome varchar(255) not null);

create or replace function cria_a(nome varchar) returns void as $$
  begin
  	insert into a (nome) values (nome);
  end;
$$ language plpgsql;

select cria_a('Matheus');
select * from a;

-- return um tipo composto 1
create or replace function cria_instrutor_falso() returns instrutor as $$
  begin
	 return row(22, 'Nome falso', 200::decimal)::instrutor;
  end;
$$ language plpgsql;

select id, salario from cria_instrutor_falso();


-- return um tipo composto 2
create or replace function cria_instrutor_falso() returns instrutor as $$
  declare
    retorno instrutor;
  begin
  	select 22, 'Nome falso', 200::decimal into retorno;
	return retorno;
  end;
$$ language plpgsql;

select id, salario from cria_instrutor_falso();

-- return com setof
create or replace function instrutores_bem_pagos(v_salario decimal) returns setof instrutor as $$
  begin
 	return query select * from instrutor where salario > v_salario;
  end;
 $$ language plpgsql;

select * from instrutores_bem_pagos(300);

-- https://www.postgresql.org/docs/current/plpgsql-statements.html#PLPGSQL-STATEMENTS-SQL-ONEROW

-- IF-ELSE 1
create function salario_ok(instrutor instrutor) returns varchar as $$
  begin
 	if instrutor.salario > 200 then
 	  return 'Salário está ok';
 	else
 	  return 'Salário pode aumentar';
 	end if;
 end;
 $$ language plpgsql;

select nome, salario, salario_ok(instrutor) from instrutor;

-- IF-ELSE 2
create or replace function salario_ok(id_i integer) returns varchar as $$
  declare
  	instrutor instrutor;
  begin
	select * from instrutor where id = id_i into instrutor;
 	if instrutor.salario > 200 then
 	  return 'Salário está ok';
 	else
 	  return 'Salário pode aumentar';
 	end if;
 end;
 $$ language plpgsql;

select nome, salario, salario_ok(instrutor.id) from instrutor;

-- IF-ELSE 3
create or replace function salario_ok(instrutor instrutor) returns varchar as $$
  begin
 	if instrutor.salario > 300 then
 	  return 'Salário está ok';
 	else
 	  if instrutor.salario = 300 then
 	    return 'Salário pode aumentar';
 	  else
 	    return 'Salário está defasador';
 	  end if;
 	end if;
 end;
 $$ language plpgsql;

select nome, salario, salario_ok(instrutor) from instrutor;

-- IF-ELSE 4
create or replace function salario_ok(instrutor instrutor) returns varchar as $$
  begin
 	if instrutor.salario > 300 then
 	  return 'Salário está ok';
 	elseif instrutor.salario = 300 then
 	  return 'Salário pode aumentar';
 	else
 	  return 'Salário está defasador';
 	end if;
 end;
 $$ language plpgsql;

select nome, salario, salario_ok(instrutor) from instrutor;

-- CASE WHEN 1
create or replace function salario_ok(instrutor instrutor) returns varchar as $$
  begin
 	case
	 	when instrutor.salario = 100 then
	 	  return 'Salário muito baixo';
	 	when instrutor.salario = 200 then
	 	  return 'Salário baixo';
	 	when instrutor.salario = 300 then
	 	  return 'Salário ok';
	 	else
	 	  return 'Salário ótimo';
	 end case;
 end;
 $$ language plpgsql;

select nome, salario, salario_ok(instrutor) from instrutor;

-- CASE WHEN 2
create or replace function salario_ok(instrutor instrutor) returns varchar as $$
  begin
 	case instrutor.salario
	 	when 100 then
	 	  return 'Salário muito baixo';
	 	when 200 then
	 	  return 'Salário baixo';
	 	when 300 then
	 	  return 'Salário ok';
	 	else
	 	  return 'Salário ótimo';
	 end case;
 end;
 $$ language plpgsql;

select nome, salario, salario_ok(instrutor) from instrutor;



--O que aprendemos nessa aula:
--
--    Vimos como retornar valores utilizando PLpgSQL;
--    Aprendemos a tomar decisões em nossos códigos usando IF;
--    Conseguimos controlar o fluxo de nossa aplicação com ELSEIF e ELSE;
--    Aprendemos a deixar nosso código um pouco mais legível com CASE.

-- RETURN NEXT
-- Essa instrução é utilizada quando precisamos retornar múltiplas linhas de uma função PLpgSQL 
--   mas não temos uma query para isso (senão poderíamos utilizar o RETURN QUERY).
-- Se você quiser ler com mais detalhes sobre as formas de retornar em uma função, 
--   dá uma olhada aqui: https://www.postgresql.org/docs/current/plpgsql-control-structures.html#PLPGSQL-STATEMENTS-RETURNING
create or replace function tabuada(numero integer) returns setof integer as $$
  begin 
    return next numero * 1;
    return next numero * 2;
    return next numero * 3;
    return next numero * 4;
    return next numero * 5;
    return next numero * 6;
    return next numero * 7;
    return next numero * 8;
    return next numero * 9;
 end
 $$ language plpgsql;

select tabuada(1);

-- LOOP
create or replace function tabuada(numero integer) returns setof integer as $$
  declare
    mult integer default 1;
  begin 
 	loop
	 	return next numero * mult;
	 	mult := mult + 1;
	 	exit when mult = 10;
 	end loop;
  end;
 $$ language plpgsql;

select tabuada(5);

-- outra opção
drop function tabuada; 
create or replace function tabuada(numero integer) returns setof varchar as $$
  declare
    mult integer default 1;
  begin
	return next 'LOOP';
 	loop
	 	return next numero || ' x ' || mult || ' = ' || numero * mult;
	 	mult := mult + 1;
	 	exit when mult = 10;
 	end loop;
  end;
 $$ language plpgsql;

select tabuada(5);


-- WHILE
create or replace function tabuada(numero integer) returns setof varchar as $$
  declare
    mult integer default 1;
  begin
	return next 'WHILE_LOOP';
 	while mult < 10 loop
	 	return next numero || ' x ' || mult || ' = ' || numero * mult;
	 	mult := mult + 1;
 	end loop;
  end;
 $$ language plpgsql;

select tabuada(5);

-- FOR
create or replace function tabuada(numero integer) returns setof varchar as $$
  begin
	return next 'FOR';
 	for mult in 1..9 loop
	 	return next numero || ' x ' || mult || ' = ' || numero * mult;
 	end loop;
  end;
 $$ language plpgsql;

select tabuada(10);

create function instrutor_com_salario(out nome VARCHAR, out salario_ok VARCHAR) returns setof record as $$
  declare
    instrutor instrutor;
  begin
  	for instrutor in select * from instrutor loop
  		nome := instrutor.nome;
  	    salario_ok := salario_ok(instrutor.id);
  	    return next;
  	end loop;
  end;
$$ language plpgsql;

select * from instrutor_com_salario();

/* Para ler com mais detalhes sobre cada uma das estruturas aprendidas neste capítulo, 
 *  recomendo fortemente a leitura desse link: 
 *  https://www.postgresql.org/docs/current/plpgsql-control-structures.html#PLPGSQL-CONTROL-STRUCTURES-LOOPS */
-- praticando
create function cria_curso(nome_curso varchar, nome_categoria varchar) returns void as $$
  declare
    id_categoria integer;
  begin
  	select id into id_categoria from categoria where nome = nome_categoria;
    
    if not found then
      insert into categoria (nome) values (nome_categoria) returning id into id_categoria;
    end if;   
    insert into curso (nome, categoria_id) values (nome_curso, id_categoria);
  end;
 $$ language plpgsql;

select cria_curso('JUnit', 'Quality Assurance');
select * from categoria;
select * from curso;
--
create table log_instrutores (
  id serial primary key,
  informacao varchar(255),
  momento_criacao timestamp default current_timestamp
);

create or replace function cria_instrutor(nome_instrutor varchar, salario_instrutor decimal) returns void as $$
  declare
    id_instrutor_inserido integer;
    media_salarial decimal;
    instrutores_recebem_menos integer default 0;
    total_instrutores integer default 0;
    salario decimal;
    percentual decimal;
  begin
	select avg (instrutor.salario) into media_salarial from instrutor;
  	insert into instrutor (nome, salario) values (nome_instrutor, salario_instrutor) returning id into id_instrutor_inserido;
    if salario_instrutor > media_salarial then
      insert into log_instrutores (informacao) values (nome_instrutor || ' recebe acima da média');
    end if;
    for salario in select instrutor.salario from instrutor where id <> id_instrutor_inserido loop
    	total_instrutores := total_instrutores + 1;
        if salario_instrutor > salario then
          instrutores_recebem_menos := instrutores_recebem_menos + 1;
        end if;
    end loop;
   
    percentual := instrutores_recebem_menos::decimal / total_instrutores::decimal * 100;
    insert into log_instrutores (informacao) values (nome_instrutor || ' recebe mais do que ' || percentual || '% da grade de instrutores');
   
  end;
$$ language plpgsql;

select * from instrutor;
select cria_instrutor('Luiz Sousa', 10000.00);
select * from log_instrutores;




/*Depois de um denso capítulo de exercícios, vou deixar aqui uma “curiosidade” para você se aprofundar nesse mundo de PLpgSQL.
 * Em raros momentos, podemos querer montar uma string contendo uma query a ser executada e armazenar essa string em uma variável.
 * Se nós tivermos uma string contendo uma query válida, podemos executar essa query através do comando EXECUTE da linguagem PLpgSQL.
 * Para ver exemplos e ler sobre mais detalhes, dá uma olhada aqui: https://www.postgresql.org/docs/current/plpgsql-statements.html#PLPGSQL-STATEMENTS-EXECUTING-DYN
 * Mais uma vez, caso essa instrução EXECUTE não fique clara, não hesite em abrir uma dúvida no fórum. ;-)*/


