# Glob sheel cheatsheet

How to match paths using "glob" patterns.  These are similar to regex patterns, but simpler and limited in scope.

This guide is based on Bash and ZSH.

## Basics

[Source](https://github.com/begin/globbing/blob/master/cheatsheet.md)

Wildcard matches are used alongside literals.

Basic wildcards:

- `*` - Match any character zero or more times.
- `**` - Match any character zero or more times, including `/` unlike the others.
- `?` - Match any character one time.
- `[abc]` - Match any of the characters.

Example:
- `*/*` - will match `foo/bar`.
- `*` will match all files and directories in the current directory.
	```sh
	echo *
	
	ls *
	
	for P in *; do echo $P; done
	``` 

## Advanced


Wildcard expansion can be done. This can be previed with `echo` but might be used with `ls`.

```sh
echo foo/{bar,baz}
# => foo/bar foo/baz
```

### POSIX character classes

- `[[:alpha:][:digit:]]` -  match `a1` but not `aa`.
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTUyODg0NjUxMF19
-->