# Status check

Check the exit status of a previous command.


## Related

- [Skip errors][] cheatsheet.

[Skip errors]: {{ site.baseurl }}{% link cheatsheets/shell/scripting/skip-errors.md %}


## Check exit status value with if statement

This is a multi-line `if` statement, which is useful for more complex statements or if readability is important.

```sh
false

if [[ "$?" -eq 0 ]]; then
  echo 'Passed!'
else
  echo 'Failed!'
  exit 1
fi
```

Show message on failure only:

```sh
false

if [[ "$?" -ne 0 ]]; then
  echo 'Failed!';
  exit 1
fi
```


## Check exit status of command directly

An `if` statement is used. But we don't check `$?` but rather the command directly.

Here we check if packages are up to date (code `0`) or outdated (code `1`).

```sh
if npm outdated > /dev/null; then
  echo 'Nothing to update'
  exit 0
fi

echo 'Upgrading'
npm update
```


## One-liner status check

Check if the status of the **previous** command was a pass or fail. This can help if the command is long and you don't want to fit it on one line.

### Skip error

This will keep going and not abort the script.

```sh
$ [[ $? -eq 0 ]] && echo 'Passed!' || echo 'Failed!'
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

### Exit on error

Note brackets are needed.

```sh
$ false
$ [[ $? -eq 0 ]] && echo 'Passed!' || (echo 'Failed!'; exit 1)
```
