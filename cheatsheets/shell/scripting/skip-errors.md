# Skip errors

How to perform a command without causing the script to abort, either by not executing the command or forcing a success result.

The assumption is this set as start of the script such that any errors would cause the script to abort.

```sh
set -e
```

## Related

- [Status check][] cheatsheet

[Status check]: {{ site.baseurl }}{% link cheatsheets/shell/scripting/control-flow/status-check.md %}


## Default

Assume that `CMD` references a failing command such as running copy, move or remove on a file or folder that is not valid to operate on. e.g. `rm foo.txt` when `foo.txt` does not exist.

```sh
CMD
```

Run `echo $?` after and you'll see `1` or another error status code.

You'll also have any error messages logged on stderr.


## Continue without aborting

### OR and true to force success

If a step is optional or will only be needed sometimes (like deleting a temporary file which won't exist on the very first run).

```sh
CMD || true
```

If you run `echo $?` you'll see `0` for success, as it uses the exit code for the entire line above it (which will come from the last executed piece).

This works for variables and subshells too. 

Example - here using `npm outdated` which gives an error if there are packages to update, and capturing the output in a variable without aborting.

```console
$ OUTDATED=$(npm outdated)
$ echo $?
1
$ OUTDATED=$(npm outdated) || true
$ echo $?
0
```

Note, you could use `;` instead, but then the second bit will always run, which is unnecessary.

### If statement

Here we check if packages are up to date (code `0`) or outdated (code `1`). I don't know how to capture the output in a variable here, but you can do something to have it printed or write to `/dev/null` to make it silent.

```sh
if npm outdated > /dev/null; then
  echo 'Nothing to update'
  exit 0
fi

echo 'Upgrading'
npm update
```


## Hide error output

Silence stderr. Keep stdout.

```sh
CMD &> /dev/null
```


## Continue without aborting and fail silently

Combine the sections above:

```sh
CMD &> /dev/null || true
```


## Run conditionally

You could add a targeted `if` statement to check that a file or folder is already there or not, rather than using a catchall as in the previous sections.

You could check if file exists and is readable and is executable. Or just pick one of those tests.

```sh
# Optional command
if [[ -f foo.txt ]]; then
  rm foo.txt
fi

# More commands
```

Here is a directory check in one line.

```sh
# Optional command.
[[ -d foo ]] && rm -rf foo

# More commands
```


Maybe you want to check it is empty.

```sh
[[ -z foo.txt ]]
```

There could be multiple reasons for the command to fail and you'd have to catch them all.

Here is a DRY approach (replace `source` with `echo` to just print).

```sh
test -f ~/.git-completion.sh && source $_
```

That uses the last argument of previous command on the same line and uses it in place of `$_`.

Now this only works with the `test CONDITION` syntax. Using `[[ CONDITION ]]` ends up using `]]` instead of the path.

Compare with this (which works only works in interactive mode I think):

```sh
test -f ~/.git-completion.sh
source !$
```
Also in ZSH, you have to press enter a second time at the end to confirm the substitution.


## Set error flag

You could also reverse the error flag so that errors are not fatal. This can be especially useful for ignoring errors on a series of lines.

```sh
set -e

# Do stuff.

set +e
# Do stuff that can fail.

set -e

# Do more stuff.
```
