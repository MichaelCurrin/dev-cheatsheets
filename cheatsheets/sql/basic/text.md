# Text


## Substring

Based on [docs](https://sqlite.org/lang_corefunc.html).

Use either `SUBSTR` or `SUBSTRING` function.

In SQLite, `SUBSTRING` is just an alias.

With 2 or 3 arguments.

- `SUBSTR(X, Y)`
- `SUBSTR(X, Y, Z)`
- `SUBSTRING(X, Y, Z)`
- `SUBSTRING(X, Y)`

Pass in a string, starting position, and optional count of characters. This constrasts with other programming characters where you might give the end index rather.

Note numbering starts at `1`.

### Example

e.g.

```sql
// Unchanged.
SELECT SUBSTR("abcdef", 1);
// abcdef

// Remove from end by getting first N characters.
SELECT SUBSTR("abcdef", 1, 3);
// abc

// Remove from start by skipping first.
SELECT SUBSTR("abcdef", 2);
// bcdef
```

Get characters at the end.

```sql
SELECT SUBSTR("abcdef", LENGTH("abcdef")); // i.e. Start at last or 6th character
// f

SELECT SUBSTR("abcdef", LENGTH("abcdef") - 1); // i.e. Start at 2nd last character.
// ef
```

Get the middle of the string by setting a start offset and a limit.

```sql
SELECT SUBSTR("abcdef", 2, 3);
bcd
```

Trim one character from both ends.

```sql
SELECT SUBSTR("abcdef", 2, LENGTH("abcdef") -2); // i.e. get 6 - 2 = 4 characteers
// bcde
```

Obfuscate a string (like ID or credit card number) by keeping the first 4 and last 4 characters and replacing the middle with `X` character.

```
SUBSTR(`ID number`, 1, 4)
  || REPLACE(PRINTF('%.' || (LENGTH(`ID number`) - 8) || 'c', '/'), '/', 'X')
  || SUBSTR(`ID number`, LENGTH(`ID number`) - 3)
```


## Trim

- `TRIM(X)`
- `TRIM(X, Y)`

> The trim(X,Y) function returns a string formed by removing any and all characters that appear in Y from both ends of X. If the Y argument is omitted, trim(X) removes spaces from both ends of X


## Truncate text

Here, if a value is 10 or more characters long, get the first 10 characters and then add an ellipsis ("...").

```sql
CASE
  WHEN LENGTH(name) >= 10
  THEN SUBSTR(name, 0, 11) || "..."
  ELSE name
END AS name
```


## Repeat

From [SO](https://stackoverflow.com/questions/11568496/how-to-emulate-repeat-in-sqlite).

```sql
SELECT REPLACE(PRINTF('%.' || 5 || 'c', '/'), '/', 'My string ');
// My string My string My string My string My string 
```

