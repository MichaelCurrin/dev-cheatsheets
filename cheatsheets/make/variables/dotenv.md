---
title: Dotenv
description: Load and variables in a dotenv file
---

We're going to load an environment from a dotenv file and using the `source` command in the `Makefile`. Then the values in the dotenv file can be used as shell variables directly (like with `echo` or as arguments for a command) or accessed within a command on the enviroment variables.


## Source

Given dotenv file:

- `.env`
    ```sh
    MY_VAR=abc
    ```

```mk
test:
	source .env && echo "$$MY_VAR"
```

Notes:

- Variables are **not** persisted across lines in a target. So make sure to join the lines with `&&`.
- The variable is known to shell, but not to Make. You **cannot** access as Make variable like `echo $(MY_VAR)` here.


## Export

If you want to use the variable in a subshell (such as to access an environment variable), then you need add use of `export` on the Make variable. You don't need to set a value.

```mk
export MY_VAR

test:
	source .env && echo $$MY_VAR
	source .env && bash -c 'echo $$MY_VAR'  # Bash subshell.
	source .env && ./my_script              # Command that accesses MY_VAR.
```

### Defaults

You can set a default like this with `?=` or even plain `=` syntax. This default gets used if `MY_VAR` is **not** in `.env` at all. If it is included there as an empty value like `MY_VAR=''` then it will appear here as an empty variable.

```mk
export MY_VAR = my fallback
```
