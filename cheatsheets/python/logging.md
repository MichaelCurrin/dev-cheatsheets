# Logging

## Links

- [logging](https://docs.python.org/3/howto/logging.html) in Python 3 docs.
- [logging](https://docs.python.org/3/library/logging.html#module-logging) Python 3 API

## Configuration

The default is to log WARNING level to stdout.

Here is a simple config setup from the docs.

```python
logging.basicConfig(filename='example.log', encoding='utf-8', level=logging.DEBUG)
```

## Log levels

- `logging.debug`
- `logging.info`
- `logging.warning`
- `logging.error`
- `logging.critical`


## Variable substitution

Pass literal values to logging message.

```python
logging.info("Hello %s, my name is %", "world", "Joe")
```

Or variables.


```python
name = 'world'
logging.info("Hello %s", name)
```

Using `extra` keyword, based on the docs.

```python
FORMAT = '%(asctime)s %(clientip)-15s %(user)-8s %(message)s'
logging.basicConfig(format=FORMAT)
logger = logging.getLogger('tcpserver')

d = {'clientip': '192.168.0.1', 'user': 'fbloggs'}
logger.warning('Protocol problem: %s', 'connection reset', extra=d)
```

Would print something like:
```
2006-02-08 22:20:02,165 192.168.0.1 fbloggs  Protocol problem: connection reset
```


### Built-in variables

See [LogRecord attributes](https://docs.python.org/3/library/logging.html?highlight=funcname#logrecord-attributes) in the docs.

Including some like:

- `%(filename)s` - name of the current file
- `%(funcName)s` - name of the function in current scope
- `%(thread)d` - thread ID if available
- `%(threadName)s` - thread name if available

## Levels

### Basic

```python
logger.debug(msg)
logger.info(msg)
logger.error(msg)
```

### Add error trace

```python
logger.exception(msg)
```

Equivalent to:

```python
logger.error(msg, exc_info=True)
```

This will log the stack trace of the current error, so you don't have to add `str(e)` to your message.

```python
try:
    # ...
except Exception as e:
    logger.exception(msg)
```

