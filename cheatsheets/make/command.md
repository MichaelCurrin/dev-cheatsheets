# Command
> About the `make` command


## Usage

### Usage summary

```
Usage: make [options] [target] ...
```

e.g.

```sh
$ make foo
$ make f  # alias
$ make -n foo
$ make foo bar  # Two targets
$ FOO=1 make foo  # Pass env variable.
$ make foo FOO=1  # Pass env variable alternative.
```

### Flags summary

#### Dry run:=

```
  -n, --just-print, --dry-run, --recon
                              Don't actually run any commands; just print them.
```

Given `install:` as the default target and `h help:` as another target.

```sh
$ make -n
pip install pip --upgrade
pip install -r requirements-dev.txt --upgrade
```

```sh
$ make -n help
egrep '(^\S)|^$' Makefile
```

You can use the alias and you can move the option to the end.

#### Verbosity

```
  -d                          Print lots of debugging information.
  --debug[=FLAGS]             Print various types of debugging information.
  -s, --silent, --quiet       Don't echo commands.
  
```

#### Warnings
```
  --warn-undefined-variables  Warn when an undefined variable is referenced.
```

#### Input

```
  -f FILE, --file=FILE, --makefile=FILE
                              Read FILE as a makefile.
  -I DIRECTORY, --include-dir=DIRECTORY
                              Search DIRECTORY for included makefiles.                              
```

### Help

```sh
$ make --help
```

Output on macOS

```
Usage: make [options] [target] ...
Options:
  -b, -m                      Ignored for compatibility.
  -B, --always-make           Unconditionally make all targets.
  -C DIRECTORY, --directory=DIRECTORY
                              Change to DIRECTORY before doing anything.
  -d                          Print lots of debugging information.
  --debug[=FLAGS]             Print various types of debugging information.
  -e, --environment-overrides
                              Environment variables override makefiles.
  -f FILE, --file=FILE, --makefile=FILE
                              Read FILE as a makefile.
  -h, --help                  Print this message and exit.
  -i, --ignore-errors         Ignore errors from commands.
  -I DIRECTORY, --include-dir=DIRECTORY
                              Search DIRECTORY for included makefiles.
  -j [N], --jobs[=N]          Allow N jobs at once; infinite jobs with no arg.
  -k, --keep-going            Keep going when some targets can't be made.
  -l [N], --load-average[=N], --max-load[=N]
                              Don't start multiple jobs unless load is below N.
  -L, --check-symlink-times   Use the latest mtime between symlinks and target.
  -n, --just-print, --dry-run, --recon
                              Don't actually run any commands; just print them.
  -o FILE, --old-file=FILE, --assume-old=FILE
                              Consider FILE to be very old and don't remake it.
  -p, --print-data-base       Print make's internal database.
  -q, --question              Run no commands; exit status says if up to date.
  -r, --no-builtin-rules      Disable the built-in implicit rules.
  -R, --no-builtin-variables  Disable the built-in variable settings.
  -s, --silent, --quiet       Don't echo commands.
  -S, --no-keep-going, --stop
                              Turns off -k.
  -t, --touch                 Touch targets instead of remaking them.
  -v, --version               Print the version number of make and exit.
  -w, --print-directory       Print the current directory.
  --no-print-directory        Turn off -w, even if it was turned on implicitly.
  -W FILE, --what-if=FILE, --new-file=FILE, --assume-new=FILE
                              Consider FILE to be infinitely new.
  --warn-undefined-variables  Warn when an undefined variable is referenced.
  -N OPTION, --NeXT-option=OPTION
                              Turn on value of NeXT OPTION.

This program built for i386-apple-darwin11.3.0
Report bugs to <bug-make@gnu.org>
```
