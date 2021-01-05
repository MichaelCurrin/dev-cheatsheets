# Arrays

[Arrays](https://www.gnu.org/software/bash/manual/html_node/Arrays.html) reference in GNU docs.


## Create

Create using brackets and spaces.

```sh
x=(abc def ghi)
```

Or newlines.

```sh
x=(abc
def
ghi)
```

Or

```sh
$ declare -A name
```


## Slice

Note that indexing is **not** zero-based, so the firs element is at index `1`.

```sh
$ echo $x[1]
abc
$ echo $x[2]
def
$ echo $x[3]
ghi
```

All elements.

```sh
$ echo $x[@]
abc def ghi
```

Any invalid index such as `0` or `4` here returns nothing and also success code.


## Iterate

```sh
MY_ARRAY=(abc def ghi)

for X in $MY_ARRAY[@]; do
  echo $X
done
```
```
abc
def
ghi
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
$ x[2]=zzz
$ echo $x[2]
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
