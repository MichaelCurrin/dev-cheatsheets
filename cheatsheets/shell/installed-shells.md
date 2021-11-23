# Installed shells


## Locations

Typical locations of shells are covered below. This is useful in the terminal and in scripts (where the target shell is set in the first line). For terminal use where you do not need to be specific, the name will be fine e.g. `bash` rather than `/bin/bash`.

- Bash - `/bin/bash`
- ZSH - `/bin/zsh`
- Dash - `/bin/dash`


### The SH shell

Historically for the Bourne Shell, before Bash, the `sh` form is faster and lacks some features. It is usually **aliased** to `dash` on Debian or to Bash on other systems. 

Read more [here](https://www.linuxquestions.org/questions/programming-9/difference-between-bin-bash-and-bin-sh-693231/).

```sh
/bin/sh
```

### List your installed shells

Here with output from macOS.

```console
$ ls -1 /bin/*sh
bash
csh
dash
ksh
sh
tcsh
zsh
```
