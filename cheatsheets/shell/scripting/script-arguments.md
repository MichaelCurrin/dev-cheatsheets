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

```sh
echo $0
# /bin/bash
echo $1
# apple
echo $2
# banana
echo $3
# kiwi fruit
echo $4
#
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
        
