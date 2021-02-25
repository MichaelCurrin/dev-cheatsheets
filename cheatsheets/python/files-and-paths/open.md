---
title: open
description: Using the builtin `open` function in Python
---


## Context blocks

Using a `with` statement context block is more efficient and safer - avoiding memory leaks from file connections that are opened and never closed. The file connection is _always_ closed after you are done, even if there is an error in the context block.

```python
with open(path) as f_in:
    text = f_in.read()
```

Here is the long form.

```python
f_in = open(path):
text = f_in.read()
f_in.close()
```


## Modes

When you open a file path for read or write operations, you must set the access level.

There more modes, but these are the most common ones you'll need.

### Read

Typically, you can just read like this:

```python
open(path)
```

Which implies:

```python
open(path, 'r')
```

### Binary

If you need to read with **binary** mode you can do this. I find this is rarely useful. You might use it for a non-text file. Or if you have weird newline characters maybe from another operating system and you don't want them to automatically handled.

```python
open(path, 'rb')
```

### Write

Warning - this will overwrite an existing file. Also it does not have _read_ access, only _write_ access.

```python
open(path, 'w')
```

### Write and read

```python
open(path, 'w+')
```

Or `'r+`'.

e.g.

```python
with (open(path, 'w+') as f:
    # Old content.
    file_content = f.read()
    # Replace content.
    f.write('Hello, World')
```

### Append

Allow writing to a file but appending only - do not overwrite existing lines.

```python
open(path, 'a')
```
