# Logging

## Variable substituation

```python
logger.info("Hello %s, my name is %", "world", "Joe")
```

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

