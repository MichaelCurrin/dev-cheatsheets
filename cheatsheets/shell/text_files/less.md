# Less
	
	DESCRIPTION
	       Less  is a program similar to more (1), but which allows backward movement in the file as well as forward movement.  Also, less does not have to read the
	       entire input file before starting, so with large input files it starts up faster than text editors like vi (1).  Less uses termcap (or terminfo  on  some
	       systems), so it can run on a variety of terminals.  There is even limited support for hardcopy terminals.  (On a hardcopy terminal, lines which should be
	       printed at the top of the screen are prefixed with a caret.)

Add paging to piped output.

```sh
echo "Text" | less

git log | less
```

Compare with:

```sh
git log | cat
```

This prevents paging but loses color details.
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTQ0OTExOTcwNl19
-->