# Validate

Built-in string methods to help with validation.

- `isalnum`
- `isalpha`
- `isdigit`
- `islower`
- `isspace`
- `istitle`
- `isupper`

Examples:

```python
>>> 'abc d'.isupper()
False
>>> 'abc d'.islower()
True
```

Check if alphabet only characters. Note spaces will make this false.

```python
'abc d'.isalpha()
False
>>> 'abcd'.isalpha()
True
```

```python
>>> ' '.isspace()
True'
>>> ' \n\t'.isspace()
True
>>> 'a '.isspace()
False
```

```python
>>> 'Abc Def'.istitle()
True
>>> 'Abc def'.istitle()
False
```
