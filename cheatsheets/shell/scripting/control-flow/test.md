# test

## Test command syntax vs hard bracket syntax

Note the older format of the `test` command:

```sh
test EXPRESSION
```

That is mostly replaced by:

```sh
[ EXPRESSION ]
```

And in some shell flavors such as Bash and ZSH, you can use double brackets which adds some extra functionality you might want.

```sh
[[ CONDITION ]]
```

But note that `dash` (on Ubuntu) is similar to Bash does **not** support double brackets. Why does this matter? if you use `sh` command on Ubuntu, you'll end up running `dash` and **not** `bash` and so will get a syntax error on double brackets.
