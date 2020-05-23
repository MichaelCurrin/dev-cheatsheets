# Files and paths cheatsheet


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

Show files with and without leading dot.

```sh
ls (.)*
```

Same as this, but this only works with this command while the pattern above is more universal.

```sh
ls -A
```

```
     -A      List all entries except for . and ...  Always set for the super-user.

     -a      Include directory entries whose names begin with a dot (.).
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

### Redirect stderr to stdout

```sh
COMMAND 2>&1
```

This is not so useful in itself when just running in the console. But more useful when using crontab, `tee` or writing to a file.


### Redirect stderr and stdout to different files

```sh
COMMAND > stdout.txt 2> stderr.txt
```

### Redirect stderr and stdout to a file

The `&1` is a point to where stdout is currently pointing.

```sh
COMMAND > stdout_and_sterr.txt 2>&1
```

Similar, supported in all shells. Works for Bash.

```sh
COMMAND &> stdout_and_sterr.txt`
```

[askubuntu.com question](https://askubuntu.com/questions/625224/how-to-redirect-stderr-to-a-file)

### Append stderr and stdout to  a file

Similar to above, but _append_ rather than overwrite.

```sh
COMMAND >> stdout_and_sterr.txt 2>&1
```

[SO question](https://stackoverflow.com/questions/876239/how-can-i-redirect-and-append-both-stdout-and-stderr-to-a-file-with-bash)


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


### Check options

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
<!--stackedit_data:
eyJoaXN0b3J5IjpbNjQ1ODkyOTE0XX0=
-->