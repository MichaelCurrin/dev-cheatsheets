# Python glob cheatsheet

How to match paths using "glob" patterns. 

These are similar to regex patterns, but simpler and limited in scope.


## Glob rule basics

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
	for P in *; do 
	``` 

In Bash, wildcard expansion can be done:

```
ls foo/{bar,baz}
# => ls foo/
```


## Get files in a directory

From this [StackOverflow](https://stackoverflow.com/questions/29847426/python-glob-without-absolute-path/50065317#50065317) page, where my answer was the highest voted.

### Filenames

Use the `glob1(dirname, pattern)` method to get the filenames.

```python
>>> glob.glob1("some_dir", "*.png")
['foo.png', 'bar.png', ...]
```

## File paths

```python

>>> glob.glob("some_dir/*.png")
['/home/michael/A_dir/B_dir/some_dir/foo.png',
'/home/michael/A_dir/B_dir/some_dir/bar.png',
....
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTY1NjA5NjUyXX0=
-->