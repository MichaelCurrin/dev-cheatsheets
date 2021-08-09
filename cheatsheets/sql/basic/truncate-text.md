# Truncate text

If a value is 10 or more characters long, get the first 10 characters and then add an ellipsis ("...").

```sql
CASE
  WHEN LENGTH(name) >= 10
  THEN SUBSTR(name, 0, 11) || "..."
  ELSE name
END AS name
```
