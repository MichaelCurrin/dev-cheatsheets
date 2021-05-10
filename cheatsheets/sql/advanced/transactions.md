# Transactions

No reads or writes occur except within a transaction. 

Any command that accesses the database will automatically start a transaction if one is not already in effect. Automatically started transactions are committed when the last SQL statement finishes.

Syntax:

- `query.sql`
    ```sql
    BEGIN;
      -- Do one or more steps like select, or update/set/delete
    COMMIT;
    ```
- `query.sql` with more verbose but equivalent syntax.
    ```sql
    BEGIN TRANSACTION;
      -- Do one or more steps like select, or update/set/delete
    END TRANSACTION;
    ```
    
The docs say `END TRANSACTION` is an alias for `COMMIT`.

You can also use `ROLLBACK` instead of `COMMIT`.

 When running interactively, I get an error gets reported and flow stops with the transaction open, then I need to run `COMMIT` still even if it was in my selection. Then I get `ROLLBACK` logged. Or I can run `ROLLBACK` directly.


## SQLite

Notes for SQLite:

- Transactions can be `DEFERRED`, `IMMEDIATE`, or `EXCLUSIVE`. The default transaction behavior is `DEFERRED`.

Example from [tutorial](https://www.sqlitetutorial.net/sqlite-transaction/).

- `query.sql`
    ```sql
    BEGIN TRANSACTION;

      UPDATE accounts
         SET balance = balance - 1000
       WHERE account_no = 100;

      UPDATE accounts
         SET balance = balance + 1000
       WHERE account_no = 200;

      INSERT INTO account_changes(account_no,flag,amount,changed_at) 
      VALUES(100,'-',1000,datetime('now'));

      INSERT INTO account_changes(account_no,flag,amount,changed_at) 
      VALUES(200,'+',1000,datetime('now'));

    COMMIT;
    ```
