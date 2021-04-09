---
logo: postgresql
---
# Postgres


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
