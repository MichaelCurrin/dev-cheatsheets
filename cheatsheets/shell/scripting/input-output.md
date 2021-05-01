# Input and output

## Piping

Sending input to another command.

```sh
$ echo -e 'abc\ndef' | wc -l
2
```

Send literal output of a file listing command to the `wc` command.

```sh
$ find . -type f | wc -l
```

Send it to the `less` command.
```sh
$ find . -type f | less
```

## Subshell

Evaluate and send the file list output to the `wc` command.

```sh
wc -l $(find . -type f)
```

## Subshell and pipe

Chain more tools.

```sh
head $(find . -type f) | less
```


## Piping and exit code

### Default

> The shell does not exit if the command that fails is: (…)
> 
> any command in a pipeline but the last, or if the command’s return status is being inverted with !.
>
> The exit status of a pipeline is the exit status of the last command in the pipeline.

e.g. This script will see `cat` as a success and then run the `echo`.

```sh
#!/usr/bin/env bash

set -e

non_existent_cmd | another_non_existent_cmd | cat
echo "Hello"
```

```
bash: line 3: non_existent_cmd: command not found
bash: line 3: another_non_existent_cmd: command not found
Hello
```

### Pipefail

If the pipefail is enabled, the pipeline’s return status is the value of the last (rightmost) command to exit with a non-zero status, or zero if all commands exit successfully.

```sh
set -o pipefail
```

e.g. This script will exit before running the `echo`.

```sh
#!/usr/bin/env bash

set -eo pipefail

non_existent_cmd | another_non_existent_cmd | cat
echo "Hello"
```

