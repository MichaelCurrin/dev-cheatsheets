# Truncate

Truncate long strings.

```python
import textwrap


textwrap.shorten("Hello  world!", width=12)
# => 'Hello world!'
textwrap.shorten("Hello  world!", width=11)
# > 'Hello [...]'
textwrap.shorten("Hello world", width=10, placeholder="...")
# => 'Hello...'
```

[source](https://stackoverflow.com/questions/2872512/python-truncate-a-long-string)

```python
'{:.5}'.format('xylophone')
# => 'xylop'
```
