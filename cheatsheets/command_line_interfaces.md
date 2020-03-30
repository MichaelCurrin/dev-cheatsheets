# Command-line interfaces

How to write CLIs for applications such as in Bash or Python.


## By language

### Python

There are other Python libraries ([comparison article](https://realpython.com/comparing-python-command-line-parsing-libraries-argparse-docopt-click/), but these are the popular modern versions.

- **argparse**
    - [Argparse](https://docs.python.org/3/library/argparse.html) in PY3 docs.
    - Python builtin.
- **click**
    - [Click](https://readthedocs.org/projects/pallets-click/) versions on _Read The Docs_ with a choice of versions.
    - [Click](https://click.palletsprojects.com/en/master/) docs for _master_.
    - [Why Click?](https://click.palletsprojects.com/en/master/why/)
    - Install using `pip install click`.
    
### Bash

- **getops**
    - [Getopts tutorial](https://www.computerhope.com/unix/bash/getopts.htm)
    - [Bash builtins](https://www.gnu.org/software/bash/manual/html_node/Bourne-Shell-Builtins.html) in the Bash manual. Includes a section on _getopsts_.
   

## Examples

### Argparse

What the usage and help sections can appear - here using [Python](#python) `argparse`.

#### Positional arguments

```sh
python prog.py -h
```
```
usage: prog.py [-h] [--sum] N [N ...]

Process some integers.

positional arguments:
 N           an integer for the accumulator

optional arguments:
 -h, --help  show this help message and exit
```

Note that is help is included as an optional argument by default.

#### Optional arguments

Here is a flag with a value.

```sh
python myprogram.py --help
```
```
usage: myprogram.py [-h] [--foo FOO]

optional arguments:
 -h, --help  show this help message and exit
 --foo FOO   foo help
```

#### Groups

```
usage: PROG [--bar BAR] foo

group1:
  group1 description

  foo    foo help

group2:
  group2 description

  --bar BAR  bar help
  ```

#### Subcommands

```
usage:  [-h] {foo,bar} ...

optional arguments:
  -h, --help  show this help message and exit

subcommands:
  valid subcommands

  {foo,bar}   additional help
```

### Click

### Positional arguments

```
Usage: hello.py [OPTIONS] FOO
```

#### Optional arguments

```
Usage: hello.py [OPTIONS]

  Simple program that greets NAME for a total of COUNT times.

Options:
  --count INTEGER  Number of greetings.
  --name TEXT      The person to greet.
  --help           Show this message and exit.
```

## Usage guidelines

Help on writing usage instructions, especially when writing by hand.


### List of items

Zero or more items:

```
command [ITEM [ITEM ...]]
```

One or more items:

```
command ITEM [ITEM ...]
```

Often a comma is used in these usage instructions but it can be misleading if a comma is not needed in the literal answer.
