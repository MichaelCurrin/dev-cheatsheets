# Globbing shell cheatsheet
> How to match paths using "glob" patterns.

Globbing is a programming concept that involves the use of wildcards and special characters to match and filter. Glob patterns are similar to regex patterns, but simpler and limited in scope.

This guide is based on Bash and ZSH.


## Resources

- [GNU/Linux Command-Line Tools Summary: Wildcards](http://tldp.org/LDP/GNU-Linux-Tools-Summary/html/x11655.htm)
- [Bash: globbing](http://tldp.org/LDP/abs/html/globbingref.html)
- [Wikipedia: glob (programming)](https://en.wikipedia.org/wiki/Glob_(programming))
- [Linux Programmer's Manual: GLOB(7)](http://man7.org/linux/man-pages/man7/glob.7.html)
- [Globs](http://mywiki.wooledge.org/glob) Bash guide.

Some links copied from [begin/globbing](https://github.com/begin/globbing/blob/master/README.md)


## Basics

[Source](https://github.com/begin/globbing/blob/master/cheatsheet.md)

Wildcard matches are used alongside literals.

Basic wildcards:

- `*` - Match any character zero or more times.
- `**` - Match any character zero or more times, including `/` unlike the others.
- `?` - Match any single character one time.
- `[...]` - Match any of the characters. e.g. `[abc]`, `[123]`
- `[X-Y]` - Match a range. e.g. `[0-9a-z]`, `[\w]`

Example:
- `*/*` - will match `foo/bar`.
- `*` will match all files and directories in the current directory.
	```sh
	echo *

	ls *

	for P in *; do echo $P; done
	```


## Advanced


Wildcard expansion can be done. This can be previewed with `echo` but might be used with `ls`.

```sh
echo foo/{bar,baz}
# => foo/bar foo/baz
```

### POSIX character classes

You can also use named ranges, such as:

- `[::alpha::]` for any letter.
- `[::alnum::]` for any letter or number.
- `[::lower::]` for any lowercase character.

e.g.

Match `a1` but not `aa` with:

`[[:alpha:][:digit:]]`


## Globstar

See [globstar](globstar.md) page.
