# Logging

## Links

- [logging](https://docs.python.org/3/howto/logging.html) in Python 3 docs.
- [logging](https://docs.python.org/3/library/logging.html#module-logging) Python 3 API

## Log levels

Built in methods for `logging` or a `logging.Logger` instance:

- `logging.debug`
- `logging.info`
- `logging.warning`
- `logging.error`
- `logging.critical`


### Note

Setting log level is **not** enough. You need to make sure to call `basicConfig` first or add handlers as on Configuration examples on page, otherwise it won't work.

```python
import logging

logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)

# This message will get ignored.
logger.info("This is an info message from your application.")
```


## Configuration

The default is to log `WARNING` level to stdout. You can specify a log level a output file as below.

### Configure and use the library directly

Here is a simple config setup from the docs. Without using a `logging.Logger` instance.

```python
import logging


logging.basicConfig(filename='example.log', encoding='utf-8', level=logging.DEBUG)

logging.info("Message")
```

### Configure and use a logger variable

Make a logger (as a global variable or class variable) and use it.

Here using `basicConfig` which affects all loggers including those for external packages.

```python
import logging

# Set up your application's logger.
logger = logging.getLogger(__name__)
logging.basicConfig(filename='example.log', encoding='utf-8', level=logging.INFO)

# Call the instance.
logger.info("Info message")
logger.debug("Debug message")

# Change the log level.
logger.setLevel(logging.INFO)
logger.info("Info message")
logger.debug("Debug message")
```

Using handlers for a specific logger, without `basicConfig`.

```python
import logging

# Set up your application's logger.
logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)

# Create a console handler.
console_handler = logging.StreamHandler()
console_handler.setLevel(logging.INFO)

# Create a formatter.
formatter = logging.Formatter("%(asctime)s - %(name)s - %(levelname)s - %(message)s")
console_handler.setFormatter(formatter)

logger.addHandler(console_handler)

# Prevent external packages from logging noisly at the info level.
logging.getLogger().setLevel(logging.WARNING)

# Example usage.
logger.info("This is an info message from your application.")
logger.warning("This is a warning message from your application.")
```

Note if you run the above multiple times, you'll log the same message multiple times. So check the handlers:

```python
def initialize_logger(name: str) -> logging.Logger:
    logger = logging.getLogger(name)
    logger.setLevel(logging.INFO)

    if not logger.hasHandlers():
        console_handler = logging.StreamHandler()
        console_handler.setLevel(logging.INFO)

        formatter = logging.Formatter(
            "%(asctime)s - %(name)s - %(levelname)s - %(message)s"
        )
        console_handler.setFormatter(formatter)

        logger.addHandler(console_handler)

        # Prevent external packages from logging noisily at the info level.
        logging.getLogger().setLevel(logging.WARNING)

    return logger

# Use an import like this from another module:
# from utils import initialize_logger

logger = initialize_logger(__name__)

logger.info("This is an info message from your application.")
logger.warning("This is a warning message from your application.")
```

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

