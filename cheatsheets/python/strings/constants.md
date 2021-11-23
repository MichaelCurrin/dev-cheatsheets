# String constants

<!-- Dev tip - it is useful to keep the '>>>' approach here because then the syntax highlighting is used on the result and that makes escaped characters easier to read. -->

## Setup

This import is needed for the rest of this page. Load the built-in [string](https://docs.python.org/3/library/string.html) module.

```python
import string
```


## ASCII

```python
>>> string.ascii_lowercase
'abcdefghijklmnopqrstuvwxyz'
```

```python
>>> string.ascii_uppercase
'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
```

```python
>>> string.ascii_letters
'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
```


## Numbers

```python
>>> string.digits
'0123456789'
```

Mix like this:

```python
>>> string.ascii_uppercase + string.digits
'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
```


## Punctuation

```python
>>> string.punctuation
'!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~'
```


## Whitespace

```python
>>> string.whitespace
' \t\n\r\x0b\x0c'
```


## Printable

Numbers, ASCII, puncutation, and whitespace.

```python
>>> string.printable
'0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~ \t\n\r\x0b\x0c'
```


## String to list

```python
>>> letters_str = string.ascii_uppercase + string.digits
>>> letters_str
'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
>>> letters_list = list(letters_str)
>>> letters_list
['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 
 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
```
