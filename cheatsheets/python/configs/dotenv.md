---
title: Dotenv
---

## Example


### Storage

Set ad-hoc values.

```sh
export MY_VARIABLE=abc
```

Or store in a file.

`.env`
```python
FOO=bar
BUZZ=123
```
Then load it:
```sh
export $(< .env | xargs)
```

### Use

```python
from os import environ


class Config:

    FOO = environ.get('FOO')
    BUZZ = environ.get('BUZZ')
```
