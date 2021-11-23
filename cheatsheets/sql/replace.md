# Replace

### Remove newline

Replace newline with a space.

`CHAR(13)` is carriage return and `CHAR(10)` is a line feed.  Usually they are there together. 

```sql
SELECT
  REPLACE( REPLACE( foo, CHAR(13), ''), CHAR(10), ' ') AS foo
FROM bar
;
```
