# bash

See more info in the [Options][] cheatsheet.

[Options]: {% link cheatsheets/shell/scripting/options.md %}


## Help

```sh
$ bash --help
```

```
GNU bash, version 5.0.17(1)-release-(x86_64-pc-linux-gnu)
Usage:  bash [GNU long option] [option] ...
        bash [GNU long option] [option] script-file ...
```
```
GNU long options:
        --debug
        --debugger
        --dump-po-strings
        --dump-strings
        --help
        --init-file
        --login
        --noediting
        --noprofile
        --norc
        --posix
        --pretty-print
        --rcfile
        --restricted
        --verbose
        --version
```
```
Shell options:
        -ilrsD or -c command or -O shopt_option         (invocation only)
        -abefhkmnptuvxBCHP or -o option
Type `bash -c "help set"' for more information about shell options.
Type `bash -c help' for more information about shell builtin commands.
Use the `bashbug' command to report bugs.

bash home page: <http://www.gnu.org/software/bash>
General help using GNU software: <http://www.gnu.org/gethelp/>
```


## Run script

Run script in subshell.

```sh
$ bash script.sh
```

Run in current shell - any changes to directory, variablets, etc. get persisted.

```sh
$ source script.sh
```

Run commands in subshell.

```sh
$ bash -c 'echo Hello'
Hello
```
```sh
$ bash -c 'echo Hello
echo World'
Hello
World
```
