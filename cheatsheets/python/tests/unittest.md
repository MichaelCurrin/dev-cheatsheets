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
