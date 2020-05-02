# Python glob cheatsheet

See [glob](/cheatsheets/shell/glob.md) in the Shell section.

## Resources

- [glob](https://docs.python.org/3/library/glob.html) in the Python 3 docs.

## Functions

### glob function

```python
glob.glob(pathname, *, recursive=False)
```

> Return a possibly-empty list of path names that match pathname, which must be a string containing a path specification. pathname
>
> can be either absolute (like /usr/src/Python-1.5/Makefile) or relative (like ../../Tools/*/*.gif), 
> 
> and can contain shell-style wildcards. 

> If _recursive_ is true, the pattern “`**`” will match any files and zero or more directories, subdirectories and symbolic links to directories.
>
> Note: Using the “**” pattern in large directory trees may consume an inordinate amount of time. 


### iglob function

```python
glob.iglob(pathname, *, recursive=False)
```

> Return an iterator which yields the same values as glob() without actually storing them all simultaneously.




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

### Dotfiles

Dot files are not picked up using a star (as in the shell), but you can specify a leading dot.

```python
glob.glob('*.gif')
# => ['card.gif']
glob.glob('.c*')
# => ['.card.gif']
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTk2OTA5MzY1N119
-->