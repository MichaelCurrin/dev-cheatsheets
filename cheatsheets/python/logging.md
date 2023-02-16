# Logging

## Variable substituation

```python
logger.info("Hello %s, my name is %", "world", "Joe")
```


### Built-in variables

See [LogRecord attributes](https://docs.python.org/3/library/logging.html?highlight=funcname#logrecord-attributes) in the docs.

Including:

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

