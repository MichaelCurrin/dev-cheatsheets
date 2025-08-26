---
description: Python builtin.
---
# Unittest

- [unittest docs](https://docs.python.org/3/library/unittest.html)

## Syntax

- Create a class which inherits from `unittest.TestCase`.
- Add methods that start with `test_*`.
- Add a call in the `__main__` check which runs `unittest.main()`.

## Sample tests

```python
# test_string_methods.py
import unittest


class TestStringMethods(unittest.TestCase):

    def test_upper(self):
        self.assertEqual('foo'.upper(), 'FOO')

    def test_isupper(self):
        self.assertTrue('FOO'.isupper())
        self.assertFalse('Foo'.isupper())

    def test_split(self):
        s = 'hello world'
        self.assertEqual(s.split(), ['hello', 'world'])
        # check that s.split fails when the separator is not a string
        with self.assertRaises(TypeError):
            s.split(2)


if __name__ == '__main__':
    unittest.main()
```

```python
# test_sum.py
import unittest


class TestSum(unittest.TestCase):

    def test_sum(self):
        self.assertEqual(sum([1, 2, 3]), 6, "Should be 6")

    def test_sum_tuple(self):
        self.assertEqual(sum((1, 2, 2)), 6, "Should be 6")


if __name__ == '__main__':
    unittest.main()
```

## Run

Run against a directory (module) with verbose flag.

```sh
python -m unittest -v test
```

Scan for `test*.py` files.

```sh
python -m unittest discover
```

Use `-s`and the name of a directory.
```sh
python -m unittest discover -s tests
```

Change to the `src/` directory, scan for all `test*.py` files inside the the `tests` directory, and execute them.

```sh
python -m unittest discover -s tests -t src
```

## Mocking and patching

Copied from the [docs](https://docs.python.org/3/library/unittest.mock.html).

### Mock return value

```python
from unittest.mock import MagicMock


thing = ProductionClass()
thing.method = MagicMock(return_value=3)
thing.method(3, 4, 5, key='value')

thing.method.assert_called_with(3, 4, 5, key='value')
```

### Patch a class

```python
from unittest.mock import patch


@patch('module.ClassName2')
@patch('module.ClassName1')
def test(MockClass1, MockClass2):
    # pass
```

### Patch a function

Add `return_value` or `side_effect` parameters if needed. For async, use `new_callable=AsyncMock`.

```python
from unittest.mock import patch


@patch('module.function_name')
def test(mock_function):
    pass
```

### Patch a method

```python
from unittest.mock import patch


def test():
    with patch.object(MyClass, 'my_method', return_value=None) as mock_my_method:
        thing = MyClass()
        thing.my_method(1, 2, 3)

    mock_my_method.assert_called_once_with(1, 2, 3)


# OR

@patch('module.MyClass.method_name')
def test(mock_method_name):
    pass
```

Mock the return value of an object instance on a class instance.

```python
@pytest.fixture(scope="function")
def mock_service():
    return Service(
        abc='123
    )

async def test_my_method(mock_service):
    mock_my_function_output = AsyncMock()
    mock_my_function_output.fizz.buzz = "dummy value"
    mock_service.my_object.my_function.return_value = mock_my_function_output

    result = await mock_service.my_method('ABC')

    assert result == "dummy value"
```
