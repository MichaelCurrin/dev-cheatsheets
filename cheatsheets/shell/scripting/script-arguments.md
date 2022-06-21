# Script arguments

## Count arguments

- `test.sh`
    ```sh
    echo $#
    ```

```sh
$ bash test.sh
0
$ bash test.sh abc def
2
```


## Get arguments

To avoid making an executing a script, for testing purposes you can use `set` to force setting the arguments for the current subshell environment.

```sh
set -- apple banana "kiwi fruit"
```

### Get one

The first is always the shell and not included in the count.

```sh
echo $0
# /bin/bash
```


```sh
echo $1
# apple
echo $2
# banana
echo $3
# kiwi fruit
echo $4
#
```

Use curly braces and quotes if you need double digits:

```sh
set -- a b c d e f g h i j k l m
echo "${11}"
# k
echo "$11"
# a1
```

### Get all

```sh
echo "$@"
# apple banana kiwi fruit
echo "$*"
# apple banana kiwi fruit
```

The difference matters more in a `for` loop.

- Quoted
    - `@` - treated as multiple items and any items with spaces in them are kept as a single item.
        ```sh
        for X in "$@"; 
          do echo "- $X"; 
        done
        # - apple
        # - banana
        # - kiwi fruit
        ```
    - `*` - treated as a one item.
        ```sh
        for X in "$*"; 
          do echo "- $X"; 
        done
        # - apple banana kiwi fruit
        ```
- Unquoted
    - `@` and `*` give the same result here. Newlines _and_ spaces separate data into items, constrast with quoted above.
        ```sh
        for X in $@; 
          do echo "- $X"
        done
        # - apple
        # - banana
        # - kiwi
        # - fruit
        ```
        
