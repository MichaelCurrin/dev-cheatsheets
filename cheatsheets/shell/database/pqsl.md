---
description: |
    `psql` is a terminal-based front-end to PostgreSQL. It enables you to interact with the PostgreSQL database server using SQL queries and commands.
---
# psql

> psql is a powerful, interactive terminal interface for PostgreSQL, enabling database management and SQL query execution.


## Related

<!-- The current page was generated using GPT but the linked page was made by hand and can be refiend or split -->

See [Postgres cheatsheet][].

[Postgres cheatsheet]: {% link cheatsheets/sql/rdbms/postgres.md %}



## Install

See [PostgreSQL Documentation](https://www.postgresql.org/download/) for installation instructions.

```sh
$ sudo apt-get install postgresql-client
```

## Manpage

```
NAME
       psql - PostgreSQL interactive terminal

SYNOPSIS
       psql [OPTIONS] [DBNAME [USERNAME]]

       psql [OPTIONS] [-c COMMAND | -f FILE] [DBNAME [USERNAME]]
...
```

## Bash shell usage

### Connect to a database

Connect to a PostgreSQL database:

```sh
$ psql -d dbname -U username
```

### Import SQL file

Execute commands from a SQL file:

```sh
$ psql -d dbname -U username -f filename.sql
```


## PSQL interactive mode usage

### List databases

List all available databases:

```console
# \l
```

### Connect to a database from within `psql`

Switch to another database from within `psql`:

```console
# \c dbname
```

### List tables

List all tables in the current database:

```console
# \dt
```

### Describe table

Show the structure of a table:

```console
# \d tablename
```

### Execute a SQL query

Execute a SQL query:

```console
# SELECT * FROM tablename;
```

### Quit psql

Exit the psql interface:

```console
# \q
```

### Get help

Show help on `psql` commands:

```console
# \?
```

### Show SQL command history

Display the history of executed SQL commands:

```console
# \s
```

### Set output format

Set the output format to aligned, unaligned, or HTML:

```console
# \a       # Aligned
# \t       # Unaligned
# \H       # HTML
```

### Export query results

Export the result of a query to a file:

```console
# \o filename
# SELECT * FROM tablename;
# \o
```

### Edit command in editor

Open the current command in a text editor for modification:

```console
# \e
```
