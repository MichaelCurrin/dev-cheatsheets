
# Common checks

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


## Check if variable is set

Abort the script if a check evaluates to false. Here we see if a variable is set.

Using `-z` for empty. 

```sh
if [[ -z "$MY_VAR" ]]; then
  echo 'MY_VAR must be set'
  exit 1
fi
```

Use `-n` for not empty.

```sh
$ [[ -n "$MY_VAR" ]] && echo "Value is set"
```

Note the brackets are needed, otherwise on a `true` evaluation of the first condition, the exit will still run.

Using `exit` is good for a script and not for direct terminal use otherwise you will close the terminal tab.

Or in multiple lines.

```sh
if [[ -z "$MY_VAR" ]]; do
  echo 'MY_VAR must be set'
  exit 1
fi
```


## Check if root user

```sh
if [ "$UID" -ne 0 ]; then
  echo 'I am not root'
fi
```


## Check if value in PATH

Check if `$HOME/.deno/bin` is in the `PATH` variable.

```sh
[[ "$PATH" == *$HOME/.deno/bin* ]] && echo 'yes' || echo 'no'
```


## Check if installed

```sh
if command -v node >/dev/null 2>&1; then
  echo 'Node is installed'
fi
```

Show an error and exit if a command is not available.

```sh
if ! command -v curl > /dev/null 2>&1;; then
  echo 'Please install `curl` and try again'
  exit 1
fi
```


## Check if in Git repo

```sh
error () {
  echo "ERROR: $1"
  exit 1
}

if [[ ! -d .git ]]; then
  error "Must be in the root of a Git repository."
fi
```
