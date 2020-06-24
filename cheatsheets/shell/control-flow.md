# Control flow

Note the older format of `test CONDITION` is replaced by `[ CONDITION ]` and in some shell flavors extra functionality with `[[ CONDITION ]]`.

## Ignore file

```sh
CMD || true
```

Optionally hide output.

```sh
CMD > /dev/null || true
```

Or just

```sh
set -e

# ...

set +e
CMD
set -e
```


## Check file

If a file exists:

```sh
if [[ -f .env ]]; then
  cat .env
fi
```

If it does not exist:

```sh
if [[ ! -f .env ]]; then
  echo 'File is missing: .env'
fi
```

See [Bash cheatsheet](https://devhints.io/bash) for more info.


## One liner status check

Check if the status of the previous command was a pass or fail.

```sh
[[ $? -eq 0 ]] && echo 'Passed!' || echo 'Failed!'
```

Example use:

- Use the `true` commands to give a zero (pass) exit status.
  ```sh
  $ true
  $ [[ $? -eq 0 ]] && echo 'Passed!' || echo 'Failed!'
  Passed!
  ```
- Use the `false` commands to give a non-zero (fail) exit status.
    ```sh
    $ false
    $ [[ $? -eq 0 ]] && echo 'Passed!' || echo 'Failed!'
    Failed!
    ```

Note the `exit` command is added here, but this is good for a script and not for direct terminal use otherwise you will close the terminal tab. Note the brackets to get the correct behavior.

```sh
[[ $? -eq 0 ]] && echo 'Passed!' || (echo 'Failed!'; exit 1)
```


## If statement

This is a multi-line `if` statement, which is useful for more complex statements or if readability is important.

```sh
if [[ $? -eq 0 ]]; then
  echo 'Passed!'
else
  echo 'Failed!'
  exit 1
fi
```

Show message on failure only:

```sh
if [[ $? -ne 0 ]]; then
  echo 'Failed!';
  exit 1
fi
```
