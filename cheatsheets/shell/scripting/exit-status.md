# Exit status

## Exit command

See Exit in the commands.

### Success

```sh
exit
# Same as
exit 0
```

### Error

```sh
exit 1
```


## Force success

The entire script will exit with the status of the last command, so you can force a success like this.

- `script.sh`
    ```sh
    false

    exit 0
    ```

This will always return a success.
```sh
$ bash script.sh
```


## Get exit status

```sh
$?
```

e.g.


```sh
$ true
$ echo $?
0
```

```sh
$ false
$ echo $?
1
```

If you use assignment, the status is retained.

```sh
X=$(false)
echo $?
1
```

Or in one line:

```sh
$ X=$(false) || echo $?
1
```

You could use `exit $?` above instead.

But otherwise it will be lost and remaing a success.

```sh
$ echo $(false)

$ echo $?
0
```

### Get status for subshell

From [Superuser.com](https://superuser.com/questions/363444/how-do-i-get-the-output-and-exit-value-of-a-subshell-when-using-bash-e).

How do I get the output and exit value of a subshell when using `bash -e`?  Using `$()` preserves the exit status. You just have to use it in a statement that has no status of its own, such as an assignment.

```sh
OUTPUT=$(INNER)
```

```sh
OUTPUT=$(INNER) || exit $?
echo $OUTPUT
```

Or

```sh
if ! OUTPUT=$(INNER); then
    exit $?
fi
echo $OUTPUT
```
