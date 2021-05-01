---
title: Redirection
description: Writing stderr and stdout to files
---


## Resources

- [Redirection](https://github.com/MichaelCurrin/learn-to-code/blob/master/Shell/Bash/tutorials/redirection.md) guide.
- [Pipes and Redirection](https://github.com/MichaelCurrin/learn-to-code/blob/master/Shell/Bash/beginning_linux_programming/pipes_and_redirection.md) guide.


## Send stderr and stdout to different files

```sh
$ COMMAND > stdout.txt 2> stderr.txt
```


## Send stderr to stdout

Send any error output to the same place as where `stdout` is going.

```sh
$ COMMAND 2> &1
```

This is not so useful in itself when just running in the console alone. But more useful when using crontab, `tee` or writing to a file. 


## Send stderr and stdout to the same file

Send `stdout` to a file and then send `stderr` there too.

```sh
$ COMMAND > stdout_and_sterr.txt 2> &1
```

Or, shorthand for the above.

```sh
$ COMMAND &> stdout_and_sterr.txt
```

Apparently supported in all shells.

From [askubuntu.com question](https://askubuntu.com/questions/625224/how-to-redirect-stderr-to-a-file).


## Append output

Append `stdout` to a file.

```sh
$ COMMAND >> stdout_and_sterr.txt
```

Also append `stderr` to that file.

```sh
$ COMMAND >> stdout_and_sterr.txt 2> &1
```

From [SO question](https://stackoverflow.com/questions/876239/how-can-i-redirect-and-append-both-stdout-and-stderr-to-a-file-with-bash)


## Hide all output from a command

```sh
$ COMMAND > /dev/null 2> &1
```

e.g.

```sh
if command -v node /dev/null > 2> &1; then
  echo 'Node is installed!'
else
  echo 'Node is not installed :('
fi
```


## Store file as a variable

```sh
$ CONTENT=$(< file.txt)
```
