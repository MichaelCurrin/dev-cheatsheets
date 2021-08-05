# Install types

Maybe this is a newer feature - I never ran into this before.

I got an error from Mypy on missing types.

These can be installed like this.


## Interactive

```sh
$ mypy --install-types --non-interactive
```

Then you have to enter <kbd>y</kbd> and press <kbd>Enter</kbd>.


## Non-interactive

Or simply do this:

```sh
$ mypy --install-types --non-interactive
```


## Error

You might get an error on the first run of the install.

```
error: Can't determine which types to install with no files to check (and no cache from previous mypy run)
```

So it looks like you need to run Mypy first and then install missing types. I don't know how to work this into a CI flow.


## Install by name


```sh
$ pip install types-requests
```

Based on:

```
Library stubs not installed for "requests" (or incompatible with Python 3.9)
...:13: note: Hint: "python3 -m pip install types-requests"
...:13: note: (or run "mypy --install-types" to install all missing stub packages)
...:13: note: See https://mypy.readthedocs.io/en/stable/running_mypy.html#missing-imports
```
