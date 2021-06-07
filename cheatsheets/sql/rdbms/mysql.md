---
title: MySQL
logo: mysql
description: The world's most popular open source database 
---


## Console

### Connect to DB

Note no space between `-p` and your password.

```sh
$ mysql -u my_user --database my_db -pPASSWORD
```

Note that your password will be saved in your shell's history or commands.

Or, the more secure way.

```sh
$ mysql -u my_user --database my_db -p
```

Then enter your password and press enter.

### Manage as root

```sh
$ mysql -u root -p
```

Then enter the DB's root user password.


## Schema

### List tables

See [Show Tables](https://dev.mysql.com/doc/refman/8.0/en/show-tables.html) docs reference.

```sql
SHOW TABLES;
```

### Describe table

See [tutorial](https://www.tutorialspoint.com/how-do-i-show-the-schema-of-a-table-in-a-mysql-database).

```sql
DESCRIBE my_table;

-- OR
DESCRIBE my_db.my_table;
```
