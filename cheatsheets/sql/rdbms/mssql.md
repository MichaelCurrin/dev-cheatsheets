---
---
# Microsoft SQL Server

## Resources

- [SQL Server Documentation](https://learn.microsoft.com/en-us/sql/sql-server/) on Microsoft Learn.

## Installation

### Download and Install

- Download SQL Server from the [official Microsoft page](https://www.microsoft.com/en-us/sql-server/sql-server-downloads).
- Follow the installation guide for your operating system:
  - **Windows**: Use the SQL Server Installer.
  - **Linux (Ubuntu, RHEL, SUSE)**: Add the Microsoft repository first. See [Install SQL Server on Ubuntu](https://learn.microsoft.com/en-us/sql/linux/quickstart-install-connect-ubuntu).
  - **macOS**: Use Docker (SQL Server is not natively supported).

### Required Tools

For command-line interaction, install `mssql-tools`:

```sh
# Ubuntu
sudo apt-get install mssql-tools unixodbc-dev
```

## Show

### List Databases

```sql
SELECT name FROM sys.databases;
```

In the CLI:

```sh
sqlcmd -S localhost -U SA -P 'YourPassword' -Q "SELECT name FROM sys.databases;"
```

### List Tables in the Current Database
```sql
SELECT * FROM information_schema.tables;
```

More details:
```sql
SELECT * FROM sys.tables;
```

Filter by table name:
```sql
SELECT * FROM information_schema.tables WHERE table_name = 'table_name';
```

## Select Database

To switch to a specific database:
```sql
USE my_database;
```

## Quit

Exit SQL Server:
```sql
QUIT;
```
Or use <kbd>CTRL</kbd>+<kbd>D</kbd> in the CLI.

## User Management

### Login

```sh
sqlcmd -S localhost -U SA -P 'YourPassword'
```

### Create User

```sql
CREATE LOGIN foo WITH PASSWORD = 'bar';
CREATE USER foo FOR LOGIN foo;
```

Grant privileges:
```sql
GRANT ALL PRIVILEGES ON DATABASE::my_db TO foo;
```

### Create Role

Roles allow managing multiple users' permissions efficiently.

Create a role:
```sql
CREATE ROLE my_role;
```

Add a user to the role:
```sql
ALTER ROLE my_role ADD MEMBER foo;
```

Remove a role:
```sql
DROP ROLE my_role;
```
*(Ensure the role has no members before dropping.)*

### Change Password

```sql
ALTER LOGIN foo WITH PASSWORD = 'new_password';
```

### List Users

```sql
SELECT name FROM sys.server_principals WHERE type IN ('S', 'U');
```

## Connect to SQL Server

```sh
sqlcmd -S localhost -U my_user -P 'YourPassword' -d my_db
```

## Run Queries Using CLI

Interactive console:
```sh
sqlcmd
```

Run a single query:
```sh
sqlcmd -Q "SELECT COUNT(*) FROM my_table"
```

Run a query from a file:
```sh
sqlcmd -i query.sql
```

## Environment Variables for Passwords

To avoid entering passwords in the CLI:
```sh
export MSSQL_SA_PASSWORD=YourPassword
sqlcmd ...
```

## Database Management

### Backup and Restore

Backup a database:
```sql
BACKUP DATABASE my_db TO DISK = 'C:\path\to\backup.bak';
```

Restore a database (overwriting if needed):
```sql
RESTORE DATABASE my_db FROM DISK = 'C:\path\to\backup.bak' WITH REPLACE;
```

### Create Database
```sh
sqlcmd -Q "CREATE DATABASE my_db;"
```

### Drop Database
```sh
sqlcmd -Q "DROP DATABASE my_db;"
```

### Dump Database

```sh
sqlcmd -Q "BACKUP DATABASE my_db TO DISK = 'C:\path\to\backup.bak';"
```

### Restore Database

```sh
sqlcmd -Q "RESTORE DATABASE my_db FROM DISK = 'C:\path\to\backup.bak' WITH REPLACE;"
```

## VS Code Extensions

For enhanced SQL development, install the following Microsoft-published extensions:

- [SQL Server (mssql)](https://marketplace.visualstudio.com/items?itemName=ms-mssql.mssql)
- SQL Database Projects
- SQL Bindings

These extensions enable query execution, IntelliSense, and project-based database development.

---

This version improves readability, fixes incorrect commands, standardizes formatting, and ensures best practices for SQL Server usage. Let me know if you need further refinements!

