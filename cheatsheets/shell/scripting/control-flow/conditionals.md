# Conditionals

How to use flags when doing a test.


## How to use

These work


### Bracket

with new sytanx with left hard bracket built-in command:

```sh
[[ -f my-file.txt ]]

# OR
[ -f my-file.txt ]
```


### test command

And old syntax with `test` command:

```sh
test -f my-file.txt
```

The brackets syntax looks weird on its own as a flag apparently by itself, but if you look at the old style then the flag was actually for the `test` command and makes more sense.

### if statement

Use `test` or `[` with an `if` statement.

```sh
if [[ -f my-file.txt ]]; then
  echo 'File exists'
fi
```

See also [if else][] section for more info on how to do tests and `if` statements.

[if else]: {% link cheatsheets/shell/scripting/control-flow/if-else.md %}


## String conditions

Examples are not show for all, since the patter is the same.

### Empty

```sh
-z STRING
```

e.g.

```sh
[[ -z "$MY_VAR" ]]
```

Same as:

```sh
[[ "$MY_VAR" = '' ]]
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

Double is newer and close to other languages.

```sh
STRING == STRING
```

Single equals sign is old and still supported.

```sh
STRING = STRING
```

e.g.

```sh
[[ "$MY_VAR" == 'abc' ]]
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

| Operator | Description              |
| -------- | ------------------------ |
| `-eq`    | equal                    |
| `-nq`    | not equal                |
| `-lt`    | less than                |
| `-le`    | less than or equal to    |
| `-gt`    | greater than             |
| `-ge`    | greater than or equal to |

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
```

e.g. Check if file exists.

```sh
[[ -f file.txt ]]
```

e.g. Check if file is missing.

```sh
if [[ ! -f file.txt ]]; then
  echo 'ERROR: file.txt missing'
  exit 1
fi
```

| Operator | Description                 |
| -------- | --------------------------- |
| `-e`     | Exists - file or directory. |
| `-s`     | Size is non-zero            |
| `-f`     | File                        |
| `-d `    | Directory                   |
| `-h `    | Symlink                     |
| `-r`     | Readable                    |
| `-w`     | Writable                    |
| `-x`     | Executable                  |

### Compare modified dates

These are all done as:

```sh
[[ PATH OPERATOR PATH ]]
```

| Operator | Description |
| -------- | ----------- |
| `-nt`    | Newer than  |
| `-ot`    | Older than  |
| `-ef`    | Equal times |

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


## Warning on quotes

It is recommended to always quote values. If you don't, you could get a syntax error.

This will break:

```sh
-z $NOT_A_VAR
```

As it could become

```sh
-z
```

This is fine:

```sh
-z "$NOT_A_VAR"
```

As it will become:

```sh
-z ""
```
