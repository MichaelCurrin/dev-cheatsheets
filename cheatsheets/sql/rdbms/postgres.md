---
logo: postgresql
---
# Postgres


## Resources

- [Homepage](https://www.postgresql.org/about/) on Postgres homepage.
    > PostgreSQL: The World's Most Advanced Open Source Relational Database
- [About](https://www.postgresql.org/about/) on Postgres homepage.


## Docs and tutorials

- [postgresql.org/docs/](https://www.postgresql.org/docs/)
- [postgresqltutorial.com](https://www.postgresqltutorial.com/)
    - [Postgres Cheatsheet](https://www.postgresqltutorial.com/postgresql-cheat-sheet/)


## Installation

Choose an option below.

- Go to [Download](https://www.postgresql.org/download/) page.
- Follow the [Ubuntu Postgres download instructons](https://www.postgresql.org/download/linux/ubuntu/). 
    Make sure you install `ls_release` and `wget` first if needed.
    ```sh
    $ sudo apt-get install lsb-release wget -y
    ```
    ```sh
    # Create the file repository configuration:
    sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
    
    # Import the repository signing key:
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
    
    sudo apt-get update
    
    # Latest
    sudo apt-get -y install postgresql
    # OR target a version.
    sudo apt-get -y install postgresql-12
    ```

## Show

### Show database

```
\l
```

[source](https://www.postgresqltutorial.com/postgresql-show-databases/)

In the CLI:

```sh
$ psql -U postgres -l
```

Recommended - specify a user as the default is `root` and you'll get an error if that does not exist.

### Tables

Show all tables:

```
\d
```

Tables and views:

```
\dt
```


More info:

```
\dt+
```

Add a table name to filter:

```
\d table_name
```


## Use database

If you omit database name argument, the default of `postgres` will be used.

```sh
$ psql -U postgres DB_NAME
```


## Quit

```
\q
```

Or <kbd>CTRL</kbd>+<kbd>d</kbd>.


## Users

### Login

Here we use a user named `postgres`:

```sh
$ psql -U postgres
```

The console will then look like this:

```
postgres=#
```

### Create user

```sql
CREATE USER foo
```

Recommended - use the optional `ENCRYPTED` modified.

```sql
CREATE USER foo WITH ENCRYPTED PASSWORD 'bar';
```

See [create user][] docs.

[create user]: https://www.postgresql.org/docs/current/app-createuser.html

Grant priviledges:

```sql
GRANT ALL PRIVILEGES ON DATABASE my-db TO foo;
```

Or create with the shell:

```sh
$ sudo -u postgres createuser foo
```

### Create role

> `CREATE ROLE` adds a new role to a PostgreSQL database cluster. 
> 
> A role is an entity that can own database objects and have database privileges; a role can be considered a “user”, a “group”, or both depending on how it is used.

See [create role][] docs.

Create a role that can log in, but don't give it a password:

```sql
CREATE ROLE my-role LOGIN;
```

Create a role with a password:

```sql
CREATE USER my-user WITH PASSWORD 'abce1234';
```

> `CREATE USER` is the same as `CREATE ROLE` except that it implies `LOGIN`.

Give permissions to the role.

```sql
CREATE ROLE foo WITH CREATEDB;
CREATE ROLE foo WITH CREATEDB CREATEROLE;
```

[create role]: https://www.postgresql.org/docs/current/sql-createrole.html

Drop:

```sql
DROP ROLE foo;
```

### Change password

```sql
ALTER USER my_user WITH PASSWORD 'my_password';
```

Or encrypt it:

```sql
ALTER USER my_user WITH ENCRYPTED PASSWORD 'my_password';
```

See [alter user](https://www.postgresql.org/docs/current/sql-alteruser.html) docs.

Set it interactively:

```sql
postgres=# \password
```

From [question on forum](https://serverfault.com/questions/110154/whats-the-default-superuser-username-password-for-postgres-after-a-new-install/325596)

You cannot read the original value of an encryped password. But you can set a new one.

### List users

```sql
postgres=# \du
                                   List of roles
 Role name |                         Attributes                         | Member of
-----------+------------------------------------------------------------+-----------
 postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
```

More details:

```
postgres=# \du+
```

[List users](https://www.postgresqltutorial.com/postgresql-list-users/) PG tutorial.


## Connect

```sh
$ psql
```

You might need to switch users first:

```sh
$ sudo su postgres
```

If you don't want to use default user of `postgres`, set the user. You might need to set `-h` for the host too.

```sh
$ psql -U my-user -d my-db -h abc.eu-central-1.rds.amazonaws.com
```

From the [docs](https://www.postgresql.org/docs/13/app-psql.html).

```sh
$ psql "service=myservice sslmode=require"
$ psql postgresql://dbmaster:5433/mydb?sslmode=require
```


## Run query using CLI

See [Connect](#connect) above for other flags to add.

See [psql](https://www.postgresql.org/docs/current/app-psql.html) docs.

Interactive console:

```sh
$ psql
```

Run query in string:

```sh
$ psql -c 'SELECT COUNT(*) FROM my_table'
```

Or you can pass the name of a `.sql` file.

```sh
$ psql -f query.sql
```

Or

```sh
$ psql < query.sql
```


## Passwords

If you database is password-protected.

You can get prompted in the CLI to enter a password.

Or enter password using an approach here.

### Env vars

```sh
$ PGPASSWORD=123 psql ...
```
[env vars](http://www.postgresql.org/docs/current/static/libpq-envars.html) manual.

### PG pass

Use a `.pgpass` file to store the password. [pgpass](http://www.postgresql.org/docs/current/static/libpq-pgpass.html) manual.

#### Trust authentication

For that specific user:

[Auth trust](http://www.postgresql.org/docs/current/static/auth-methods.html#AUTH-TRUST).

#### Connection URI

Use a connection string that contains everything:

[Connect](http://www.postgresql.org/docs/current/static/libpq-connect.html#AEN42532) in manual.


## Create, drop, dump and restore

### Overview

#### Binary dumps

Using compress binary archive:

```sh
pg_dump -U postgres DB_NAME --format=custom

dropdb -U postgres DB_NAME
pg_restore -U postgres db.pgdump
```

Convert an existing dump to plain text:

```sh
pg_restore db.pgdump -f db.sql
```

#### Text dump

Using plain text SQL file - larger as it is not compressed but it is easy to read.

```sh
pg_dump -U postgres DB_NAME -fp

dropdb -U postgres DB_NAME
createdb -U postgres DB_NAME
psql -U postgres DB_NAME < db.sql
```

### Create DB

```sh
$ createdb -U my-user my-db
```

See [createdb][] docs.

[createdb]: https://www.postgresql.org/docs/latest/app-createdb.html

### Drop DB

```sh
$ dropdb -U my-user my-db
```

See [dropdb][] docs.

[dropdb]: https://www.postgresql.org/docs/latest/app-dropdb.html

### Dump

Create a dump from a DB:

```sh
$ pg_dump -Fc db_name -f db_name.pgdump
$ # OR
$ pg_dump -Fc db_name > db_name.pgdump
```

See the [pg_dump][] docs.

[pg_dump]: https://www.postgresql.org/docs/current/app-pgdump.html

> pg_dump — extract a PostgreSQL database into a script file or other archive file
>
> pg_dump is a utility for backing up a PostgreSQL database. It makes consistent backups even if the database is being used concurrently. pg_dump does not block other users accessing the database (readers or writers).

```
pg_dump [connection-option...] [option...] [dbname]
```

- `-F, --format FORMAT` - The default format is `p` or `plain` for plain text SQL. Use `c` or `custom` as a **compressed archive** which is the most flexible option. Also `d` or `directory` for a directory of files, and `t` or `tar` are options. e.g. `-Fc` (note no equals sign) or `--format=custom`.
- `-f, --file PATH` - path to write to, otherwise will write to stdout.

e.g.

```sh
$ pg_dump -U my-user -d db-name -Fc -h abcdef.eu-central-1.rds.amazonaws.com -f db.pgdump
```

### Restore

Drop the database and recreate it from a dump:

```sh
$ dropdb db_name
$ pg_restore -C -d db_name db_name.dump
```

See [pg_restore][] docs.

[pg_restore]: https://www.postgresql.org/docs/current/app-pgrestore.htm

> pg_restore — restore a PostgreSQL database from an archive file created by pg_dump
>
> pg_restore is a utility for restoring a PostgreSQL database from an archive created by pg_dump in one of the non-plain-text formats

```
pg_restore [connection-option...] [option...] [filename]
```

- `-C, --create` - Create the database before restoring into it.
- `-c, --clean` - drop the DB first.
- `--if-exists` - to be used with the clean flag.

The database comes from within the dump (unlike with plain SQL) so you don't need to specify it.

e.g.

```sh
$ dropdb -U my-user db-name
$ pg_restore -U my-user db.pgdump
```

Another option for restoring is using `psql` and a plain-text SQL file. Note that you might have to create the DB first before you first into it.

```sh
$ psql postgres://postgres:$POSTGRES_PASSWORD@$POSTGRES_HOST < db.sql
```

Or if on the same host like for local dev or inside a Postgres container.

```sh
$ psql -U my-user -d db-name < db.sql
```

### Dump cluster

From [pg_dumpall][] docs.

This is useful if you have several databases to dump or need to dump the roles for users, which exists at the cluster level so don't appear in a `pg_dump` dump.

```sh
$ pg_dumpall > db.out
```

Some flags:

- `--clean`
- `-f, --file FILENAME`
- `--roles-only`

Reload database(s) from this file, you can use:

```sh
$ psql -f db.out postgres
```

> It is not important to which database you connect here since the script file created by `pg_dumpall` will contain the appropriate commands to create and connect to the saved databases. 
> 
> An exception is that if you specified `--clean`, you must connect to the postgres database initially; the script will attempt to drop other databases immediately, and that will fail for the database you are connected to.

[pg_dumpall]: https://www.postgresql.org/docs/current/app-pg-dumpall.html

