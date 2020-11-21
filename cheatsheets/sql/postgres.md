---
logo: postgresql
---
# PostgresSQL


## Docs and tutorials

- [postgresql.org/docs/](https://www.postgresql.org/docs/)
- [postgresqltutorial.com](https://www.postgresqltutorial.com/)


## Show database

```
\l
```

[source](https://www.postgresqltutorial.com/postgresql-show-databases/)

## Login

Here we use a user named `postgres`.

```sh
$ psql -U postgres
```

The console will now look like this:

```
postgres=#
```

This is implied for the rest of this guide.

## Create user

```sql
CREATE USER postgres
```

```sql
CREATE USER foo WITH PASSWORD 'bar';
```

https://www.postgresql.org/docs/current/app-createuser.html


## Create role


```sql
CREATE ROLE foo LOGIN;
```
```sql
CREATE ROLE admin WITH CREATEDB CREATEROLE;
```

https://www.postgresql.org/docs/current/sql-createrole.html


## Change password

```sql
ALTER USER postgres WITH PASSWORD 'newpass';
```

https://www.postgresql.org/docs/current/sql-alteruser.html

Set it interactively.

```sql
\password
```

https://serverfault.com/questions/110154/whats-the-default-superuser-username-password-for-postgres-after-a-new-install/325596

## List users

```sql
\du
                                   List of roles
 Role name |                         Attributes                         | Member of
-----------+------------------------------------------------------------+-----------
 postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
```

More detail:

```
# \du+
```

[List users](https://www.postgresqltutorial.com/postgresql-list-users/) PG tutorial.
