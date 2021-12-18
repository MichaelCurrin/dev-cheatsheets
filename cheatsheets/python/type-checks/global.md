# Global

How to set up a global variable with a null value and then set it later.


## Why null?

Note that a null variable is actually desirable here, at least for the Selenium case.

Setting this up is possible at the top of the module:

```python
from selenium import webdriver

driver = webdriver.Firefox()
```

But it launches the browser immediately. Which is not desirable when importing code or doing tests.

So we rather want to set it to be null and set it later.

```python
from selenium import webdriver

driver = None


def setup_driver():
    global driver
    driver = webdriver.Firefox()
```

Though, this presents challenges with types, which is what this page is about. Or at least partially solves.


## Optional

Set the value to be either `None` (the starting value) or a type (which it is set to later).

```python
VARIABLE: Optional[TYPE] = None
```

Or try `TYPE | None` in Python 3.10 syntax.

Here is an example:

```python
from selenium import webdriver
from selenium.webdriver.firefox.webdriver import WebDriver


driver: Optional[WebDriver] = None


def close() -> None:
    global driver
    driver.quit()


def setup_driver() -> None:
    global driver
    driver = webdriver.Firefox()
```

Though I still get this error from Mypy:

```
Item "None" of "Optional[WebDriver]" has no attribute "quit"
```


## No value

Or initialize without a value.

```python
VARIABLE: TYPE
```

This doesn't work so well, as then the variable will appear undefined in function scopes.

You rather give it value. You don't even need the type.

```python
VARIABLE = INITIALIZE()
```

Here is an example anyway.

```python
from selenium import webdriver
from selenium.webdriver.firefox.webdriver import WebDriver

driver: WebDriver


def close() -> None:
    driver.quit()
    
    
def setup_driver() -> None:
    driver = webdriver.Firefox()
    
setup_driver()
close()
```

Though, you'll get an error from the linter that the variable is undefined in the `close` function, because it can't tell if or when the variable will be set

Even this doesn't solve it:

```python
def close() -> None:
    global driver
    driver.quit()
```



## Set as None does not work

Note that you cannot set a value to be `None` and also another type.

```python
driver: WebDriver = None
# error: Incompatible types in assignment (expression has type "None", variable has type "WebDriver")
```

