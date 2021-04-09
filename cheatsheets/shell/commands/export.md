# export


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
