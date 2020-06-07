# Check OS


## Display

### OS type

```sh
echo $OSTYPE
```
e.g.
- macOS
    ```
    darwin19.0
    ```
- Linux
    ```
    linux-gnu
    ```

### uname

```sh
$ uname
```
e.g.

- Linux
    ```
    Linux
    ```

## Set boolean

Based on Grails quickstart which uses `case` and `uname`.

```sh
IS_MAC=false
IS_LINUX=false

case "$(uname)" in
  Darwin* )
    IS_MAC=true
    ;;
  Linux* )
    IS_LINUX=true
    ;;
esac
```

```sh
if [[ $IS_MAC == 'true' ]]; then
  echo 'Hello, macOS!'
fi
```


## Inline control flow

Perform a check inline to produce a string. Note this could be improved by first storing a value.

```sh
$ echo "Hello $([[ "$OSTYPE" == "darwin"* ]] && echo 'Mac')"
```
Result if Mac: `Hello Mac`

Result if not Mac: `Hello`
