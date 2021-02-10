---
title: Options
Set shell options in a script or at a global level to change how the shell behaves
---


## Overview of how to set flags

### Shebang

```sh
#!/bin/bash -e
```

Multiple:

```sh
#!/bin/bash -eo pipefail
```

If you use `env`, you need to provide options in the body of the script.

```sh
#!/usr/bin/env bash
set -e
```

### CLI

On the CLI before running a command.

```sh
$ set -e
$ ./script.sh
```

Or

```sh
$ bash -e script.sh
```

Using minus will enable the flag to exit on error.

Using a plus sign will disable the flag.

```sh
set -e

set +e
```

## Options

From `man bash`.

```
-o optname
      True if shell option optname is enabled.  See the list of options under the description of the -o
      option to the set builtin below.
```

Provide `opname` as `errexit`, `noclobber`, `pipefail`, etc.


In the rest of this guide, some other flags are covered.


## Prevent accidental file overwrites

### Redirection

> Prevent output redirection using ‘>’, ‘>&’, and ‘<>’ from overwriting existing files. [source](https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html#The-Set-Builtin)

```sh
set -C
# OR
set -o noclobber
```

When this flag is enable, using `> file` will give an error.

Using `>| file` seems to force.

This is useful to set in your `~/.bashrc` file, so it is always set globally.


### Copy and move

Here is an alternative, using aliases and flags instead of shell optios.

[source](https://unix.stackexchange.com/questions/452865/are-there-any-disadvantages-of-setting-noclobber)

```sh
alias cp='cp -i'
alias mv='mv -i'
```

## Exit on error

- Using `set` [docs](https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html#The-Set-Builtin).
    ```sh
    set -e
    ```
- Using CLI option.
    ```sh
    $ bash -e
    $ # OR
    $ bash -o errexit
    ```
- In a shebang. Only works with `#!/bin/bash` and not `#!/usr/bin/env bash`.
    ```sh
    #!/bin/bash -e

    echo 'Hello!'
    ```
- Setting in he body of the script.
    ```sh
    #!/usr/bin/env bash

    set -e
    echo 'Hello!'
    ```


## Pipe fail

```
-o pipefail
```

Based on  example from CircleCI.

```sh
#!/bin/bash -eo pipefail
```

From `man bash`:

```
  pipefail
          If set, the return value of a pipeline is the value of the last (rightmost)  com-
          mand to exit with a non-zero status, or zero if all commands in the pipeline exit
          successfully.  This option is disabled by default.
```


## Verbose

Print a trace of commands before running.

```sh
set -x
```

Or

```sh
$ bash -x my_script.sh
```
