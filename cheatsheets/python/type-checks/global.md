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

Though, this presents challenges with types, which is what this page is about.


## No value

This is the only approach I found that works.

Initialize without a value. This forces the typechecking to see it as initialized with a type and never has a `None` value.

```python
VARIABLE: TYPE
```

I had errors initially from the linter about the variable not set in the functions, but that went away.

e.g.

```python
# pylint: disable=global-statement,global-variable-not-assigned
from typing import Optional

from selenium import webdriver
from selenium.webdriver.firefox.webdriver import WebDriver

driver: WebDriver


def close() -> None:
    global driver
    driver.quit()
    
    
def setup_driver() -> None:
    global driver
    driver = webdriver.Firefox()
    
setup_driver()
close()
```


## Optional

Set the value to be either `None` (the starting value) or a type (which it is set to later).

```python
VARIABLE: Optional[TYPE] = None
```

Or with implied `None` initial value:

```python
VARIABLE: Optiona[TYPE]
```

Or in Python 3.10 syntax.

```python
VARIABLE: TYPE | None
```

Here is an example:

```python
from typing import Optional

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


## Note on setting as None

Note that you cannot set a value to be `None` and also another type.

```python
driver: WebDriver = None
# error: Incompatible types in assignment (expression has type "None", variable has type "WebDriver")
```

