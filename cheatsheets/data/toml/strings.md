# Strings

## Basic

```toml
[my_section]
foo_double = "bar"
foo_single = 'bar'
escaped = "newline \n backslash \\"
```


## Heredoc

A heredoc. This allows you do not have to escape characters and also allows multi-line string.

The format uses triple double-quoted strings, as in Python. But, remember to add backslash to end lines or you'll get an error.

```toml
[my_section]
fizz = """buz \
  bazz \
"""
```

```toml
[alias]
	resetco = """! git reset HEAD \
		&& git checkout . \
		&& git status \
	"""
```

If you want to use single quotes, remember to escape them with a backslash, or they will disappear. Which is weird compared to other languages but that's how it works.

```toml
[alias]
	undo = """! [ -z \"$(git status --porcelain)\" ] \
		&& git reset --hard HEAD~ \
		|| echo 'Unstaged changes! Stash and try again' \
	"""
```
