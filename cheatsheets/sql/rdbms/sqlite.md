# SQLite


## Create

```sql
CREATE TABLE IF NOT EXISTS foo (
    /* ... */
);
```


## ID

```
id INTEGER PRIMARY KEY
```


## Data types

From [Data types](https://www.sqlite.org/datatype3.html) in the docs.

### Available

Type | Description
---  | ---
`NULL` | The value is a NULL value.
`INTEGER` | The value is a signed integer, stored in 1, 2, 3, 4, 6, or 8 bytes depending on the magnitude of the value.
`REAL` | The value is a floating point value, stored as an 8-byte IEEE floating point number.
`TEXT` | The value is a text string, stored using the database encoding (UTF-8, UTF-16BE or UTF-16LE).
`BLOB` | The value is a blob of data, stored exactly as it was input.

### Text

```
location VARCHAR(50)
```

### Number

```
foo INTEGER
bar INTEGER(8)
```

Cast to integer:

```
CAST(foo AS INTEGER)
```

### Timestamp

Use current time if value is not set.

```
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
```

### Time

See [Date and time functions](https://sqlite.org/lang_datefunc.html).

Functions:

- `DATE`
- `TIME`
- `DATETIME`
- `JULIANDAY`
- `STRFTIME`

Now.

```sql
SELECT DATE('now')
```

String format. Pass in `'now'` for easy testing, or a timestamp column.

```sql
SELECT STRFTIME('%s','now')
```

Get just year.

```sql
SELECT STRFTIME('%Y', 'now')
```

Symbol | Description | Range
--- | --- | ---
`%d` | day of month | DD
`%m` | month | MM
`%H` | hour | MM
`%M` | minute | SS
`%Y` | year | YYYY


## Core functions

- [Built-In Scalar SQL Functions](https://sqlite.org/lang_corefunc.html)


## CLI help

### Man page

- [Linus Die](https://linux.die.net/man/1/sqlite3)
- [OSX](https://ss64.com/osx/sqlite3.html)

### Example

Query:

```sh
$ sqlite db.sqlite 'SELECT COUNT(*) FROM foo;'
```

Interactive:

```sh
$ sqlite db.sqlite
```

Run a command. Quotes are needed.

```sh
$ sqlite db.sqlite -csv ".import file.csv my_table"
```

You can also use `-cmd ".import file.csv my_table"` but then you go into interactive mode because there is no file input.

In the console:

```
sqlite> -help
sqlite> .mode csv
sqlite> import file.csv my_table
```

### Usage

For version on macOS:

```sh
$ sqlite3 -version
# 3.28.0 2019-04-15 14:49:49 378230ae7f4b721c8b8d83c8ceb891449685cd23b1702a57841f1be40b5daapl
```

```sh
$ sqlite3 -help
```

```
sqlite3 -help
Usage: sqlite3 [OPTIONS] FILENAME [SQL]
FILENAME is the name of an SQLite database. A new database is created
if the file does not previously exist.
OPTIONS include:
   -append              append the database to the end of the file
   -ascii               set output mode to 'ascii'
   -bail                stop after hitting an error
   -batch               force batch I/O
   -column              set output mode to 'column'
   -cmd COMMAND         run "COMMAND" before reading stdin
   -csv                 set output mode to 'csv'
   -deserialize         open the database using sqlite3_deserialize()
   -echo                print commands before execution
   -init FILENAME       read/process named file
   -[no]header          turn headers on or off
   -help                show this message
   -html                set output mode to HTML
   -interactive         force interactive I/O
   -line                set output mode to 'line'
   -list                set output mode to 'list'
   -lookaside SIZE N    use N entries of SZ bytes for lookaside memory
   -maxsize N           maximum size for a --deserialize database
   -memtrace            trace all memory allocations and deallocations
   -newline SEP         set output row separator. Default: '\n'
   -nullvalue TEXT      set text string for NULL values. Default ''
   -pagecache SIZE N    use N slots of SZ bytes each for page cache memory
   -quote               set output mode to 'quote'
   -readonly            open the database read-only
   -separator SEP       set output column separator. Default: '|'
   -stats               print memory stats before each finalize
   -version             show SQLite version
   -vfs NAME            use NAME as the default VFS
```
