# Variable names

YAML is weird in that is supports a `dash` in a variable name.

```yaml
abc-def: 'xyz'

abc_def: 'xyz'
```

But, it is probably better to stick to underscores, to be consistent with programming languages. 

In other languages, a dash is actually a minus sign.

So 

```
abc-def
```

Means

```
abc - def
```
