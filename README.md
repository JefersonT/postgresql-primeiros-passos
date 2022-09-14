# Formação SQL com PostgreSQL (Alura)
Esse projeto foi criado para anotar e praticar as atividade da **Formação SQL com PostgreSQL** presente na plataforma ***Alura***.

Aqui ficará disponível os scripts SQL de cada aula e no README terá as anotações e tópicos de cada aula.

Também estará disponível o aquivo docker-compose.yml que possibilita subir um servidor postgres através de docker.
## PostgreSQL
### 01. Pimeiros passos com PostgreSQL
Nesta aula, aprendemos:
- Como instalar o PostgreSQL e o pgAdmin
- Como conectar ao PostgreSQL, utilizando o terminal e o pgAdmin
- A criar o banco de dados pelo terminal e pelo pgAdmin
- Como apagar o banco de dados pelo terminal e pelo pgAdmin
- A criar tabela com os tipos de dados mais comuns:
    - SERIAL
    - VARCHAR
    - CHAR
    - TEXT
    - INTEGER
    - NUMERIC
    - BOOLEAN
    - DATE
    - TIME
    - TIMESTAMP

### 02. Executando operações CRUD
Nesta aula, aprendemos:
- Como incluir um registro na tabela, entendendo a sintaxe de inclusão de cada tipo de campo
- A efetuar uma consulta simples, para listar os dados da tabela
- Como alterar um registro na tabela
- Como excluir um registro na tabela

### 03. Consultas com filtros
Nesta aula, aprendemos:
- A selecionar campos específicos da tabela
- Como definir um alias para os nomes dos campos
- A filtrar registros, utilizando o `WHERE` para campos do tipo de texto
    - Operadores `=`, `!=`,`<>`, `LIKE` e `NOT LIKE`
    - A diferença entre `=` e `LIKE`
    - O funcionamento do caractere `%` no filtro com `LIKE` e `NOT LIKE`
    O-  funcionamento do caractere `_` no filtro com `LIKE` e `NOT LIKE`
- Como filtrar utilizando `IS NULL` e `IS NOT NULL`
- Como filtrar registros para campos do tipos relacionados a números, datas e horas
    - `=`, `!=`, `<>`, `<`, `<=`, `>`, `>=`
    - `BETWEEN`
- Como filtrar registros para campos do tipo *booleano*
    - `=`, `!=`, `<>`
- Como funciona os operadores lógicos `AND` e `OR`

### 4.Trabalhando com relacionamentos
Nesta aula, aprendemos:
- Como funciona a chave primária
- Como funciona os campos que aceitam `NULL` e que não aceitam `NULL` (`NOT NULL`)
- Como funciona um campo UNIQUE
- Como criar uma chave primária
- Como funciona a chave estrangeira
- Como criar uma chave estrangeira
- Como criar consultas com relacionamentos
    - `INNER JOIN`
    - `LEFT JOIN`
    - `RIGHT JOIN`
    - `FULL JOIN`
    - `CROSS JOIN`

### 5. Usando CASCADE
Nesta aula, aprendemos:
- Como funciona as restrições de chave estrangeira
- A diferença entre `RESTRICT` e `CASCADE`
- Como aplicar tipos diferentes de restrições de chave estrangeira no `DELETE`
    - `RESTRICT`
    - `CASCADE`
- A aplicar tipos diferentes de restrições de chave estrangeira no `UPDATE`
    - `RESTRICT`
    - `CASCADE`

### 6. Avançando com consultas
Nesta aula, aprendemos:
- Como ordenar uma consulta
  - Ordenar utilizando os nomes de campo
  - Ordenar com mais de um campo
  - Ordenar por posição do campo
  - Ordenar por ordem Crescente e Decrescente
  - Ordenar com campos de tabelas diferentes
- Como limitar quantidade e paginar registros de consulta
  - `LIMIT`
  - `OFFSET`
- Como funcionam as funções de agregação
  - `COUNT`
  - `SUM`
  - `MAX`
  - `MIN`
  - `AVG`
- Como funciona a função de arredondamento `ROUND`
- Como funciona o agrupamento de dados
  - A diferença entre `DISTINCT` e `GROUP BY`
  - Onde utilizar o `DISTINCT`
  - Onde utilizar o `GROUP BY`
  - Como utilizar o `GROUP BY` com os nomes de campo
  - Como utilizar o `GROUP BY` por posição
- Como funcionam os filtros por funções de agrupamento, utilizando `HAVING`
  - A diferença entre `WHERE` e `HAVING`
  - Como utilizar o `HAVING`

## PostgreSQL: Views, Sub-Consultas e Funções
### 01. Chaves estrangeiras e Tipos
Uma chave estrangeira sempre faz a referência entre o campo de uma tabela com um campo de outra tabela.

Para cada tipo de relacionamento, nós temos uma implementação diferente no banco de dados.

Para relacionamento do tipo muitos-para-muitos, nós precisamos criar uma tabela de junção, ou tabela de relacionamento.

Relacionamentos do tipo um-para-muitos ou um-para-um não precisam dessa tabela extra e possuem a chave estrangeira definida diretamente em uma das tabelas.

Para entender melhor os tipos de relacionamentos e estudar sobre cardinalidade você pode conferir os cursos de Modelagem SQL:

https://cursos.alura.com.br/course/modelagem-banco-relacional-entidade-relacionamento-atributo

O que aprendemos?
- Revisitamos e nos aprofundamos nos conceitos de chaves primarias e chaves estrangeiras;
- Falamos sobre os diferentes tipos de relacionamentos;
- Vimos na prática como implementar os relacionamentos um-para-um, um-para-muitos e muitos-para-muitos.


### 02. Praticando comandos
No processo de geração de relatórios completos, por precisarmos “passar” por diversas tabelas, às vezes acabamos nos perguntando: por onde começo?

O ideal é sempre começar pela tabela que possui a informação central do relatório, e a partir dela ir fazendo todos os relacionamentos com os JOINs corretos.

Claro, em futuros cursos você vai aprender sobre performance e com isso vai saber analisar se sua query está suficientemente performática ou não.

O que aprendemos?

- Revisamos os comandos de manipulação de dados (INSERT, UPDATE e DELETE);
- Vimos na prática como relatórios reais são montados;
- Exercitamos os conceitos de SELECTs, JOINs, etc.

### 03. Executando Sub-consultas
Como citado no vídeo, na maioria das ocasiões uma sub-query pode ser substituído pelo uso do HAVING.

Pense e monte a query equivalente a mostrada abaixo utilizando subquery:

    SELECT curso.nome,
            COUNT(aluno_curso.aluno_id) numero_alunos
        FROM curso
        JOIN aluno_curso ON aluno_curso.curso_id = curso.id
    GROUP BY 1
        HAVING COUNT(aluno_curso.aluno_id) > 2
    ORDER BY numero_alunos DESC;
        ;

O que aprendemos?
- Aprendemos a utilizar o operador IN;
- Conhecemos as sub-consultas;
- Vimos que sub-consultas podem ser utilizadas como um campo ou como uma "tabela virtual";

### 04. Usando funções
As Funções do PostgreSQL, são funcionalidades que nos permitem tratar diversos tipos de dados de diversas formas possíveis, como juntar strings, remover espaços, etc.

Não há melhor lugar para buscar conteúdo do que na documentação oficial da ferramenta.

Neste link você consegue ver todas as funções que o PostgreSQL fornece (não são poucas):

https://www.postgresql.org/docs/current/functions.html

O que aprendemos?
- Vimos o que mais diferencia um sistema de banco de dados de outros: funções;
- Aprendemos funções que manipulam diferentes tipos de dados;
  - Datas
  - Números
  - Strings
- Entendemos sobre conversão de tipos e vimos como realizá-las na prática.

### 05. Criando views
Via de regra, Views não afetam performance pois são um SELECT como qualquer outro. Mas em alguns casos onde precisamos manipular os dados da View (filtrar, agrupar, etc.) o impacto na performance é na verdade negativo ao invés de positivo.

Views podem facilitar a leitura de relatórios complexos. O uso de Views pode tornar relatórios complexos um pouco mais fáceis de ler.

Views nos permitem fornecer acesso limitado ao banco de dados.

O que aprendemos?
- Conhecemos o conceito de "tabelas virtuais" e visões, em inglês, views;
- Vimos na prática o processo de criação de views;
- Tratamos relatórios utilizando views;
- Falamos de pontos importantes sobre performance quando o assunto são Views;

## PostgreSQL: comandos DML e DDL
### 01. Modelagem de Dados
Embora nós falemos um pouco sobre modelagem de dados relacionais neste capítulo, esse assunto é muito mais complexo e justamente por isso há diversos cursos na plataforma sobre ele.

Você pode conferir neste link: https://www.alura.com.br/curso-online-modelagem-banco-relacional-entidade-relacionamento-atributo

Organizar (e separar) de forma lógica nossas tabelas. Uma analogia ao mundo da programação seriam os módulos, pacotes ou namespaces. Uma analogia ao mundo dos Sistemas Operacionais seriam as pastas. Schemas servem para organizar e separar nossas tabelas.

Para auxiliar na tarefa de modelagem de dados e levantamento de requisitos, existem ferramentas chamadas Ferramentas CASE (Computer-Aided Software Engineering).

Esse tipo de ferramenta nos ajuda a montar modelos visuais (diagramas), como:

Diagramas UML

Diagramas de classe

Diagramas de sequência

Diagramas de estado

Etc

Diagramas entidade-relacionamento

Fluxogramas Etc

Nos cursos de Modelagem de Banco de Dados Relacionais e nos cursos de UML esses diagramas são citados com muito mais detalhes, então lá você vai poder praticar o uso desse tipo de ferramenta.

O que aprendemos nessa aula:
- Conhecemos o conceito de modelagem de dados;
- Conhecemos sobre schemas no PostgreSQL que nos ajudam a organizar nossas tabelas;
- Conversamos sobre análise de requisitos e sobre modelos utilizados neste processo;

### 02. Estrutura do banco
Como foi visto na documentação, existem as restrições de tabela (Table Constraints) e as restrições de coluna (Column Constraints).

A diferença entre ambas é bem intuitiva.

Column Constraints se referem a restrições ou informações de uma única coluna. Ex.: Uma chave primária, um campo que deve ser único, um campo que não pode ser nulo, etc.

Table Constraints são informações ou restrições de mais de um campo. Ex.: Chave primária composta, índices compostos, etc.

Na documentação você pode ver todas as opções com muito mais detalhes: https://www.postgresql.org/docs/12/sql-createtable.html

PS.: Não se preocupe se você não entender todos os parâmetros. Com o tempo você vai adquirindo mais conhecimento.

Conferindo a documentação (https://www.postgresql.org/docs/12/sql-altertable.html) caso precise, monte o SQL necessário para adicionar uma coluna `nome`, que é um `VARCHAR(128)` na tabela `pessoa`.

O que aprendemos nessa aula:
- Desmembramos a criação de um banco de dados e aprofundamos esse conhecimento;
- Falamos sobre os detalhes ao criar uma tabela;
- Conhecemos o ALTER TABLE para alterar a estrutura de uma tabela;
- Vimos a diferença entre comandos DDL e DML.

### 03. Inclusão de Dados
O que aprendemos nessa aula:
- Entendemos as particularidades da representação de tipos e uso de aspas em SQL;
- Conhecemos o comando INSERT SELECT que realiza inserções a partir de uma consulta;
- Falamos sobre importação e exportação de dados em arquivos CSV.

### 04. Alteração de Dados
Assim como é possível fazer `INSERT` ou `UPDATE` a partir de um `SELECT` também podemos realizar junções para filtrar o que queremos excluir de nossas tabelas, mas a sintaxe é um pouco diferente.

Por exemplo, para excluir todos os cursos da categoria com nome “Teste”, podemos fazer:

    DELETE FROM curso
          USING categoria
          WHERE categoria.id = curso.categoria_id
            AND categoria.nome = 'Teste';

O uso de transações não é apenas para desfazer possíveis erros.

Na verdade, o principal uso de transações é a execução de comandos “dependentes” entre si.

Ex.:

  - Imagine que vamos realizar uma transferência bancária entre 2 contas. Imagine que a atualização do saldo na conta de origem funcione mas a atualização do saldo na conta de destino falhe. Isso seria um grande problema. Então nesse caso, os 2 comandos `UPDATE` estariam em uma única transação.

Para entender com mais detalhes esse conceito tão importante, vale a pena uma rápida leitura na documentação oficial: https://www.postgresql.org/docs/current/tutorial-transactions.html

O que aprendemos nessa aula:
- Conhecemos a sintaxe do UPDATE FROM, que atualiza uma tabela baseando-se em dados de uma consulta;
- Vimos os perigos de uma alteração ou remoção incorreta (sem WHERE, por exemplo);
- Aprendemos a trabalhar com transações;
- Vimos como confirmar ou cancelar uma transação.

### 05. Particularidades PostgreSQL
O PostgreSQL possui INÚMEROS tipos mais avançados além dos que já trabalhamos nos treinamentos até aqui.

Com o comando `CREATE TYPE` a gente apenas molhou nosso pé nesse oceano.

Para conferir um pouco mais sobre as possibilidades do comando `CREATE TYPE` você pode conferir a documentação: https://www.postgresql.org/docs/current/sql-createtype.html

Nesta URL você vai conferir algumas outras formas de criar um tipo personalizado, mas isso ainda nem chega perto de ser tudo que o PostgreSQL oferece sobre tipos.

Tipos geométricos (ponto, linha, polígono, círculo, etc.), arrays, JSON, localizações e muito mais tipos são fornecidos de forma nativa pelo PostgreSQL então vale a pena pesquisar mais sobre o assunto.

O que aprendemos nessa aula:
- Conhecemos as SEQUENCEs do PostgreSQL;
- Aprendemos o que é uma ENUM;
- Aprendemos a criar um tipo personalizado no banco de dados;
- Conversamos sobre como bancos de dados são utilizados na vida real.

## PostgreSQL: desenvolva com PL/pgSQL
### 01. Criando funções
SQL não é uma linguagem de programação e para permitir o uso de lógica de programação os bancos de dados estendem essa linguagem. Uma extensão feita pelo PostgreSQL é o que vamos aprender neste treinamento.

SQL é sim uma linguagem, mas não de programação. E ela não possui as estruturas necessárias para termos lógica de programação como estruturas de decisão repetição, variáveis, etc.

Não é possível programar usando somente SQL. Apenas SQL não nos fornece as estruturas necessárias para utilizarmos lógica de programação

Neste vídeo eu comentei que nós não poderíamos fazer `SELECT * FROM primeira_funcao();` pelo fato dela retornar um único valor, mas na verdade foi um erro de digitação onde eu me esqueci do `FROM`.

De qualquer forma, o comum nos casos onde a função nos devolve um único valor é utilizá-la como um valor, ou seja, trabalhar sem o `FROM`. Mas ainda assim, a chamada funcionaria utilizando a função como uma tabela (após o `FROM`).

Nós vamos ver vários exemplos que deixarão esse conceito mais claro durante o treinamento.

Por padrão, o nome da coluna retornada em uma função que nos entrega um único valor é o mesmo nome da função. Nós podemos facilmente mudar o nome dessa coluna utilizando o AS, que cria um alias.

Através de parâmetros nós podemos receber informações de fora da função (como o ID de um registro, por exemplo) e manipular estes dados dentro da função

Nós não podemos alterar uma função informando tipos diferentes em seus parâmetros ou retornos. Para atingir este objetivo precisamos excluir e criar esta função. Reflita sobre o motivo dessa restrição.

Após realizar todas as instruções, a última query tem seu resultado obtido pelo PostgreSQL, e desse resultado, a primeira linha é retornada para quem chamou a função.

Existe um outro conceito, muito similar às funções, chamado de `PROCEDUREs`.

Uma Procedure no PostgreSQL é exatamente igual a uma função tendo como diferença o fato de que não retorna nenhum valor.

Como não há retorno em Procedures, não podemos chamá-lo como parte de um comando SQL (como temos feito com funções, chamando-as como parte do `SELECT`). No lugar disso, utilizamos `CALL nome_do_procedure` para executar uma Procedure.

Tudo que for ensinado nesse treinamento sobre lógicas de execução se aplica a procedure, se atentando à diferença de que não há retorno.

Para saber mais, aqui tem a documentação oficial (que é bem curtinha) deste conceito: https://www.postgresql.org/docs/current/xproc.html

Além de utilizar o `SELECT`, em SQL utilizando PostgreSQL é também possível recuperar dados após inserir ou atualizar um registro.

Isso se dá através da instrução `RETURNING`: https://www.postgresql.org/docs/current/dml-returning.html

Os valores do registro manipulado poderão ser exibidos exatamente da mesma forma como seriam exibidos se fizéssemos um `SELECT` filtrando por este registro específico.

Confira o link acima para ver a documentação oficial. Neste treinamento nós faremos uso desta feature.

O que aprendemos nessa aula:
- Começamos falando sobre o propósito de programar diretamente no banco de dados;
- Conhecemos o conceito de funções no PostgreSQL;
- Entendemos sobre tipos em
  - Parâmetros
  - Retornos de funções
- Falamos sobre como retornar valores em funções escritas em SQL.

### 02. Tipos e funções

Neste vídeo, pela primeira vez, trabalhos com tipos compostos em nossas funções. Nossa função agora recebe um registro da tabela `instrutor`.

Nós fizemos com que o PostgreSQL passasse todos os valores para a função através da sintaxe `instrutor.*`, mas se eu fizesse simplesmente `instrutor`, sem o `.*`, também funcionaria.

Eu tendo a deixar o código mais explícito possível e com o `.*` eu estou deixando mais claro o que estou fazendo: passando TODOS os dados deste registro.

Neste vídeo nós aprendemos sobre os famigerados parâmetros de saída.

Em PostgreSQL seu uso é pouco comum pelo fato de nós termos formas mais legíveis de atingir o mesmo resultado, mas alguns outros sistema de bancos de dados fornecem apenas essa forma de retornar valores.

É importante sabemos como cada ferramenta nos ajuda a resolver determinados problemas, assim no momento em que nos depararmos com um problema real, já saberemos qual ferramenta usar.

O que aprendemos nessa aula:

- Entendemos que podemos trabalhar com tipos "compostos";
- Vimos que podemos representar tipos compostos de diversas formas
  - Definindo seu valor como o registro de uma tabela
  - Como um tipo personalizado do PostgreSQL
  - Com variáveis de saída
- Entendemos como retornar mais de um dado por vez em nossas funções através do SETOF
- Conhecemos um dos possíveis usos para o tipo RECORD.

### 03. Linguagem Procedural
SQL não é uma linguagem de programação, logo, não nos permite executar lógicas, tomar decisões, repetir ações, etc.

Vimos que há 3 formas de definir o valor padrão de uma variável ao declará-la:

1. `DEFAULT`
2. `:=`
3. `=`

Agora um detalhe importante de se citar é que no corpo da função, ou seja, entre os blocos `BEGIN` e `END` nós não podemos utilizar o `DEFAULT` para atribuir (ou modificar) o valor de uma variável. Apenas as 2 últimas opções são possíveis.

Sendo assim, o `DEFAULT` pode ser utilizado apenas dentro do bloco `DECLARE` para informar o valor padrão de uma variável.

O que aprendemos nessa aula:
- Entendemos as limitações do SQL quando se trata de programação;
- Conhecemos a linguagem PLpgSQL, que é uma linguagem de Programação Procedural criada pelo PostgreSQL como uma extensão ao SQL;
- Aprendemos sobre a estrutura básica de criação de uma função usando PLpgSQL;
- Aprendemos a definir variáveis;
- Entendemos o conceito de blocos e escopos usando PLpgSQL.


### 04. Estruturas de Controle
Já vimos como funciona o básico do `SELECT INTO`, mas só para você exercitar e ver de forma mais completa, recomendo passar o olho pela documentação dessa parte do PLpgSQL:

https://www.postgresql.org/docs/current/plpgsql-statements.html#PLPGSQL-STATEMENTS-SQL-ONEROW

Caso fique alguma dúvida sobre essa instrução, não hesite em usar o fórum.

Um bloco IF não precisa necessariamente ser acompanhado por `ELSE` ou `ELSEIF`. Inclusive é bastante comum na programação termos somente o `IF`. Aqui você pode conferir a sintaxe: https://www.postgresql.org/docs/current/plpgsql-control-structures.html#PLPGSQL-CONDITIONALS

Se nós precisaríamos de muito blocos `ELSEIF`, normalmente podemos trocar um `CASE`. Se a comparação for de igualdade, usamos o `CASE` simples. Senão, podemos usar o *Searched case*. Dá uma olhada aqui pra mais detalhes: https://www.postgresql.org/docs/current/plpgsql-control-structures.html#id-1.8.8.8.6.6

O que aprendemos nessa aula:
- Vimos como retornar valores utilizando PLpgSQL;
- Aprendemos a tomar decisões em nossos códigos usando `IF`;
- Conseguimos controlar o fluxo de nossa aplicação com `ELSEIF` e `ELSE`;
- Aprendemos a deixar nosso código um pouco mais legível com `CASE`.

### 05. Estruturas de repetição
Neste vídeo nós aprendemos uma nova forma de retornar valores com PLpgSQL: `RETURN NEXT`

Essa instrução é utilizada quando precisamos retornar múltiplas linhas de uma função PLpgSQL mas não temos uma query para isso (senão poderíamos utilizar o `RETURN QUERY`).

Se você quiser ler com mais detalhes sobre as formas de retornar em uma função, dá uma olhada aqui: https://www.postgresql.org/docs/current/plpgsql-control-structures.html#PLPGSQL-STATEMENTS-RETURNING

O WHILE já nos permite definir explicitamente a condição de saída. Sem o WHILE nós precisamos, dentro do loop, executar a instrução EXIT para verificar a condição de saída.

Estruturas de repetição (do inglês, loops) são muito utilizadas na programação para percorrer listas de valores.

Sejam vetores de informações, registros de tabelas, sequências pré-definidas… Em cada caso vamos analisar qual a estrutura ideal de repetição para aplicar.

Para ler com mais detalhes sobre cada uma das estruturas aprendidas neste capítulo, recomendo fortemente a leitura desse link: https://www.postgresql.org/docs/current/plpgsql-control-structures.html#PLPGSQL-CONTROL-STRUCTURES-LOOPS

O que aprendemos nessa aula:
- Vimos mais uma forma de retornar valores através do `RETURN NEXT`;
- Entendemos a necessidade de realizar operações "repetidas" em determinadas funções;
- Aprendemos a usar a estrutura `LOOP` para repetir instruções;
- Usamos `EXIT` para não cairmos em um "loop infinito";
- Conhecemos a estrutura `WHILE` para facilitar a leitura do LOOP sem precisar do `EXIT`;
- Aprendemos a usar (e quando usar) o famoso `FOR`;
- Vimos como percorrer o resultado de uma query usando `FOR IN`.

### 06. Mão na massa 
Esta variável `FOUND` é definida automaticamente em toda função em PLpgSQL e começa como `FALSE`. Nesse link você confere em que situações ela será definida como `TRUE`: https://www.postgresql.org/docs/current/plpgsql-statements.html#PLPGSQL-STATEMENTS-DIAGNOSTICS

Depois de um denso capítulo de exercícios, vou deixar aqui uma “curiosidade” para você se aprofundar nesse mundo de PLpgSQL.

Em raros momentos, podemos querer montar uma string contendo uma query a ser executada e armazenar essa string em uma variável.

Se nós tivermos uma string contendo uma query válida, podemos executar essa query através do comando `EXECUTE` da linguagem PLpgSQL.

Para ver exemplos e ler sobre mais detalhes, dá uma olhada aqui: https://www.postgresql.org/docs/current/plpgsql-statements.html#PLPGSQL-STATEMENTS-EXECUTING-DYN

Mais uma vez, caso essa instrução `EXECUTE` não fique clara, não hesite em abrir uma dúvida no fórum.

O que aprendemos nessa aula:
- Criamos funções mais próximas da vida real;
- Aprendemos sobre a variável automaticamente criada em funções com PLpgSQL chamada `FOUND`;
- Conseguimos realizar logs de operações feitas no banco de dados;
- Aprendemos a realizar cálculos com conversões de tipos usando PLpgSQL.


## PostgreSQL: Triggers, transações, erros e cursores
### 01. Triggers
Um trigger deve ser criado quando uma função precisar ser executada sempre que determinado evento ocorrer, por exemplo, sempre que um instrutor for inserido.

Uma Trigger Procedure tem como seu retorno o tipo especial `TRIGGER`. Isso define que essa função vai ser usada em algum trigger e ativa algumas verificações do PostgreSQL. 

Já entendemos como criar uma função e defini-la para ser executada automaticamente através de um *Trigger*.

Mas antes de entrar em detalhes sobre os Triggers em si, vamos passar por algumas particularidades do comando `CREATE TRIGGER`

Existe a possibilidade da gente definir um trigger usando a sintaxe `EXECUTE PROCEDURE` ao invés de `EXECUTE FUNCTION`. Isso existe por razões históricas e não faz diferença nenhuma na prática.

*Trigger Procedures* são sempre funções pois precisam definir um tipo de retorno (`TRIGGER`).

Se você quiser ler mais sobre essa particularidade e algumas outras da sintaxe da criação de um trigger, pode conferir esse link da documentação:

https://www.postgresql.org/docs/current/sql-createtrigger.html

Nesta aula:
- Entendemos o conceito de eventos no banco de dados
- Aprendemos como criar um Trigger Procedure
- Definimos um Trigger que executa uma Trigger Procedure quando um evento ocorre
- Entendemos a fundo detalhes de triggers como `FOR EACH ROW|STATEMENT`, etc

### 02. Gerenciamento de transações
Uma PL já está por padrão dentro de uma transação. Se for chamada em um código SQL, ela fará parte da mesma transação que aquele código. Se for chamada automaticamente por um trigger, ela fará parte da transação da instrução que gerou esse trigger.

Se um erro for gerado na PL, a transação a qual ela pertence será cancelada.

Nesta aula:
- Vimos que há 2 sintaxes para iniciar uma transação: `BEGIN` e `START TRANSACTION`
- Entendemos que funções por si só já fazem parte de uma transação
- Aprendemos que erros cancelam as alterações de uma função

### 03. Erros e exceções
Caso nós quiséssemos que apenas parte do código fosse “cancelado” no caso de um erro, poderíamos separar nossa função em diversos blocos, como vimos no início do treinamento inicial.

Cada bloco pode tratar suas exceções de forma individual. Então se quiséssemos tratar a exceção do segundo `INSERT` e não cancelar a execução do primeiro, bastaria rodear esse segundo `INSERT` em um bloco `BEGIN - EXCEPTION - END`

A severidade EXCEPTION gera um erro e interrompe a execução (desde que não haja um bloco EXCEPTION para tratá-la)

As severidades DEBUG, LOG, INFO, NOTICE, WARNING não geram erros. Apenas geram mensagens de log.

Nem todas as mensagens são exibidas. Por padrão, as mensagens de severidade `DEBUG` e `LOG` não são exibidas, conforme a documentação: https://www.postgresql.org/docs/current/runtime-config-client.html#GUC-CLIENT-MIN-MESSAGES

Para cada caractere `%` que adicionarmos no formato da mensagem, ou seja, na string que definimos com o `RAISE`, precisamos informar um outro parâmetro que será o valor que vai ocupar o espaço desse `%`.

Nesta aula:
- Aprendemos o que são os erros (ou exceções) do PostgreSQL
- Aprendemos a gerar erros e mensagens com o `RAISE`
- Aprendemos a usar o `ASSERT` que verifica condições e levanta exceções
- Entedemos que o `RAISE` pode ser usado no processo de depuração

### 04. Cursores
Se precisamos retornar um resultado muito grande, cursores podem ajudar a poupar a quantidade de memória alocada pois o PostgreSQL não alocará na memória o resultado todo, mas sim apenas o suficiente para executar a query futuramente e pegar uma linha por vez. Um detalhe importante é que o `FOR` faz isso automaticamente, ou seja, apenas um salário por vez está sendo alocado em nossa query hoje.

Pelo cenário descrito, de criar uma PL que retornar vários instrutores, poderíamos simplesmente usar o `RETURN QUERY` e não precisaríamos conhecer cursores.

O problema é que, segundo a própria documentação do PostgreSQL, atualmente TODO o resultado da query é alocado em memória quando utilizamos essa instrução. Então se temos milhões de instrutores, nós vamos gerar um desperdício absurdo de memória.

A documentação ainda diz que provavelmente no futuro isso será diferente, mas vamos trabalhar com o que temos hoje, certo?

Trecho extraído da documentação:

    The current implementation of RETURN NEXT and RETURN QUERY stores the entire result set before returning from the function, as discussed above. That means that if a PL/pgSQL function produces a very large result set, performance might be poor: data will be written to disk to avoid memory exhaustion, but the function itself will not return until the entire result set has been generated. A future version of PL/pgSQL might allow users to define set-returning functions that do not have this limitation. Currently, the point at which data begins being written to disk is controlled by the work_mem configuration variable. Administrators who have sufficient memory to store larger result sets in memory should consider increasing this parameter.

Dessa URL: https://www.postgresql.org/docs/current/plpgsql-control-structures.html

`FETCH` além de mover o “ponteiro” do cursor, devolve o valor após mover. O `MOVE` apenas move o “ponteiro” sem devolver nenhum valor

Alternativa correta! Essa é a diferença entre ambos os comandos. Para mais detalhes: https://www.postgresql.org/docs/current/plpgsql-cursors.html#PLPGSQL-CURSOR-USING

Nesta aula:
- Entendemos o propósito de usar cursores, para poupar uso de memória
- Vimos como abrir cursores, sendo eles bound ou unbound
- Vimos como manipular cursores com `FETCH` e `MOVE`
- Usamos cursores na prática em um `LOOP`

### 05. Processo de desenvolvimento
Vimos nesse vídeo que o `DO` declara um bloco de código sem retorno. Para recuperar o resultado que precisávamos, utilizamos a funcionalidade de mensagens com o `RAISE`.

Se for necessário executar um script pontual que gere um relatório mais completo, podemos dentro desse bloco criar uma tabela temporária, preenchê-la com os dados do relatório, e após executar o script, fazer um simples `SELECT` na tabela temporária.

Uma das boas práticas sugeridas no vídeo foi utilizar *Early Return*.

Aqui você pode conferir uma explicação bem sucinta dessa técnica: https://www.alura.com.br/artigos/quanto-mais-simples-melhor

O ideal é estudar bastante sobre programação e com isso aprenderemos no caminho diversas técnicas para deixar nosso código o mais legível possível.

Nesta aula:
- Aprendemos a usar blocos anônimos com DO
- Vimos que blocos anônimos possuem 2 principais propósitos
  - Rodar um script pontual em PLpgSQL
  - Preparar uma função para efetivamente criá-la no futuro
- Entendemos que boas práticas de programação são muito importantes
- Conhecemos algumas outras ferramentas além do PgAdmin como DataGrip e EMS

## PostgreSQL: Administração e otimização do banco
### 01. Papael do DBA
O DBA é responsável por garantir que apenas quem precisa terá acesso ao servidor
O DBA precisa conhecer bem o sistema operacional onde ele trabalha e gerenciá-lo

Um dos usos mais comuns de bancos de dados é armazenar as informações manipuladas por sistemas que programadores(as) criam.

Você já deve ter entendido isso, mas apenas para ressaltar, os programas que desenvolvedores criam e que acessam o banco de dados também são clientes. Se vários usuários acessarem o sistema, por exemplo, teremos várias conexões sendo feitas com o banco de dados.

    $ docker run --rm --name banco -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=alura -p 5432:5432 postgres

Entre no docker criado em um segundo terminal:

    $ docker exec -it banco bash

Dentro do container, mude para o usuário `postgres`:

    $ su postgres

Nesta aula:
- Entendemos qual o papel do DBA em uma empresa
- Conhecemos o modelo cliente-servidor em que os bancos de dados funcionam
- Vimos que o servidor pode receber conexões de diversos clientes


### 02. Servidor Postgre
Um Cluster PostgreSQL inicializado pelo comando initdb nada mais é do que o local onde o PostgreSQl vai armazenar os arquivos necessários para representar o esquema e seus dados.
**Inicializando um espaço:**

    $ initdb -D /user/local/pgsql/data

**Subindo um servidor:**

    $ postgres -D /user/local/pgsql/data

ou para armazenar o log em um arquivo especifico registrando os erros também no arquivo, tudo em background:

    $ postgres -D /user/local/pgsql/data >logfile 2>&1 &

**Utilitário para controlar os processo do pgsql:**
Para iniciar o servidor e especificar o arquivo de log:

    $ pg_clt start -l logfile
Para saber mais opções:

    $ pg_clt --help

**Derrubando servidor:**
    
    $ pg_clt stop

O utilitário `pg_ctl` é um dos melhores amigos do DBA PostgreSQL. Ele facilita (e muito) a gestão do serviço postgres que fica rodando para receber conexões no servidor.

Através desse utilitários nós podemos fazer muita coisa com menos conhecimento sobre o sistema operacional, já que esse utilitário abstrai diversas complexidades para nós.

Mas é válido dizer que via de regra, tudo que pode ser feito com o pg_ctl pode ser feito sem ele através do serviço postgres e com conhecimentos de gestão de sistemas operacionais.

Vimos neste vídeo que o usuário logado no sistema operacional para executar comandos pg_ctl não pode ser o root.

Ao não permitir o seu uso como root, o pg_ctl se “autolimita” garantindo que ele não terá a coisas que não deveria. Isso é uma camada a mais de segurança ao seu servidor.

Se estivermos sofrendo um ataque ao servidor postgres, faz sentido derrubá-lo (caso seja possível e não impeça o uso de alguma parte crítica da aplicação) para que os atacantes não tenham mais por onde entrar até que a falha seja investigada e corrigida.

Se vamos fazer manutenções físicas, por exemplo, precisamos desligar o servidor. Nesse caso o ideal é interromper o serviço do PostgreSQL para garantir que nada será perdido.


Nesta aula:
- Entendemos o que é um cluster do PostgreSQL
- Aprendemos a inicializar um cluster com o comando initdb
- Entendemos como gerenciar o serviço do servidor PostgreSQL
- Conhecemos o utilitário `pg_ctl`

### 3. Tuning de banco

Acessando o postgres pelo terminal:

    $ cd /var/lib/postgresql/data/
    $ ls
    $ cat postgresql.conf | grep -v '#' | grep -ve '^$'
    $ vi postgresql.conf
Adiciona as seguinte linhas e salve:

    # Add settings for extensions here
    log_connections=yes
    log_destination=stderr
    shared_buffers=4GB

Subir novamente o servidor

    $ pg_ctl -D /var/lib/postgresql/data/-l /tmp/pg.log start



O número de configurações possíveis no PostgreSQL é ENORME. Podemos configurar muitas coisas e esse treinamento duraria anos se fôssemos falar de todas as possibilidades.

A experiência vai te mostrar quais as configurações mais importantes. Conforme você lê e testa algumas configurações, vai entender seu valor e saber sua aplicação.

Mas uma ótima fonte de referência e conhecimento é a documentação oficial então vale MUITO a pena conferir a parte de configurações dela:

https://www.postgresql.org/docs/current/config-setting.html

Comando para verificar o status de todos os servisos:

    $ service --status-all

Como já foi citado várias vezes, conhecer (BEM) o sistema operacional é tarefa de quem vai administrar o banco de dados, então por isso a melhor sugestão que posso te fazer nesse ponto do curso é: Faça os treinamentos de sistemas operacionais aqui da Alura.

- Cursos de Linux: https://cursos.alura.com.br/category/devops/linux-comandos-e-processos
- Cursos de Windows: https://cursos.alura.com.br/category/devops/windows

Nesta aula:
- Conversamos sobre Tuning do banco de dados
- Entendemos que a escolha do hardware do servidor é importante, mas que serviços de nuvem abstraem esse detalhe para os DBAs
- Conhecemos a pasta data do PostgreSQL onde encontramos o arquivo de configurações
- Falamos sobre o papel do DBA na gestão do sistema operacional

### 4. Processos de Manutenção
O `VACUUM` apenas limpa as “tuplas mortas”. O `VACUUM FULL` também compacta os registros para poupar ainda mais espaço. O `VACUUM ANALYSE` além de limpar as “tuplas mortas”, também analisa as tabelas para atualizar as estatísticas do planejador de queries

Cada comando deve ser utilizado em momentos diferentes. O `VACUUM` normalmente só é utilizado quando o `autovacuum` por algum motivo não fizer seu trabalho. Já o `VACUUM FULL` é utilizado quando temos muito desperdício de espaço. Normalmente quando a maioria dos registros de uma tabela já foram excluídos ou alterados. Agora o `ANALYSE` é um comando a parte. Então o `VACUUM` faz seu trabalho e depois chama esse outro comando para que ele possa analisar a estrutura e os dados das tabelas e atualizar as estatísticas para o planejador de query.

Nesta aula:
- Vimos que há processos de manutenção que podemos / devemos fazer no banco
- Aprendemos como o PostgreSQL mantém alguns dados “inúteis” por questão de performance
- Conhecemos o comando VACUUM para limpar espaço em disco
- Vimos como reindexar as tabelas do banco com o comando REINDEX

### 5. Backup e restauração

Um ***backup frio*** é quando derrubo meu servidor de Postgre, ou seja, ninguém mais se conecta lá, e a partir desse banco de dados offline faço meu backup.E por que isso é feito? 
  - Porque dessa forma não tenho nenhuma conexão sendo feita, ninguém está atualizando nenhum dado no banco, tenho essa segurança a mais. Mas a desvantagem é que tenho um serviço fora do ar durante o processo de backup. Isso é uma desvantagem.

Já o ***backup morno ou quente*** também existe uma diferença pequena entre esses dois, não vou entrar nesse mérito, mas esse tipo de backup o servidor está ativo, recebendo conexões, e nesse meio tempo, enquanto conexões vão chegando faço meu backup. A vantagem é que meu serviço de banco de dados não vai sair do ar, ele vai continuar acessível, mas a desvantagem é que posso acabar fazendo o backup de um dado que vai ser modificado na hora, que está sendo modificado ali.

E temos outra divisão, que é entre ***backups lógicos*** e ***backups físicos***. Existe backup físico de verdade, que é você clonar um hd inteiro, você remove o hd de uma máquina, clona ele para outro hd ou ssd que vai ser uma cópia física fiel, existe essa possibilidade, mas não é esse tipo de backup físico que estou comentando aqui.

O ***backup lógico*** vai trazer apenas a estrutura e os dados do banco, enquanto o ***backup físico*** vai trazer todas as informações do banco, incluindo estatísticas, logs, etc.

Nesta aula:

- Entendemos que há diferentes tipos de backup e conversamos sobre como fazê-los
- Vimos que há 2 principais formas de fazer backups
  - Através da linha de comando (usando pg_dump)
  - Através de interfaces gráficas (por exemplo, usando o PgAdmin)
- Aprendemos como restaurar backups realizados também de 2 formas diferentes

### 6. Planejamento de queries

O comando `EXPLAIN` é um dos melhores amigos do DBA então é muito importante entendê-lo a fundo. A ideia do treinamento é te apresentar o conceito, então para se aprofundar, a documentação é o melhor lugar.

Vou deixar aqui 2 links. O primeiro é sobre o uso em si do `EXPLAIN`: https://www.postgresql.org/docs/current/using-explain.html

Nesse link você tem uma ótima explicação de como interpretar o que o `EXPLAIN` tem para te dizer.

O segundo é sobre a sintaxe do `EXPLAIN`: https://www.postgresql.org/docs/current/sql-explain.html

Existem algumas opções que podemos passar para o comando, então vale a pena consultar.

Nesta aula:

- Conhecemos o conceito do planejador de queries (Query Planner) do PostgreSQL
- Aprendemos que o comando EXPLAIN pode nos dar informações sobre como uma query é executada
- Aprendemos o que são e como utilizar índices
- Vimos que apesar de serem uma ferramenta muito poderosa, índices nem sempre são a solução

### 7. Usuários e permissões
Liberar acesso configurando o arquivo `pg_hba.conf`:

    $ vim /var/lib/postgresql/data/pg_hba.conf

Adicione as seguintes linhas no final:

    # TYPE  DATABASE  USER        ADDRESS         METHOD
    host    alura     postgres    172.17.0.3/32   trust

  *O IP deve ser substituido pelo seu ip.*

Em seguida reiniciar o servidor:

    $ pg_ctl restart

Se conectar ao banco:

    $ psql --host=172.17.0.2 --username=postgres -w alura



Como diversos outros processos, criar um usuário não é possível apenas através de SQL, mas também através de comandos na CLI.

O comando `createuser` pode ser executado diretamente no servidor para criar novos usuários.

Para saber mais: https://www.postgresql.org/docs/current/app-createuser.html

Um `SUPERUSER` basicamente pode fazer tudo no banco de dados. Pode criar novos usuários, definir senhas, criar novos bancos, etc. A recomendação é que você só faça login com um `SUPERUSER` quando for explicitamente necessário, e que os usuários fornecidos para clientes externos **JAMAIS** tenham esse atributo.

Nesta aula:

- Vimos como permitir ou impedir o acesso ao servidor a partir de algum host
- Conhecemos o arquivo pg_hba.conf que permite a configuração de acesso ao servidor baseado em hosts
- Vimos que o PostgreSQL trabalha com um conceito de ROLES, que podem ser como usuários ou grupos
- Aprendemos sobre os atributos dos ROLES
- Entendemos que é possível dar ou retirar permissões específicas a ROLES

