-- PostgreSQL: Triggers, transações, erros e cursores
-- 01. Triggers (Gatilho)
-- Trigger é utilizado quando precisamos que uma determinada query seja executada automaticamente quando ocorrer um determinado evento.


-- Função Trigger a ser executado com o trigger com o evento
create or replace function cria_instrutor_log() returns trigger as $$
  declare
    media_salarial decimal;
    instrutores_recebem_menos integer default 0;
    total_instrutores integer default 0;
    salario decimal;
    percentual decimal;
  begin
	select avg (instrutor.salario) into media_salarial from instrutor;
  	
    if NEW.salario > media_salarial then
      insert into log_instrutores (informacao) values (NEW.nome || ' recebe acima da média');
    end if;
    for salario in select instrutor.salario from instrutor where id <> NEW.id loop
    	total_instrutores := total_instrutores + 1;
        if NEW.salario > salario then
          instrutores_recebem_menos := instrutores_recebem_menos + 1;
        end if;
    end loop;
   
    percentual := instrutores_recebem_menos::decimal / total_instrutores::decimal * 100;
   
    insert into log_instrutores (informacao)
   			values (NEW.nome || ' recebe mais do que ' || percentual || '% da grade de instrutores');
   		RETURN NEW;	
   
  end;
$$ language plpgsql;

-- definindo o Trigger (Executar a função cria_instrutor_log() após cada inserção na tabela instrutor)
CREATE TRIGGER cria_log_instrutores AFTER INSERT ON instrutor
	FOR EACH ROW EXECUTE FUNCTION cria_instrutor_log();

-- Deletar uma trigger
drop trigger cria_log_instrutores on instrutor;

-- criando instrutor
insert into instrutor (nome, salario) values ('Jeferson Ferreira', 4500);

-- Para saber mais: https://www.postgresql.org/docs/current/sql-createtrigger.html


--Desafio
--Então agora deixo 2 desafios para você. Lembre-se que caso não consiga implementar algum deles, pode recorrer ao nosso fórum.
--
--1. Caso o instrutor inserido receba acima da média, cancele a instrução, ou seja, não permita que a inserção ocorra.
--
--2. Desfaça o desafio anterior. Caso o instrutor inserido receba mais do que 100% dos instrutores existentes, 
--modifique a inserção para que ele passe a receber o mesmo que o instrutor mais bem pago
--
--Lembrando que modificar ou cancelar a inserção só é possível na definição do trigger no momento BEFORE. ;-)
--
--Boa sorte!
-- Função Trigger a ser executado com o trigger com o evento

-- Desafio 01.01
create or replace function cria_instrutor_log_d_1_01() returns trigger as $$
  declare
    media_salarial decimal;
    instrutores_recebem_menos integer default 0;
    total_instrutores integer default 0;
    salario decimal;
    percentual decimal;
  begin
	select avg (instrutor.salario) into media_salarial from instrutor;
  	
    if NEW.salario > media_salarial then
      return null;
    end if;
    for salario in select instrutor.salario from instrutor where id <> NEW.id loop
    	total_instrutores := total_instrutores + 1;
        if NEW.salario > salario then
          instrutores_recebem_menos := instrutores_recebem_menos + 1;
        end if;
    end loop;
   
    percentual := instrutores_recebem_menos::decimal / total_instrutores::decimal * 100;
   
    insert into log_instrutores (informacao)
   			values (NEW.nome || ' recebe mais do que ' || percentual || '% da grade de instrutores');
   		RETURN NEW;	
   
  end;
$$ language plpgsql;

-- definindo o Trigger (Executar a função cria_instrutor_log() após cada inserção na tabela instrutor)
CREATE TRIGGER cria_log_instrutores_d_1_01 Before INSERT ON instrutor
	FOR EACH ROW EXECUTE FUNCTION cria_instrutor_log_d_1_01();

-- Desafio 01.02
create or replace function cria_instrutor_log_d_1_02() returns trigger as $$
  declare
    media_salarial decimal;
    instrutores_recebem_menos integer default 0;
    total_instrutores integer default 0;
    salario decimal;
    percentual decimal;
    maior_salario decimal default 0;
  begin
	select avg (instrutor.salario) into media_salarial from instrutor;
  	
    if NEW.salario > media_salarial then
      insert into log_instrutores (informacao) values (NEW.nome || ' recebe acima da média');
    end if;
   for salario in select instrutor.salario from instrutor where id <> NEW.id loop
	   if salario > maior_salario then
	    	maior_salario := salario;
	    end if;
	   
    	total_instrutores := total_instrutores + 1;
        if NEW.salario > salario then
          instrutores_recebem_menos := instrutores_recebem_menos + 1;
        end if;
    end loop;
	   
    percentual := instrutores_recebem_menos::decimal / total_instrutores::decimal * 100;
   
   	if instrutores_recebem_menos = total_instrutores then
   		RETURN ROW(NEW.id, NEW.nome, maior_salario)::instrutor;
   	end if;
   
   	insert into log_instrutores (informacao)
   			values (NEW.nome || ' recebe mais do que ' || percentual || '% da grade de instrutores');
   		RETURN NEW;
   	
  end;
$$ language plpgsql;

CREATE TRIGGER cria_log_instrutores_d_1_02 Before INSERT ON instrutor
	FOR EACH ROW EXECUTE FUNCTION cria_instrutor_log_d_1_02();


-- Nesta aula:
--	* Entendemos o conceito de eventos no banco de dados
--	* Aprendemos como criar um Trigger Procedure
--	* Definimos um Trigger que executa uma Trigger Procedure quando um evento ocorre
--	* Entendemos a fundo detalhes de triggers como FOR EACH ROW|STATEMENT, etc























--