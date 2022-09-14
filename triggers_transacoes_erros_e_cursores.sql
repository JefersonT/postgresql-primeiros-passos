-- PostgreSQL: Triggers, transações, erros e cursores
-- 01. Triggers (Gatilho)
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

-- DESAFIO 01.01 --------------------------------------------------
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

drop trigger cria_log_instrutores on instrutor;

CREATE TRIGGER cria_log_instrutores Before INSERT ON instrutor
	FOR EACH ROW EXECUTE FUNCTION cria_instrutor_log();




-- DESAFIO 01.02-------------------------------------------------------
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

drop trigger cria_log_instrutores on instrutor;

CREATE TRIGGER cria_log_instrutores_d_1_02 Before INSERT ON instrutor
	FOR EACH ROW EXECUTE FUNCTION cria_instrutor_log();


-- 02. Gerenciamento de transações
-- Causando erro
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
   
    insert into log_instrutores (informacao, teste)-- não existe teste, só é notado ao executar o insert
   			values (NEW.nome || ' recebe mais do que ' || percentual || '% da grade de instrutores');
   		RETURN NEW;	
   
  end;
$$ language plpgsql;

CREATE TRIGGER cria_log_instrutores Before INSERT ON instrutor
	FOR EACH ROW EXECUTE FUNCTION cria_instrutor_log();

insert into instrutor (nome, salario) values ('Sasuke', 1000);

-- 03. Erros e exceções
-- Tratando erro com EXCEPTION
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
   
    insert into log_instrutores (informacao, teste)-- não existe teste, só é notado ao executar o insert
   			values (NEW.nome || ' recebe mais do que ' || percentual || '% da grade de instrutores');
   		RETURN NEW;
   	
   exception
   	when undefined_column then
   		return new;
  end;
$$ language plpgsql;

insert into instrutor (nome, salario) values ('Sasuke', 1000);


--Caso nós quiséssemos que apenas parte do código fosse “cancelado” no caso de um erro, 
--poderíamos separar nossa função em diversos blocos, como vimos no início do treinamento inicial.
--
--Cada bloco pode tratar suas exceções de forma individual. Então se quiséssemos tratar a exceção 
--do segundo INSERT e não cancelar a execução do primeiro, bastaria rodear esse segundo INSERT em um bloco BEGIN - EXCEPTION - END

-- Exibindo mensagem
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
   
    insert into log_instrutores (informacao, teste)-- não existe teste, só é notado ao executar o insert
   			values (NEW.nome || ' recebe mais do que ' || percentual || '% da grade de instrutores');
   		RETURN NEW;
   	
   exception
   	when undefined_column then
   		raise notice 'Algo de errado não esta certo!';
   		raise exception 'Erro complicado de resolver';
  end;
$$ language plpgsql;

insert into instrutor (nome, salario) values ('Sakura', 20000);


--As severidades DEBUG, LOG, INFO, NOTICE, WARNING não geram erros. Apenas geram mensagens de log.
--
--Nem todas as mensagens são exibidas. Por padrão, as mensagens de severidade DEBUG e LOG não são exibidas, 
--conforme a documentação: https://www.postgresql.org/docs/current/runtime-config-client.html#GUC-CLIENT-MIN-MESSAGES
--
--A severidade EXCEPTION gera um erro e interrompe a execução (desde que não haja um bloco EXCEPTION para tratá-la)


-- Verificando condições
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
   	ASSERT percentual < 100::decimal;
   
    insert into log_instrutores (informacao, teste)-- não existe teste, só é notado ao executar o insert
   			values (NEW.nome || ' recebe mais do que ' || percentual || '% da grade de instrutores');
   		RETURN NEW;
   	
  end;
$$ language plpgsql;

-- Verificando condições, com mensagem
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
   	ASSERT percentual < 100::decimal, 'Erro recebe mais que todos os funcionário!';
   
    insert into log_instrutores (informacao, teste)-- não existe teste, só é notado ao executar o insert
   			values (NEW.nome || ' recebe mais do que ' || percentual || '% da grade de instrutores');
   		RETURN NEW;
   	
  end;
$$ language plpgsql;

--	Para cada caractere % que adicionarmos no formato da mensagem, ou seja, na string que definimos com o RAISE, 
--	precisamos informar um outro parâmetro que será o valor que vai ocupar o espaço desse %.

-- 04. Cursores
-- Se precisamos retornar um resultado muito grande, cursores podem ajudar a poupar a quantidade de memória alocada pois o PostgreSQL
-- não alocará na memória o resultado todo, mas sim apenas o suficiente para executar a query futuramente e pegar uma linha por vez.
-- Um detalhe importante é que o FOR faz isso automaticamente, ou seja, apenas um salário por vez está sendo alocado em nossa query hoje.

create function instrutores_internos(id_instrutor integer) returns refcursor as $$
	declare
--	salari decimal;
	-- forma 01
	cursor_salario refcursor;
	-- forma 02
--	cursor_salario refcursor for select instrutor.salario
--									from instrutor 
--									where id <> id_instrutor 
--										and salario > 0;
	begin
		-- forma 01
		open cursor_salario for select instrutor.salario from instrutor where id <> id_instrutor and salario > 0;
		-- forma 02
--		open cursor_salario;
		
		-- percorrendo cursor
		fetch cursor_salario into salario;
--		fetch last from cursor_salario into salario; -- valor anterior
--		fetch next from cursor_salario into salario; -- proximo valor
--		fetch prior from cursor_salario into salario; --
--		fetch first from cursor_salario into salario; -- primeiro valor
		
		-- Mover o cursor
--		fetch last from cursor_salario;
--		fetch next from cursor_salario;
--		fetch prior from cursor_salario;
--		fetch first from cursor_salario; 
		
		-- fechar o cursor
--		close cursor_salario;
		
		-- retornando o cursor
		return cursor_salario;
	end
	
$$ language plpgsql;


create function instrutores_internos(id_instrutor integer) returns refcursor as $$
	declare
		cursor_salario refcursor;
	begin
		open cursor_salario for select instrutor.salario from instrutor where id <> id_instrutor and salario > 0;

		return cursor_salario;
	end;
$$ language plpgsql;

create or replace function cria_instrutor_log() returns trigger as $$
  declare
    media_salarial decimal;
    instrutores_recebem_menos integer default 0;
    total_instrutores integer default 0;
    salario decimal;
    percentual decimal;
    cursor_salario refcursor;
  begin
	select avg (instrutor.salario) into media_salarial from instrutor;
  	
    if NEW.salario > media_salarial then
      insert into log_instrutores (informacao) values (NEW.nome || ' recebe acima da média');
    end if;
   
   select instrutores_internos(new.id) into cursor_salario;
    loop
	    fetch cursor_salario into salario;
	   	exit when not found;
	   
    	total_instrutores := total_instrutores + 1;
        if NEW.salario > salario then
          instrutores_recebem_menos := instrutores_recebem_menos + 1;
        end if;
    end loop;
   
    percentual := instrutores_recebem_menos::decimal / total_instrutores::decimal * 100;
   	ASSERT percentual < 100::decimal, 'Erro recebe mais que todos os funcionário!';
   
    insert into log_instrutores (informacao, teste)-- não existe teste, só é notado ao executar o insert
   			values (NEW.nome || ' recebe mais do que ' || percentual || '% da grade de instrutores');
   		RETURN NEW;
   	
  end;
$$ language plpgsql;


-- 5. Processo de desenvolvimento

do $$
	declare
		cursor_salario refcursor;
		salario decimal;
		total_instrutores integer default 0;
		instrutores_recebem_menos integer default 0;
		percentual decimal(5, 2);
	begin
		select instrutores_internos(3) into cursor_salario;
    loop
	    fetch cursor_salario into salario;
	   	exit when not found;
	   
    	total_instrutores := total_instrutores + 1;
        if 400::decimal > salario then
          instrutores_recebem_menos := instrutores_recebem_menos + 1;
        end if;
    end loop;
   	percentual := instrutores_recebem_menos::decimal / total_instrutores::decimal * 100;
   
   	raise notice 'Percentual: % %%', percentual;
	end;
	
$$;