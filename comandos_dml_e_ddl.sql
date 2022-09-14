
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


