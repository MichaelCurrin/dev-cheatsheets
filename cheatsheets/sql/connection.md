# SQL connection cheatsheet

## Postgres


- Port: 5432


### Connection strings

```
postgresql://USERNAME:PASSWORD@HOST:5432/DB_NAME
```

More detailed:

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

### Connect using Node

```javascript
let DBConnectionURI = `postgresql://postgres:${POSTGRES_PASSWORD || ''}@postgres:5432/postgres`;

let DBOpts = {
  dialect: 'postgres',
  pool: {
    max: 10,
    min: 0,
    idle: 10000,
   },
  logging: false,
};

const instance = new Sequelize(DBConnectionURI, DBOpts);

instance.query('SELECT 1 AS foo')
  .then(result => console.log(result));
// => [ [ anonymous { foo: 1 } ]
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbNjU3MjYyNjA5LC0xMTUwNDAyMTQ4XX0=
-->