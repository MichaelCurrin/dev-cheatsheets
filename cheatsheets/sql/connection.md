# SQL connection cheatsheet

## Postgres


- Port: 5432


### Connection strings

https://www.postgresql.org/docs/current/libpq-connect.html#LIBPQ-CONNSTRING

```
postgresql://[user[:password]@][netloc][:port][,...][/dbname][?param1=value1&...]
```
e.g.
```
postgresql://
postgresql://localhost
postgresql://localhost:5432
postgresql://localhost/mydb
postgresql://user@localhost
postgresql://user:secret@localhost
postgresql://other@localhost/otherdb?connect_timeout=10&application_name=myapp
postgresql://localhost/mydb?user=other&password=secret
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTk1MDg2Nzk2NV19
-->