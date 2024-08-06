---
description: Working with environment variables in Python
---
# Environment

We typicall use the Python [os](https://docs.python.org/3/library/os.html) library for environment variables.

Using `os.environ` is the preferred way. Avoiding using `os.getenv('FOO')` and `os.putenv('FOO')`, since the latter does not update `os.environ`.

Related - see [dot-env][] cheatsheet for reading environment variables in your Python application.

[dot-env]: {% link cheatsheets/python/configs/dotenv.md %}


## Read values

Set the values in Bash first:

```sh
$ FOO=bar python main.py
```
Or
```sh
$ export FOO=bar
$ python main.py
```

Read the values in Python:

```python
import os


os.environ['FOO']
# bar

# Safely in case the variable is not set.
os.environ.get('FOO', 'fallback-value')
# fallback-value
```


## Set values

```python
import os


os.environ['FOO'] = 'bazz'

os.environ['FOO']
# 'bazz'
```
