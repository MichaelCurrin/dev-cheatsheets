---
title: Options
description: Set shell options in a script or at a global level to change how the shell behaves
---

This applies both for shell scripting and running commands in interactive CLI.

This page is focussed on `bash` but behavior should be similar for `zsh`.


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


## Options flag

From `man bash`.

```
-o optname
      True if shell option optname is enabled.  See the list of options under the description of the -o
      option to the set builtin below.
```

Provide `opname` as `errexit`, `noclobber`, `pipefail`, etc.

Omit `optname` to print values.

```sh
$ bash -o
```
```
allexport       off
braceexpand     on
emacs           on
errexit         off
errtrace        off
functrace       off
hashall         on
histexpand      on
history         on
ignoreeof       off
interactive-comments    on
keyword         off
monitor         off
noclobber       off
noexec          off
noglob          off
nolog           off
notify          off
nounset         off
onecmd          off
physical        off
pipefail        off
posix           off
privileged      off
verbose         off
vi              off
xtrace          off
```


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


## Error trace

```
-o errtrace
-E
```

From the man page:

```
  -E      If  set, any trap on ERR is inherited by shell functions, command substitutions, and com-
          mands executed in a subshell environment.  The ERR trap is normally not inherited in such
          cases.
```


## Pipe fail

See more info in [Piping][] cheatsheet.

[Piping]: {{ site.baseurl }}{% link cheatsheets/shell/scripting/input-output.md %}

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

```
-v      Print shell input lines as they are read.
```


## Xtrace

From the man page:

```
-o xtrace
-x
```

From the docs:

```
-x      After expanding each simple command, for command, case command, select command, or arith-
        metic for command, display the expanded value of PS4, followed by  the  command  and  its
        expanded arguments or associated word list.
```


## Dashes

```
  --      If no arguments follow this option, then the positional parameters are unset.  Otherwise,
          the positional parameters are set to the args, even if some of them begin with a -.
  -       Signal the end of options, cause all remaining args to  be  assigned  to  the  positional
          parameters.   The -x and -v options are turned off.  If there are no args, the positional
          parameters remain unchanged.
```
