# Errors and warnings


ESLint can give log errors and warnings.


## Errors

Errors are around invalid syntax or using a variable that doesn't exist.


## Warnings

You can also enforce some styling and formatting issues which don't affect functionality. 

This is good for indenting code, wrapping lines, trailing semi-colons and trailing commas (for the last item in a structure). If you set up ESLint right, you might not even need Prettier.


## Rules

You configure a particular rule to fire as an error level, a warning level, or silently.


## Handle errors and warnings

ESLint will give a non-zero exit code if there are an errors. This can be useful in CI, git hooks or in chaining commands like `eslint . && npm run foo`. 

You may want your CI to **not** fail a deploy just because of just style warnings. This is the default behavior.

Note lack of `--fix` flag below, so these are just checks.

### Hide warnings

Hide warnings from the output and pass quietly if there are any warnings.

```sh
$ eslint . --quiet
```

### Fail on warnings

The cases below assuming no errors in a run. 

- The default behavior is to continue with a success status code if there any warnings. This is very tolerant of warnings.
- If there are 10 warnings then fail. This is tolerant, but will come up if the quality drops.
    ```sh
    $ eslint . --max-warnings 10
    ```
- This is strict. If there is at least 1 warning, then fail.
    ```sh
    $ eslint . --max-warnings 1
    ```

### CLI

From [CLI docs](https://eslint.org/docs/user-guide/command-line-interface).

- `--quiet` - Report errors only - default: `false`
- `--max-warnings Int` - Number of warnings to trigger nonzero exit code - default: `-1`

