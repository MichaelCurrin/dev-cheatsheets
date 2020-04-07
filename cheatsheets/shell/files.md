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


Pass output as a list, where using pipe is not possible.

```sh
COMMAND <(COMMAND)

# e.g.
source <(kubectl completion bash)
diff <(ls dirA) <(ls dirB)
```

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTY3NTI5NTE4XX0=
-->