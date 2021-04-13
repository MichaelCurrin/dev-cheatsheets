# Maths


## Float division

```sql
SELECT 123 / 2.0;
```
```
61.5
```

Another option is to cast either value to a float.

```sql
SELECT 123 / 2 :: FLOAT;
```


## Floor division

Warning, this will round down.

```sql
SELECT 123 / 2;
```
```
61
```
