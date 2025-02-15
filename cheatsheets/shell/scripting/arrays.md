# Arrays

[Arrays](https://www.gnu.org/software/bash/manual/html_node/Arrays.html) reference in GNU docs.


## Overview

```sh
$ MONTHS=("Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" 
  "Aug" "Sep" "Oct" "Nov" "Dec")
```

Get elements:

```console
$ echo ${MONTHS[9]}
$ echo "${MONTHS[@]}"
```

Note that using `echo` or piping to another command will usually mean all the contents are shown on one line.

## Create

Create using brackets and spaces:

```sh
X=()

X=(abc def ghi)
```

Or newlines.

```sh
X=(abc
def
ghi)
```

Or the old style.

```sh
declare -A X
```


## Slice

### Get one element

Any invalid index here returns nothing and also a success code.

In ZSH the index starts at 1.

```console
> echo ${MONTHS[1]}
Jan
> echo ${MONTHS[4]}
Apr
```

### Bash

In Bash it starts at 0.

```console
> echo ${MONTHS[0]}
Jan
> echo ${MONTHS[3]}
Apr
```

### Get all

```console
> echo $MONTHS[@]
Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec
```




## Iterate

Given array:

```sh
MY_ARRAY=(abc def ghi)
```

### New syntax

ZSH and Bash 4.

```sh
for X in $MY_ARRAY[@]; do
  echo $X
done
```
```
abc
def
ghi
```

### Old

For Bash 3 - you need braces. Otherwise you'll only get the first element.

```sh
for X in ${MY_ARRAY[@]}; do
  echo $X
done
```

Or without an array variable:

```sh
for X in abc def ghi; do
  echo $X
done
```
```
abc
def
ghi
```


## Modify array

```sh
X[2]=zzz
echo $X[2]
# zzz
```


## Convert arguments to an array

```sh
MY_ARRAY=("$@")
```

Based on this [StackOverflow thread](https://stackoverflow.com/questions/12711786/convert-command-line-arguments-into-an-array-in-bash).


## Strings

You can also slice a string.

```sh
X=abc
echo "$X[1]"
# a
echo "$X[2]"
# b
echo "$X[@]"
# abc
```
