---
title: uname
description: Print system information
---

## Help

See OSX [Manpage](https://ss64.com/osx/uname.html).

CLI help for Linux (macOS gives an error on `-h` or `--help`).

```console
$ uname --help
Usage: uname [OPTION]...
Print certain system information.  With no OPTION, same as -s.

  -a, --all                print all information, in the following order,
                             except omit -p and -i if unknown:
  -s, --kernel-name        print the kernel name
  -n, --nodename           print the network node hostname
  -r, --kernel-release     print the kernel release
  -v, --kernel-version     print the kernel version
  -m, --machine            print the machine hardware name
  -p, --processor          print the processor type (non-portable)
  -i, --hardware-platform  print the hardware platform (non-portable)
  -o, --operating-system   print the operating system
      --help     display this help and exit
      --version  output version information and exit

GNU coreutils online help: <https://www.gnu.org/software/coreutils/>
Full documentation at: <https://www.gnu.org/software/coreutils/
```

## Samples

### Kernel name

Use no flags or add `-s`.

On Linux and macOS:

```console
$ uname
Linux
```

```console
$ uname
Darwin
```

### Machine hardware

Sample 64-bit output from a Dell and macOS.

```console
$ uname -m
x86_64
```


### All

```sh
$ uname -a
Linux dell-lite 5.4.0-64-generic #72-Ubuntu SMP Fri Jan 15 10:27:54 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
```
