# Text files

Such as a `.txt` file, though this will work on any file that is text (i.e. not a zip or image or binary executable).

## Read text file

Given file with contents:

- `foo.txt`
    ```
    Line 1
    Line 2
    Line 3
    ```

### Process as needed

Instead of reading the whole file into memory, process lines as they are needed. Such as to print them or add to a database.

```python
with open(path) as f_in:
    for line in f_in:
        print(repr(line))
```

Result:

```python
'Line 1\n'
'Line 2\n'
'Line 3\n'
```

### File contents as a string

Get a file as a single string variable, with line breaks in it.

```python
with open(path) as f_in:
    text = f_in.read()
```

The value will be like:

```python
>>> text
"Line 1\And line 2\nLine 3\n"
```

### File rows as strings

Here we **split** that single string of the file text into a **list of strings**. Using the `str.splitlines` method.

```python
with open(path) as f_in:
    text = f_in.read()
    lines = text.splitlines()
```

Result:

```python
>>> lines
[
    "Line 1",
    "Line 2",
    "Line 3",
]
```

Note there are **no** trailing newline characters.

Get the line count with `len`:

```python
>>> len(lines)
3
>>> print(f"Line count: {len(lines)}")
Line count: 3
```

## Convert file to list

```python
with open(path) as f_in:
    lines = list(f_in)
    # OR
    lines = [l for l in f_in]
```

Result:

```python
>>> lines
[
    'Line 1\n',
    'Line 2\n',
    'Line 3\n'
]
```

Note the trailing newlines, which can be avoided by using another approach above.

### Read one line at a time

Read line by line, as you need a line. This is usually more memory efficient than reading the entire file into memory. And is more practical if you might only need the first few lines and then will close the file.

```python
def process_line(line):
    print(line)


with open(path) as f_in:
    for line in f_in:
        process_line(line)
```

### How to use seek

After you've the whole file, then Python will have moved open. If you try and read the file again it will appear empty.

So you'll have to close the file and open it again.

Or, you can use the seek method.

Use `f.seek(0)` to reset if you need to read the entire file multiple times.

Example, in the interactive console:

```python
>>> f_in = open('file.txt')

>>> f_in.read()   # It has content.
'First line\nSecond line\n'

>>> f_in.read()   # Appears empty
''

>>> f_in.seek(0)  # Reset.

>>> f_in.read()   # It has content again
'First line\nSecond line\n'
```

## Write text file

Write a list of strings as a multi-line file.

```python
my_list = [
  "Line 1 contents.",
  "And line 2."
]

with open(path, 'w') as f_out:
    f_out.writelines(my_list)
```

Write one line at a time.

```python
with open(path, 'w') as f_out:
    f_out.write('foo\n')
    f_out.write('bar\n')
```

Example path values:

- `text.txt` - same as `./text.txt`
- `foo/bar.txt` - path to file in a directory.
- An absolute path like `/home/michael/foo/bar.txt`

Don't use `~` - you need to expand that first.
