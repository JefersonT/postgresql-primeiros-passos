-- SCRIPT PADRÃO
-- criando banco
create database alura;

-- criando schema
create schema academico;

-- criando tabelas
CREATE TABLE aluno(
    id serial primary key,
    primeiro_nome varchar(255) not null,
    ultimo_nome varchar(255) not null,
    data_nascimento date not null
);

create table categoria (
  id serial primary key,
  nome varchar(255) not null unique
);

create table curso(
  id serial primary key,
  nome varchar(255) not null,
  categoria_id integer not null references categoria(id)
);

create table aluno_curso (
  aluno_id integer not null references aluno(id),
  curso_id integer not null references curso(id),
  primary key (aluno_id, curso_id)
);
-- inserindo dados
insert into aluno (primeiro_nome, ultimo_nome, data_nascimento) values 
  ('Vinícius', 'Dias', '1997-10-15'),
  ('Ptricia', 'Freitas', '1989-02-8'),
  ('Diogo', 'Oliveira', '1999-03-10'),
  ('Maria', 'Rosa', '1994-04-20');

insert into categoria (nome) values
  ('Front-end'),
  ('Programação'),
  ('Bancos de dados'),
  ('Data Science');

insert into curso (nome, categoria_id) values 
  ('Python', 2),
  ('Java', 2),
  ('Postgree', 3),
  ('PowerBI', 4),
  ('Python Avançado', 2),
  ('Java Avançado', 2),
  ('Postgree Avançado', 3),
  ('PowerBI Avançado', 4);

insert into aluno_curso (aluno_id, curso_id) values
  (1,1),
  (1,2),
  (1,3),
  (2,1),
  (2,2);

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
insert into instrutor (nome, salario) values ('Jose Tomas', 1500);
insert into instrutor (nome, salario) values ('Maria José', 10000);


create table log_instrutores (
  id serial primary key,
  informacao varchar(255),
  momento_criacao timestamp default current_timestamp
);

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 --