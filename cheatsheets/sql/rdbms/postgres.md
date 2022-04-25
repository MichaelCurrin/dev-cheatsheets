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

Show all tables.

```
postgres=# \dt
```

For more info.
```
postgres=# \dt+
```

Get info on a table.

```
postgres=# \d+ table_name
```


## Use database

If you omit database name argument, the default of `postgres` will be used.

```sh
$ psql -U postgres DB_NAME
```


## Quit

```
postgres=# \q
```

Or <kbd>CTRL</kbd>+<kbd>d</kbd>.


## Users

### Login

Here we use a user named `postgres`.

```sh
$ psql -U postgres
```

The console will now look like this:

```
postgres=#
```

### Create user

```sql
CREATE USER postgres
```

```sql
CREATE USER foo WITH PASSWORD 'bar';
```

https://www.postgresql.org/docs/current/app-createuser.html

### Create role

```sql
CREATE ROLE foo LOGIN;
```
```sql
CREATE ROLE admin WITH CREATEDB CREATEROLE;
```

[create role](https://www.postgresql.org/docs/current/sql-createrole.html) docs.

### Change password

```sql
ALTER USER postgres WITH PASSWORD 'newpass';
```

[alter user](https://www.postgresql.org/docs/current/sql-alteruser.html) docs.

Set it interactively.

```sql
postgres=# \password
```

[question on forum](https://serverfault.com/questions/110154/whats-the-default-superuser-username-password-for-postgres-after-a-new-install/325596)

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

From the [docs](https://www.postgresql.org/docs/13/app-psql.html).

```sh
$ psql "service=myservice sslmode=require"
$ psql postgresql://dbmaster:5433/mydb?sslmode=require
```

## Run query using CLI

```sh
$ psql -U "$DB_USER" -d "$DB_NAME" -c "SELECT COUNT(*) FROM my_table"
```

Or you can pass the name of a `.sql` file.

If using a remote database, add host:

```sh
$ psql -h "$HOST" ...
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


## Dump and restore


### Dump

Create a dump from a DB:

```sh
$ pg_dump --format=custom db_name > db_name.dump
```

See [pg_dump](https://www.postgresql.org/docs/current/app-pgdump.html) docs.

> pg_dump — extract a PostgreSQL database into a script file or other archive file
>
> pg_dump is a utility for backing up a PostgreSQL database. It makes consistent backups even if the database is being used concurrently. pg_dump does not block other users accessing the database (readers or writers).

```
pg_dump [connection-option...] [option...] [dbname]
```

- `-F, --format FORMAT` - The default format is `p` or `plain` for plain text SQL. Use `c` or `custom` as a compressed archive which is the most flexible option. Also `d` or `directory` and `t` or `tar` are options. e.g. `-Fc` note no equals sign.
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

See [pg_restore](https://www.postgresql.org/docs/current/app-pgrestore.html) docs.

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


