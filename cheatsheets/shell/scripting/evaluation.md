# Evalation

Here we evaluate a command using two approaches. This executes a subshell which does not have access to the outer env variables and runs in another process.

The result can be _executed_ directly.

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

Or use it in an `echo`.

```sh
$ echo "Ruby location $(which ruby)"
```
```
Ruby location /usr/local/opt/ruby/bin/ruby
```

But usually you'll usually store it.

```sh
$ X=$(which ruby)
$ echo "Ruby location: $X"
```
```
Ruby location: /usr/local/opt/ruby/bin/ruby
```


## Backticks versus brackets.

Using backticks is legacy syntax.

```sh
$ X=`which ruby`
```

Using `$()` which is more modern, easier to notice and allows nesting.

```sh
X=$(which ruby`
```
