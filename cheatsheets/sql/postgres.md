# Postgres SQL cheatsheet

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
eyJoaXN0b3J5IjpbMjI2MjgxNTUxXX0=
-->