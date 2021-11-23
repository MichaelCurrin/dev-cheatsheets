
# Wrap

Using the built-in `textwrap` module.


## Dedent

Remove common whitespace.

```python
text = textwrap.dedent("""\
    a
      b
    c
""")
print(text)
```
```
a
  b
c
```
