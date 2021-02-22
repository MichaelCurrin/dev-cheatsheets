# Evalation

Here we evaluate a command using two approaches. This executes a subshell which does not have access to the outer env variables and runs in another process.

## Base syntax

```sh
$(EXPRESSION)
```

Don't confuse with the maths evaluation syntax:

```sh
$ echo $((1 + 3))
4
```

### Backticks versus brackets

Using backticks is legacy syntax.

```sh
$ X=`which ruby`
```

Using `$()` which is more modern and easier to notice.

```sh
X=$(which ruby)
```

It also allows nesting, which is not possible with backticks.

e.g.

```sh
$($(EXPRESSION))
```


## Uses

### Store

Usually you'll store the value.

```sh
$ X=$(which ruby)
$ echo "Ruby location: $X"
```
```
Ruby location: /usr/local/opt/ruby/bin/ruby
```

```sh
$ DATE=$(date)
```

### Execute

The result can be executed without an in between step.

```sh
$(which ruby)
```

That is will get result as `/usr/local/opt/ruby/bin/ruby`.

And then run it for you.

```sh
$ /usr/local/opt/ruby/bin/ruby
```

Which starts an interactive session.

Variation:

```sh
$(which ruby) -v
```
```
ruby 2.7.2p137 ...
```

I've seen this approach for setting environment variables before, where you call some CLI script like for AWS. It generates a few environment variables as a multi-line string, which is executed line by line in the current space.

### Print

Ue it in an `echo`.

```sh
$ echo "Ruby location $(which ruby)"
```
```
Ruby location /usr/local/opt/ruby/bin/ruby
```
