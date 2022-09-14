# postgresql-primeiros-passos
Aprendendo PostgreSQL
alura

## PostgreSQL: Administração e otimização do banco
### 01. Papael do DBA
O DBA é responsável por garantir que apenas quem precisa terá acesso ao servidor
O DBA precisa conhecer bem o sistema operacional onde ele trabalha e gerenciá-lo

Um dos usos mais comuns de bancos de dados é armazenar as informações manipuladas por sistemas que programadores(as) criam.

Você já deve ter entendido isso, mas apenas para ressaltar, os programas que desenvolvedores criam e que acessam o banco de dados também são clientes. Se vários usuários acessarem o sistema, por exemplo, teremos várias conexões sendo feitas com o banco de dados.

Nesta aula:
- Entendemos qual o papel do DBA em uma empresa
- Conhecemos o modelo cliente-servidor em que os bancos de dados funcionam
- Vimos que o servidor pode receber conexões de diversos clientes


### 02. Servidor Postgre
Um Cluster PostgreSQL inicializado pelo comando initdb nada mais é do que o local onde o PostgreSQl vai armazenar os arquivos necessários para representar o esquema e seus dados.
**Inicializando um espaço:**

`$ initdb -D /user/local/pgsql/data`

**Subindo um servidor:**

`$ postgres -D /user/local/pgsql/data`

ou

`$ postgres -D /user/local/pgsql/data >logfile 2>&1 &`

**Utilitário para controlar os processo do pgsql:**

`pg_clt start -l logfile`

`pg_clt --help`

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

O número de configurações possíveis no PostgreSQL é ENORME. Podemos configurar muitas coisas e esse treinamento duraria anos se fôssemos falar de todas as possibilidades.

A experiência vai te mostrar quais as configurações mais importantes. Conforme você lê e testa algumas configurações, vai entender seu valor e saber sua aplicação.

Mas uma ótima fonte de referência e conhecimento é a documentação oficial então vale MUITO a pena conferir a parte de configurações dela:

https://www.postgresql.org/docs/current/config-setting.html


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
O backup lógico vai trazer apenas a estrutura e os dados do banco, enquanto o backup físico vai trazer todas as informações do banco, incluindo estatísticas, logs, etc.

Nesta aula:

- Entendemos que há diferentes tipos de backup e conversamos sobre como fazê-los
- Vimos que há 2 principais formas de fazer backups
  - Através da linha de comando (usando pg_dump)
  - Através de interfaces gráficas (por exemplo, usando o PgAdmin)
- Aprendemos como restaurar backups realizados também de 2 formas diferentes

### 6. Planejamento de queries