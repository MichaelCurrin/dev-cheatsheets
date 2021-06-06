# Conditionals

See also [Control flow][] section for more info on how to do tests and if statements.

[Control flow]: {% link cheatsheets/shell/scripting/control-flow.md %}


## String condtions

### Empty

```sh
-z STRING
```

### Not empty

```sh
-n STRING
```

Or

```sh
! -z STRING
```

### Equal

Double is newer and close to other languages. Single equals sign is also supported.

```sh
STRING == STRING
```

### Not equal

```sh
STRING != STRING
```


## Numeric conditions

These all follow the pattern of:

```
NUMBER OPERATOR NUMBER
```

Operator | Description
--- | ---
`-eq` | equal
`-nq` | not equal
`-lt` | less than
`-le` | less than or equal to
`-gt` | greater than
`-ge` | greater than or equal to

You can also do:

```sh
[[ NUMBER > NUMBER ]]
```

Remember to do it inside `[[` otherwise you'll write to a file.

e.g.

```sh
[[ 2 > 1 ]] && echo 'T' || echo 'F'
```

Using `>=` does not work though.


## File conditions

### File attributes

These are all done as:

```sh
[[ OPERATOR PATH ]]

# e.g.
[[ -e file.txt ]]
```

Operator | Description
--- | ---
`-e` | Exists
`-s` | Size is non-zero
`-f` | File
`-d ` | Directory
`-h ` | Symlink
`-r` | Readable
`-w` | Writable
`-x` | Executable

### Compared modified dates

These are all done as:

```sh
[[ PATH OPERATOR PATH ]]
```

Operator | Description
--- | ---
`-nt` | Newer than
`-ot` | Older than
`-ef` | Equal times

If you update one file, it appear newer than the other. Using `touch` is sufficient, without changing the file contents. This will also create the file if it does not exist.

```sh
touch file1.txt
touch file2.txt
[[ file2 -ef file2.txt ]]
# TRUE
```

If you update the modified time of two files at the same time, then you will get a success for `-ef`.

```sh
touch file1.txt file2.txt
[[ file1.txt -ef file2.txt ]]
# TRUE
```
