# Chain

Use a check in a chain, without usng `if-else`.

```console
$ true && echo 'True' || echo 'False'
True
```

Check if a value is set:

```sh
$ [[ -n "$FOO" ]] && echo 'FOO is set'
```


## Warning

When exiting, you probably want to show a message first. Those two operations do not work in the short syntax, as far as I can tell. So you must use an `if` statement, with `echo` and `exit` inside.

These will _not_ work as you might hope:

- This will _always_ exit, because the exit is evaluated independently after the semicolon.
    ```sh
    $ [[ -z "$MY_VAR" ]] && echo 'MY_VAR must be set' ; exit 1
    ```
- And this will never exit, as the exit line here happens within a _subshell_ - the subshell exits with an error status but the outer shell does not exit.
    ```sh
    $ [[ -z "$MY_VAR" ]] && (echo 'MY_VAR must be set' ; exit 1)
    ```
 
