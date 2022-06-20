# Hash

## Basic

Use a builtin `hash` function.

Only works on hashable types - immutable values so not a list.

An integer is the same.

```python
>>> hash(1)
1
>>> hash(100000)
100000
>>> hash(-1000)
-1000
>>> hash(-1)
-2 # NB
>>> hash(-2)
-2
```

Other types.

```python
>>> hash(1.234)
539567264156004353
>>> hash('a')
6519807998810050271
>>> hash('b')
2346156457918776634
>>> hash('ab')
-3228631933982636868

```


## Hashlib

Using the builtin [hashlib](https://docs.python.org/3/library/hashlib.html) module.

e.g. to use the SHA256 algorithm.

```python
>>> import hashlib

>>> m = hashlib.sha256()

>>> m.update(b"Nobody inspects")
>>> m.update(b" the spammish repetition")
>>> m.digest()
b'\x03\x1e\xdd}Ae\x15\x93\xc5\xfe\\\x00o\xa5u+7\xfd\xdf\xf7\xbcN\x84:\xa6\xaf\x0c\x95\x0fK\x94\x06'
>>> m.digest_size
32
>>> m.block_size
64
```
