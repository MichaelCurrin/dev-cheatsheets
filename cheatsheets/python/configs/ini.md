---
title: Ini
---

## Example

See [configparser](https://docs.python.org/3/library/configparser.html) in the PY3 docs.

### Storage

`config.ini`

```ini
[APP]
ENVIRONMENT = development
DEBUG = False

[DATABASE]
USERNAME: root
PASSWORD: p@ssw0rd
HOST: 127.0.0.1
PORT: 5432
DB: my_database

[LOGS]
ERRORS: logs/errors.log
INFO: data/info.log

[FILES]
STATIC_FOLDER: static
TEMPLATES_FOLDER: templates
```

### Use

```python
import configparser

config = configparser.ConfigParser()                                config.read("config.ini")

config.get('DATABASE', 'HOST')
config['DATABASE']['HOST']
```

### Validation

You can also add validation at retrieval time.

[getboolean](https://docs.python.org/3/library/configparser.html#configparser.ConfigParser.getboolean)

> This method is case-insensitive and recognizes Boolean values from `'yes'`/`'no'`, `'on'`/`'off'`, `'true'`/`'false'` and `'1'`/`'0'` [1](https://docs.python.org/3/library/configparser.html#id14).

```python
config.getboolean('my-key')
# => False
```

### Input files

Multiple config files can be read such as prod and dev settings or a repo or user-level file. Each overwrites the other. The advantage is that you only need to overwrite certain values in a later file - if the defaults are define in the first file.

From the [read](https://docs.python.org/3/library/configparser.html#configparser.ConfigParser.read) method in docs.

```python
config.read(
	['site.cfg', os.path.expanduser('~/.myapp.cfg')],
        encoding='cp1250'
)
```
