# Hash

## Basic

Use the builtin `hash` function.

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

Note that `hash(-1)` and `hash(-2)` are both equal to `-2` in CPython because `-1` is a reserved value for throwing an erro. See [StackOverflow](https://stackoverflow.com/questions/10130454/why-do-1-and-2-both-hash-to-2-in-cpython).

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
import hashlib

hashlib.sha224(b"Nobody inspects the spammish repetition").hexdigest()
# 'a4337bc45a8fc544c03f52dc550cd6e1e87021bc896588bd79e901e2'
```
