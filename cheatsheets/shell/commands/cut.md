---
title: Cut
description: cut out selected portions of each line of a file

---

- [manpage](https://linux.die.net/man/1/cut) on Linux Die


## Help

```sh
$ man cut
```

```
NAME
     cut -- cut out selected portions of each line of a file

SYNOPSIS
     cut -b list [-n] [file ...]
     cut -c list [file ...]
     cut -f list [-d delim] [-s] [file ...]

DESCRIPTION
     The cut utility cuts out selected portions of each line (as specified by
     list) from each file and writes them to the standard output.  If no file
     arguments are specified, or a file argument is a single dash (`-'), cut
     reads from the standard input.  The items specified by list can be in
     terms of column position or in terms of fields delimited by a special
     character.  Column numbering starts from 1.
...
```

Note spaces are optional, so `-f3` and `-f 3` both work.


## Flags

Examples below assume this value. 


## Delimeter

```
     -d delim
             Use delim as the field delimiter character instead of the tab
             character.
```

Split on space.

```sh
$ cut -d ' '
```

Split on comma.

```sh
$ cut -d ' '
```

## Output fields

```
     -f list
             The list specifies fields, separated in the input by the field
             delimiter character (see the -d option.)  Output fields are sepa-
             rated by a single occurrence of the field delimiter character.
```

Note the list value is required and index starts at one (you'll get an error for zero).

### Item

```sh
cut -f INDEX
```

### Range

```sh
cut -f LOWER,UPPER
```


## Examples

Set up.

```console
$ VALUE="first second third fourth fifth"
```

Testing `cut`.

No delimeter set gets everything.

```console
$ echo $VALUE | cut -f 1
first second third fourth fifth
```

Split on space and get on item.

```sh
$ echo $VALUE | cut -f 1 -d ' '
first
$ echo $VALUE | cut -f 2 -d ' '
second
$ echo $VALUE | cut -f 3 -d ' '
third
```

Get more items.

```console
$ echo $VALUE | cut -f 1,2 -d ' '
first second
$ echo $VALUE | cut -f 3,3 -d ' '
third
$ echo $VALUE | cut -f 3,4 -d ' '
third fourth
```

Split on comma.

```console
$ VALUE="first,second,third,fourth,fifth"
$ echo $VALUE | cut -f 3,4 -d ','
third,fourth
$ echo $VALUE | cut -f 3 -d ','
third
```


## Date

Warning - there are two spaces between `Sun` and `3`. So you get different results depending on if you use quotes or not.

Third position:

```console
$ echo "$(date)" | cut -f 3 -d ' '
3
$ echo $(date) | cut -f 3 -d ' '
Oct
```

Second position:

```console
$ echo "$(date)" | cut -f 2 -d ' '

$ echo $(date) | cut -f 2 -d ' '
3
```
