# return

A built-in function to exit early and return an exit status.


## Where to run

This can be used

- in the CLI
- in a function.
- in a script outside a function, but only if run with `source SCRIPT`. This is similar to running as `exit`.

Otherwise you get this error:

> `return`: can only `return` from a function or sourced script


If you want to return output from a function, use `echo` rather - see [Functions][].

[Functions]: {% link cheatsheets/shell/scripting/functions.md %}


## Usage

### Success

```sh
return
```

Same as above but explicit.

```sh
return 0
```

### Failure

Similar to `exit 1` but won't abort scrit.

```sh
return 1
```


## Examples

### Function

Inside a function with a return, the script continues.

- `foo.sh`
    ```sh
    abc() {
      echo 'line 1'

      return 0

      echo 'line 2'
    }

    abc
    echo "Function exit status $?"

    echo 'line 3'
    ```

Run as:

```sh
$ bash foo.sh
```

This will print

```
line 1
Function exit status 0
line 3
```

If you use `1` or another integer for return, you get that.
```
line 1
Function exit status 1
line 3
```

### Global with source

- `foo.sh
    ```sh
    echo 'line 1'

    return 0

    echo 'line 2'
    echo 'line 3'
    ```

Run in the CLI:

```console
$ source foo.sh
line 1
```

Note the exit status now will be the return value. So these are similar:

- `return 0` - `exit 0`
- `return 1` - `exit 1`
