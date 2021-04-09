# export

## Usage

```sh
$ export KEY=VALUE
```

Or set a value first and export it later.

```sh
$ KEY=VALUE
$ export KEY
```

Export multiple values:

```sh
$ export KEY1=VALUE1 KEY2=VALUE2
```

See exported variables:

```sh
$ export
COLORFGBG='15;0'
COLORTERM=truecolor
HOME=/Users/mcurrin
HOMEBREW_NO_AUTO_UPDATE=1
...
```

That includes some system-set variables and some variables that I exported in my configs like `~/.bashrc`.

### Examples

Here the `NAME` variable is not set, so we default to using `World`.

```sh
$ NAME=developer
$ bash -c 'echo "Hello, ${NAME}."
Hello, .
```

In the flow, we export a new variable.

```sh
$ export NAME=developer

$ bash -c 'echo "Subshell - hello, ${NAME}."'
Hello, developer.

$ echo "Outer shell - hello, $NAME."
Outer shell - hello, developer.
```

Or export an existing variable.

```sh
$ NAME=developer
$ export NAME
$ bash -c 'echo "Subshell - hello, ${NAME}."'
Subshell - hello, developer.
```


## Why do I need export

Here is when you _don't_ need `export`. If the variable is used in the same process.

```sh
$ NAME=developer
$ echo "Hello, $NAME!"
Hello, developer!
```

But if you run a _subprocess_, then that won't be able to access the environment variables a level higher.

For example if you have Node or Python script which looks for `NAME` on the environment variables. Or a shell script which uses `$NAME`.

Here we in a Bash subshell, passing commands inline with `-c` flag. Or we could have used a separate script and called it as `bash script.sh`.

```sh
$ NAME=developer
$ bash -c 'echo "Hello, $NAME."'
Hello, .
```

Now we use `export` to make the variable accessible in the subshell.

```sh
$ export NAME=developer
$ bash -c 'echo "Hello, $NAME."'
Hello, developer.
```


## Functions

Note: If you are in ZSH, then **first** run `bash -l` to make sure that you define and export the function in Bash, before using it in a Bash subshell.

```sh
foo () {
  echo "Foo $1"
}

foo bar
# Foo
echo $(foo bar)
# Foo bar
```

Export and use it in a subshell:

```sh
$ export -f foo
$ bash -c foo bar
Foo
```

Example use case:

```sh
$ export -f foo
$ find . -name README.md -exec bash -c 'foo $0' '{}' \;
Foo ./docs/README.md
Foo ./README.md
Foo ./vendor/bundle/ruby/2.7.0/gems/sass-3.7.4/README.md
```
