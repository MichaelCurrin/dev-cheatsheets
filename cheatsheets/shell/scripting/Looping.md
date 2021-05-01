# Looping

## For loop

Iterate over literal items separated by text.

```sh
for ITEM in abc def xyz; do
  echo "$ITEM"
done
# abc
# def
# xyz
```

Note that if you have a single item, it gets treated as an array of one item. It does not get iterated over a characters in a string, like in other languages.

```sh
for ITEM in abc; do
  echo "$ITEM"
done
# abc
```

Iterate over an array.

```sh
MY_ARRAY=(
  abc
  def
  ghi
)

for ITEM in ${MY_ARRAY[@]}; do
  echo "$ITEM"
done
# abc
# def
# ghi
```

In ZSH you can just `$MY_ARRAY` but in Bash you need to use `${MY_ARRAY[@]}`.

Note also that the shell uses array indexing starting at one, not zero.

```sh
echo ${MY_ARRAY[1]}
# abc
```

### NVM example
In this example, I want to delete Node version that were setup in NVM. But I can only pass one argument at a time.

First I get a list of versions.

I then copy and paste the version to delete and make a variable which is an array. Then I iterate over them and delete them.

```sh
VERSIONS=(        
    v8.0.0
    v8.15.0
    v10.0.0
    v10.15.0
    v11.0.0
    v12.1.0
    v12.18.4
    v13.11.0
    v14.9.0
)

for V in ${VERSIONS[@]}; do
    echo "$V"
    nvm uninstall "$V"
done
```

### C-style loop

```sh
for ((i = 0 ; i < 5 ; i++)); do
  echo "Number: $i"
done
# Number: 0
# Number: 1
# Number: 2
# Number: 3
# Number: 4
```

You can combine that with array indexing to look an item like `${MY_ARRAY[i]}`. Note that the array index must start at `1` and you also need to know the length the array. 

```sh
MY_ARRAY=(
  abc
  def
  ghi
)
for ((i = 1 ; i < 4 ; i++)); do
  V=${MY_ARRAY[i]}
  echo "Index: $i Value: $V"
done
# Index: 1 Value: abc
# Index: 2 Value: def
# Index: 3 Value: ghi
```

But, if you only need the item value and not the index, then ignore the C-style index and rather use the traditional Shell for loop which is cleaner
