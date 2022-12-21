# Glob

See also the [globbing][] in the Shell section of this guide.

[globbing]: {% link cheatsheets/shell/files/globbing.md %}


## Resources

- [glob](https://docs.python.org/3/library/glob.html) in the Python 3 docs.


## How to get a list files in a directory

From this [StackOverflow](https://stackoverflow.com/questions/29847426/python-glob-without-absolute-path/50065317#50065317) page, where my answer was the highest voted.

### File paths

Provide a path as a single argument. You get results as absolute paths.

```python
glob.glob("some_dir/*.png")
# => ['/home/michael/foo/bar/some_dir/a.png', '/home/michael/foo/baz/some_dir/b.png', ]
```

In this example, the current working directory was above `some_dir`, but you could change directory first and then run the glob using the short pattern `*.png`.

### Filenames

use a different method and provide two arguments as `glob1(dirname, pattern)`. You get results as filenames only.

```python
glob.glob1("some_dir", "*.png")
# => ['a.png', 'a.png', ...]
```


### Dotfiles

"Dotfiles" which start with a dot are not picked up using a star pattern (as in the shell if you did `ls *`). But, you can specify a leading dot.

```python
glob.glob('.c*')
# => ['.foo.bar']
```


## Functions

### Summary of use

#### glob

> Return a list of paths matching a pathname pattern.

```python
glob(path)
# e.g.
glob("foo/*.txt")
# => [ "foo/a.txt", "foo/b.txt" ]
```

#### glob0

For convenience to split directory and pattern. Note `dirname` cannot be `*` and neither can pattern.

```python
glob0(dirname, pattern)
# e.g.
glob0("foo", "*.txt")
# => [ ]
glob0("foo", "a.txt")
# => [ 'a.txt', 'b.txt' ]
```

#### glob1

For convenience to split directory and pattern. Note `dirname` cannot be `*`.

```python
glob1(dirname, pattern)
# e.g.
glob1("foo", "*.txt")
# => [ 'a.txt', 'b.txt' ]
```

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

### Escape

```python
escape(pathname)
```

> Escape all special characters.

### Helper functions

From [glob.py](https://github.com/python/cpython/blob/3.8/Lib/glob.py) in CPython on GitHub.

The `glob` module defines these public functions:

```
__all__ = ["glob", "iglob", "escape"]
```

But `glob0` and `glob1` are also available.

e.g.

```
import glob
glob.glob0(...)
from glob import glob0
glob0(...)
```
