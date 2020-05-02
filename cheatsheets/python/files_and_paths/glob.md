# Python glob cheatsheet


##

Use `glob1`.

Instead of `glob(pathname)`, use the `glob1(dirname, pattern)` method to get the filenames.

```python
>>> glob.glob1("some_dir", "*.png")
['foo.png', 'bar.png', ...]

>>> glob.glob("some_dir/*.png")
['/home/michael/A_dir/B_dir/some_dir/foo.png',
'/home/michael/A_dir/B_dir/some_dir/bar.png',
...]
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTIwNzg5MzgyMF19
-->