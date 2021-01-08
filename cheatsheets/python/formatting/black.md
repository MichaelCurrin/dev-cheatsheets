# Black

Format with the [black](https://pypi.org/project/black/) command.


## Apply fixes

This is useful for local development.

This command will apply fixes in place and show any fatal errors.

```sh
$ black .
```

## Check

This is useful for a CI flow.

This command will print the fixes needed without applying them and exit with error status if fixes need to be applied.

```sh
$ black . --diff --check
```
