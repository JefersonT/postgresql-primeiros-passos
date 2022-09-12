
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
