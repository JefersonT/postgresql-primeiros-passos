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

