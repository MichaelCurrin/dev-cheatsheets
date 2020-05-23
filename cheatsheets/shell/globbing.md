# Globbing shell cheatsheet
> How to match paths using "glob" patterns.  

Globbing is a programming concept that involves the use of wildcards and special characters to match and filter. Glob patterns are similar to regex patterns, but simpler and limited in scope.

This guide is based on Bash and ZSH.


## Resources

- [GNU/Linux Command-Line Tools Summary: Wildcards](http://tldp.org/LDP/GNU-Linux-Tools-Summary/html/x11655.htm)
- [Bash: globbing](http://tldp.org/LDP/abs/html/globbingref.html)
- [Wikipedia: glob (programming)](https://en.wikipedia.org/wiki/Glob_(programming))
- [Linux Programmer's Manual: GLOB(7)](http://man7.org/linux/man-pages/man7/glob.7.html)

[Source](https://github.com/begin/globbing/blob/master/README.md)


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

Some standard wildcards that are often used include:

    the asterisk (*) character for zero or more characters
    the question mark (?) character for any single character
    the [123] specifier, which indicates any of the characters 1, 2, or 3
    the [0-9] specifier, which indicates any number between 0 and 9 (or [a-z] for any letters between a and z).


## Advanced


Wildcard expansion can be done. This can be previewedd with `echo` but might be used with `ls`.

```sh
echo foo/{bar,baz}
# => foo/bar foo/baz
```

### POSIX character classes

You can also use named ranges, such as:

    [::alpha::] for any letter
    [::alnum::] for any letter or number
    [::lower::] for any lowercase character

e.g.  

Match `a1` but not `aa` with:

`[[:alpha:][:digit:]]`
<!--stackedit_data:
eyJoaXN0b3J5IjpbMzk4MjM5MTY0XX0=
-->