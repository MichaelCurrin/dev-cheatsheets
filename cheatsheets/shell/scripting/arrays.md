# Arrays

[Arrays](https://www.gnu.org/software/bash/manual/html_node/Arrays.html) reference in GNU docs.


## Overview

```sh
$ MONTHS=("Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec")
$ echo ${MONTHS[1]}
$ echo ${MONTHS[@]}
```



## Create

Create using brackets and spaces.

```sh
X=(abc def ghi)
```

Or newlines.

```sh
X=(abc
def
ghi)
```

Or

```sh
$ declare -A X
```


## Slice

#### New

In ZSH and Bash 4 (?) the index starts at 1.

```sh
echo ${MONTHS[1]}
Jan
echo ${MONTHS[4]}
Apr
```

### Old

In Bash 3, it starts at 0.

```sh
$ echo ${MONTHS[0]}
Jan
$ echo ${MONTHS[3]}
Apr
```

Any invalid index here returns nothing and also a success code.

All elements. You can use `*` too but `@` seems most common.

```sh
$ echo $MONTHS[@]
Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec
```


## Iterate

```sh
MY_ARRAY=(abc def ghi)
```

### New

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


## Update

```sh
$ X[2]=zzz
$ echo $X[2]
zzz
```



## Strings

You can also slice a string.

```sh
x=abc
$ echo "$x[1]"
a
$ echo "$x[2]"
b
$ echo "$x[@]"
abc
```
