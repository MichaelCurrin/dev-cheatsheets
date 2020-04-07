# Files cheatsheet

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

Useful in a cronjob. Note this assumes global ma `MAILTO=''`

```sh
COMMAND 2>&1; [[ $? -ne 0 ]] || echo "$RESULT" | mail -s 'Unicron task!' $USER
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

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTU5NTc3MTgxN119
-->