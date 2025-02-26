---
#logo: mssql
---
# Microsoft SQL Server

## Resources

- [SQL Server](https://learn.microsoft.com/en-us/sql/sql-server/) on the Microsoft learn docs.
- 
## Installation

Choose an option below.

- Go to [Download](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) page.
  
For Ubuntu, you may need to add the Microsoft repository first - see [Install SQL Server on Ubuntu](https://learn.microsoft.com/en-us/sql/linux/quickstart-install-connect-ubuntu).

## Show

### Show databases

```sql
SELECT name FROM sys.databases;
```

In the CLI:

```sh
$ sqlcmd -S localhost -U SA -P 'YourPassword' -Q "SELECT name FROM sys.databases;"
```

Recommended - specify a user as the default is `SA` for system administrator.

### Tables

Show all tables in the current database:

```sql
SELECT * FROM information_schema.tables;
```

More info:

```sql
EXEC sp_tables;
```

Add a table name to filter:

```sql
SELECT * FROM information_schema.tables WHERE table_name = 'table_name';
```

## Use database

To use a specific database:

```sql
USE DB_NAME;
```

## Quit

```sql
QUIT;
```

Or <kbd>CTRL</kbd>+<kbd>d</kbd>.

## Users

### Login

Here we use a user named `SA`:

```sh
$ sqlcmd -S localhost -U SA -P 'YourPassword'
```

The console will then look like this:

```
1>
```

### Create user

```sql
CREATE LOGIN foo WITH PASSWORD = 'bar';
```

Grant privileges:

```sql
GRANT ALL PRIVILEGES ON DATABASE::my_db TO foo;
```

Or create with the shell:

```sh
$ sudo -u mssql createuser foo
```

### Create role

> `CREATE ROLE` adds a new role to a SQL Server database.
>
> A role is an entity that can own database objects and have database privileges.

Create a role:

```sql
CREATE ROLE my_role;
```

Add a user to the role:

```sql
EXEC sp_addrolemember 'my_role', 'foo';
```

Drop:

```sql
DROP ROLE my_role;
```

### Change password

```sql
ALTER LOGIN my_user WITH PASSWORD = 'my_password';
```

### List users

```sql
SELECT name FROM sys.server_principals WHERE type IN ('S', 'U');
```

## Connect

```sh
$ sqlcmd -S localhost -U SA -P 'YourPassword'
```

If you don't want to use default user of `SA`, set the user.

```sh
$ sqlcmd -S localhost -U my_user -P 'YourPassword' -d my_db
```

## Run query using CLI

See [Connect](#connect) above for other flags to add.

Interactive console:

```sh
$ sqlcmd
```

Run query in string:

```sh
$ sqlcmd -Q 'SELECT COUNT(*) FROM my_table'
```

Or you can pass the name of a `.sql` file.

```sh
$ sqlcmd -i query.sql
```

## Passwords

If your database is password-protected, you can get prompted in the CLI to enter a password.

### Env vars

```sh
$ MSSQL_SA_PASSWORD=YourPassword sqlcmd ...
```

## Create, drop, dump and restore

### Overview

#### Backup and Restore

Using SQL Server Management Studio or command line:

Backup:

```sql
BACKUP DATABASE my_db TO DISK = 'C:\path\to\backup.bak';
```

Restore:

```sql
RESTORE DATABASE my_db FROM DISK = 'C:\path\to\backup.bak';
```

### Create DB

```sh
$ sqlcmd -Q "CREATE DATABASE my_db;"
```

### Drop DB

```sh
$ sqlcmd -Q "DROP DATABASE my_db;"
```

### Dump

Create a dump from a DB:

```sh
$ sqlcmd -Q "BACKUP DATABASE my_db TO DISK = 'C:\path\to\backup.bak';"
```

### Restore

Drop the database and recreate it from a backup:

```sh
$ sqlcmd -Q "DROP DATABASE my_db;"
$ sqlcmd -Q "RESTORE DATABASE my_db FROM DISK = 'C:\path\to\backup.bak';"
```


## VS Code extensions

Published by Microsoft

- SQL Server (mssql)
- SQL Database Projects
- SQL Bindings
