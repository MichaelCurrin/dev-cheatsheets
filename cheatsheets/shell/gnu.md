# GNU

How to install GNU (Linux) packages on a BSD system (macOS).


## coreutils

### Install

Install on macOS:

```sh
$ brew install coreutils
```

### Configure

You'll end up having access to two commands e.g. `gdate` and `date`.\

You can have the first one be preferred by following the CLI's recommendation:

```
==> coreutils
Commands also provided by macOS and the commands dir, dircolors, vdir have been installed with the prefix "g".
If you need to use these commands with their normal names, you can add a "gnubin" directory to your PATH with:
  PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
```

Result:

```console
$ which -a date
/usr/local/opt/coreutils/libexec/gnubin/date
/bin/date
```

Symlink:

```
/usr/local/opt/coreutils/libexec/gnubin/date -> ../../bin/gdate
```
