---
description: Working with environment variables in Python
---
# Environment

We use the Python [os](https://docs.python.org/3/library/os.html) library.

Using `os.environ` is the preferred way. Avoiding using `os.getenv('FOO')` and `os.putenv('FOO')`, since the latter does not update `os.environ`.


## Setup

Run this in the shell to setup the environment.

```sh
FOO=bar python main.py

# OR
export FOO=bar
python main.py
```


## Read

```python
import os


os.environ['FOO']
# bar

# Safely.
os.environ.get('FOO', 'fallback')
# bar
```


## Update

```python
import os


os.environ['FOO'] = 'bazz'
```
