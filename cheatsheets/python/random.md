# Random


## Documentation

See PY 3 documentation for [random](https://docs.python.org/3/library/random.html) module in the standard library.

See Examples and Recipes in those docs.


## General

```python
import random

random.random()
```

Or

```python
from random import random

random()
```


## Floats

Random float:  0.0 <= x < 1.0

```python
>>> random()
0.37444887175646646
```

Random float:  2.5 <= x < 10.0

```python
>>> uniform(2.5, 10.0)
3.1800146073117523
```

Interval between arrivals averaging 5 seconds

```python
>>> expovariate(1 / 5)
5.148957571865031
```


## Integers

Integer from 0 to 9 inclusive

```python
>>> randrange(10)
7
```

Even integer from 0 to 100 inclusive

```python
>>> randrange(0, 101, 2)
26
```


## Selection

### choice function

Single random element from a sequence.

```python
>>> choice(['win', 'lose', 'draw'])
'lose'

>>> choice('abcdef')
'f'
```

### choices function

Similar to `choice` but accepts an optional count to return.

```python
>>> choices(['win', 'lose', 'draw'])
['draw']

>>> random.choices(['win', 'lose', 'draw'], k=2)
['draw', 'lose']
```

```python
>>> random.choices('abcdef', k=10)
['e', 'c', 'a', 'e', 'e', 'd', 'e', 'a', 'c', 'b']
```

### sample function

Four samples without replacement.

```python
>>> sample([10, 20, 30, 40, 50], k=4)
[40, 10, 50, 30]
```


## Shuffle

Shuffle a list.

```python
>>> deck = 'ace two three four'.split()
>>> shuffle(deck)
>>> deck
['four', 'two', 'ace', 'three']
```


## Strings

Generate random text.

See [String Constants][] page for more info on the `string` module's values.

[String Constants]: {{ site.baseurl }}{% link cheatsheets/python/strings/constants.md %}

Note use of `.choices` to get multiple values.

```python
import random
import string


chars = string.ascii_lowercase

length = 20

''.join(random.choices(chars, k=length))
# 'sibuudijstpmozrmrfzp'
```

Or use `.choice` for a more verbose and possibly inefficient way.

```python
''.join(random.choice(letters) for _ in range(k))
# 'ohzeasftnbkvinijtkud'
```


## Passwords

The docs recommend the [secrets](https://docs.python.org/3/library/secrets.html#module-secrets) module.

> The secrets module is used for generating cryptographically strong random numbers suitable for managing data such as passwords, account authentication, security tokens, and related secrets.
>
> In particular, secrets should be used in preference to the default pseudo-random number generator in the random module, which is designed for modelling and simulation, not security or cryptography.


```python
>>> chars = string.ascii_uppercase + string.digits

>>> ''.join(random.SystemRandom().choice(chars) for _ in range(length))
'xgfzjbzgkogbrqvakutd'
```
