# Files cheatsheet

## List files

```sh
ls
```

```sh
ls *
```

Recursive.

```sh
ls -R
```

List directories, rather than searching recursively.

```sh
ls -d DIR_NAME
```

Using `find`.

```sh
find .

find DIR_NAME
```

## Find executable

Show location of an executable that is in a `bin` directory.

```sh
which myscript
```

Edit the file.

```sh
open $(which myscript)
```

Use `code` in place of `open`, to use VS Code IDE.


## Piping and redirection

Links:

- [Redirection](https://github.com/MichaelCurrin/learn-to-code/blob/master/Shell/Bash/tutorials/redirection.md) guide.
- [Pipes and Redirection](https://github.com/MichaelCurrin/learn-to-code/blob/master/Shell/Bash/beginning_linux_programming/pipes_and_redirection.md) guide.

### Send errors to stdout

```sh
COMMAND 2>&1
```

### List

Pass output as a list, where using pipe is not possible.

```sh
COMMAND <(COMMAND)
```

e.g.

```sh
source <(kubectl completion bash)
diff <(ls dirA) <(ls dirB)
```

## Download and run

Use curl and execute the result.

e.g.
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

e.g.
```
curl -O -L https://github.com/actions/runner/releases/download/v2.168.0/actions-runner-linux-x64-2.168.0.tar.gz
```

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTI3OTQzMzQ0MSw5NDc0NjY1XX0=
-->