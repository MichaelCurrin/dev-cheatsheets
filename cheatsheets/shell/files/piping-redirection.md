---
title: Piping and redirection
---


## Resources

- [Redirection](https://github.com/MichaelCurrin/learn-to-code/blob/master/Shell/Bash/tutorials/redirection.md) guide.
- [Pipes and Redirection](https://github.com/MichaelCurrin/learn-to-code/blob/master/Shell/Bash/beginning_linux_programming/pipes_and_redirection.md) guide.


## Redirect stderr to stdout

```sh
COMMAND 2> &1
```

This is not so useful in itself when just running in the console. But more useful when using crontab, `tee` or writing to a file.


## Redirect stderr and stdout to different files

```sh
COMMAND > stdout.txt 2> stderr.txt
```


## Redirect stderr and stdout to the same file


```sh
COMMAND > stdout_and_sterr.txt 2> &1
```

The `&1` is a pointer to where `stdout` is currently going. 


Similar, supported in all shells..

```sh
COMMAND &> stdout_and_sterr.txt
```

From [askubuntu.com question](https://askubuntu.com/questions/625224/how-to-redirect-stderr-to-a-file).


## Append stderr and stdout to the same file

Similar to above, but _append_ rather than overwrite.

```sh
COMMAND >> stdout_and_sterr.txt 2> &1
```

From [SO question](https://stackoverflow.com/questions/876239/how-can-i-redirect-and-append-both-stdout-and-stderr-to-a-file-with-bash)
