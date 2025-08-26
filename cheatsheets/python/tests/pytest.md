---
description: Python package. Great for getting into testing. Uses functions. Uses its own form of tests.
---
# PyTest

- [pytest docs](https://docs.pytest.org/en/latest/)

## Install

```sh
$ pip install pytest
```

## Sample test

Define a function starting with `test_*`.

```python
# test_sample.py
def inc(x):
    return x + 1

def test_answer():
    assert inc(3) == 5
```

## Run tests

Run all test suits:

```sh
$ pytest
```

Run targets - see [Usage docs](https://docs.pytest.org/en/latest/how-to/usage.html).

```sh
$ # Module
$ pytest test_abc.py
$ # Directory
$ pytest dir_name/
$ # Keyword. Exclude keywords.
$ pytest -k "MyClass and not method"
```

Run only failed tests:

```sh
$ pytest --last-failed
```

Run in parallel e.g. with 4 processes:

```sh
$ pytest -n 4
```

Run quietly - taken from PyCharm:

```sh
$ pytest --no-header --no-summary -q
```

### Parametrized tests

Here we have first case as `a=1` `b=2` `expected_result=3`:
```python
def add(a, b):
    return a + b


@pytest.mark.parametrize(
    "a, b, expected_result",
    [
        (1, 2, 3),
        (0, 0, 0),
        (-1, 1, 0)
    ],
    ids=["positive_numbers", "zeros", "negative_and_positive"],
)
def test_add_function_with_ids(a, b, expected_result):
    assert add(a, b) == expected_result
```
