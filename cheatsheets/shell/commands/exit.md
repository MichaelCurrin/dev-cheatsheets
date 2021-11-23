# exit


## Success

```sh
$ exit
```

Prefer being explicit:

```sh
$ exit 0
```


## Error

Use any non-zero positive integer. Typically `1`.

```sh
$ exit 1
```


## Subshells


Using this bare in the CLI will exit the current terminal. If running inside a script and running the shell script, the script will exit.

```sh
$ exit 0
```

If you use brackets, then that is the exit code for subshell only. It doesn't exit the entire terminal or program.

```sh
$ (exit 0)
$ echo $?
0
```

```sh
$ (exit 1)
$ echo $?
1
```

### Chaining

Some basic chaining.

Note how success allows the st part to run.

```sh
$ (exit 0) && echo 'world'
hello
```

Here we prevent the last part from running so get no output.

```sh
$ (exit 1) && echo 'world'

```

Adding the first command inside the brackets, where you might do a test before exiting.

```sh
$ (echo 'hello' && exit 1) && echo 'world'
hello
```

Without brackets, the 3rd part won't run.

```sh
$ echo "hello" && exit 1 && echo 'world'
hello
```

Here the exit does nothing because we use `;` to ignore it, rather than `&&` for `AND`.

```sh
$ (echo "hello" && exit 1) ; echo 'world'
hello
world
```


## Conditional logic

You can use an `if` statement to print the help message and actually exit, which is expressive.

```sh
RESULT=$(some-task)
if [[ -z $RESULT ]]; then
  echo 'Output is empty'
  exit 1
fi
echo "Next step"
```

### Warning

Be careful of these. 


This will _always_ run the last bit, which is not useful.

```sh
true || echo "Your command failed" ; exit 1
echo "Next step"
```

And using brackets will not exist the entire script.

```sh
true || (echo "Your command failed" ; exit 1)
echo "Next step"
```
