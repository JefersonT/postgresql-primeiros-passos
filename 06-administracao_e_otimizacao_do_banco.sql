-- 4. Processos de manutenção
create table instrutor (
  id serial primary key,
  nome varchar(255) not null,
  salario decimal(10,2)
);

do $$
  declare
  begin
    for i in 1..1000000 loop
      insert into instrutor (nome, salario) values ('Instrutor(a) ' || i, random() * 1000 + 1);
      end loop;
  end;
$$

select count(*) from instrutor;

update instrutor set salario = salario * 2 where id % 2 = 1;
delete from instrutor where id % 2 = 0;

select relname, n_dead_tup from pg_stat_user_tables; -- mostra quantidade de tuplas novas
select pg_size_pretty(pg_relation_size('instrutor')); -- mostra tamanho de memória utilizada

vacuum verbose; -- limpa tuplas mortas e retorna log
vacuum full; -- limpa tuplas mortas e trava o banco para outros usos
vacuum analyze; -- limpa tuplas mortas e atualiza o planejador de querys

analyze; --atualiza o planejador de queries

reindex table instrutor; -- reindexar index
-- 6. Planejamento de queries
	-- Plano de execução (EXPLAIN)
explain select * from instrutor where salario > 1500; -- explain mostra os passos realizados pela query

	-- Criando um índice
create index idx_salario on instrutor(salario); -- criar um indice

drop index idx_salario;
	-- Criando um usuário

create role jeferson login; -- login permite que o usuário possa fazer login no banco
-- ou
create user jeferson;
-- necessário liberar acesso o arquivo pg_hba.conf

	-- Atributos de roles
drop role jeferson; -- apaga usuário

create user jeferson password 'senha123'; -- cria usuario e define senha

create user jeferson password 'senha123' nosuperuser createdb; -- cria usuario e define senha, são é super usuário e pode criar db;


	-- Definindo permissões
revoke all on database alura from jeferson; -- Remove todas as permissões do usuário do db informado

grant select on public.instrutor to jeferson; -- Garante que o usuário possa realizar select na tabela informada
























