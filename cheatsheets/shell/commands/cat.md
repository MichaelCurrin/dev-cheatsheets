# cat


## Manpage

```
NAME
       cat - concatenate files and print on the standard output

SYNOPSIS
       cat [OPTION]... [FILE]...

DESCRIPTION
       Concatenate FILE(s) to standard output.

       With no FILE, or when FILE is -, read standard input.
...
```


## Usage

```
cat [OPTIONS] FILE...
```

## Common situations

### Display file contents

Output the content of a single file.

```sh
$ cat myfile.txt
```

Output the content of multiple files sequentially.

```sh
$ cat file1.txt file2.txt
```

### Concatenate files

Combine files and output them to a new file.

```sh
$ cat file1.txt file2.txt > combined.txt
```

### Display line numbers

Number all output lines.

```sh
$ cat -n myfile.txt
```

### Display non-printing characters

Show all characters including non-printing characters.

```sh
$ cat -v myfile.txt
```
