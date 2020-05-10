# Ini

## Example

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
TEMPLATES_FOLDER: templates```


```python
import configparser

config = configparser.ConfigParser()                                config.read("config.ini")

config.get('DATABASE', 'HOST')
config['DATABASE']['HOST']
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTU4NjEwMDg0XX0=
-->