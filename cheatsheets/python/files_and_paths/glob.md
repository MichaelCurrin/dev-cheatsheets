# Python glob cheatsheet

How to matchs paths using "glob" patterns, which are similar to regex patterns.


## Glob rule basics

[Source](https://github.com/begin/globbing/blob/master/cheatsheet.md)

- `*` - Match any character zero or more times.
- `**` - Match any character zero or more times, including `/` unlike the others.
- `?` - Match any character one time.
- `[abc]` - Match any of the characters.


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
eyJoaXN0b3J5IjpbLTE2MzA4NzUxMDldfQ==
-->