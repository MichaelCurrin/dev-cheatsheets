# Postgres SQL cheatsheet

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

## Create user

```
postgres=# CREATEUSER postgres
```

https://www.postgresql.org/docs/current/app-createuser.html

## Change password

```
postgres=# ALTER USER postgres WITH PASSWORD 'newpass';
```

https://www.postgresql.org/docs/current/sql-alteruser.html

Set it interactively.

```
postgres=# \password
```

https://serverfault.com/questions/110154/whats-the-default-superuser-username-password-for-postgres-after-a-new-install/325596

## List users

```
# \du
                                   List of roles
 Role name |                         Attributes                         | Member of
-----------+------------------------------------------------------------+-----------
 postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
```

More detail:

```
# \du+
```

https://www.postgresqltutorial.com/postgresql-list-users/
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEzMjE1OTY4NjksMjI2MjgxNTUxXX0=
-->