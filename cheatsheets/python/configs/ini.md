# Ini

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

You can also add validation at retrieval time - to get boolean or numeric for example.

Multiple config files can be read such as prod and dev settings or a repo or user-level file. Each overwrites the other. The advantage is that you only need to overwrite certain values in a l
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTcxMjg3MjQyNl19
-->