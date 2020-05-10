# Dotenv

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
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTc1MjM4NTg3N119
-->