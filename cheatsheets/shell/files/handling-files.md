# Handing files


## Resources

- [Bash redirections cheatsheet](https://catonmat.net/ftp/bash-redirections-cheat-sheet.pdf) on [catonmat.net](catonmat.net)
- [Bash one-liners tutorial](https://catonmat.net/bash-one-liners-explained-part-three)


## Search

```sh
$ locate FILENAME
```


## Find executable

Show location of an executable that is in a `bin` directory.

```sh
$ which myscript
```

Edit the file.

```sh
$ open $(which myscript)
```

Use `code` in place of `open`, to use VS Code IDE.


## List

Pass output as a list, where using a pipe is not possible.

```sh
COMMAND <(COMMAND)
```

e.g.

```sh
source <(kubectl completion bash)
diff <(ls dirA) <(ls dirB)
```


## Conditions


See [guide](https://linuxize.com/post/bash-check-if-file-exists/)

### How to check

```sh
if [[ -f "$FILE" ]]; then
    echo "$FILE exist"
fi
```

```sh
[[ -f "$FILE" ]] && echo 'yes' || echo 'no'

x=$([[ -f "$FILE" ]] && 'yes' || 'no')

# Use curly braces. Maybe round brackets?
[ -f "$FILE" ] && { echo "$FILE exist"; cp "$FILE" /tmp/; }
```

### Path check options

```
[[ -e FILE ]] 	Exists
[[ -h FILE ]] 	Symlink
[[ -d FILE ]] 	Directory

[[ -s FILE ]] 	Size is > 0 bytes

[[ -f FILE ]] 	File

[[ -r FILE ]] 	Readable
[[ -w FILE ]] 	Writable
[[ -x FILE ]] 	Executable

[[ FILE1 -nt FILE2 ]] 	1 is more recent than 2
[[ FILE1 -ot FILE2 ]] 	2 is more recent than 1
[[ FILE1 -ef FILE2 ]] 	Same files
```
