# Exclude

## Exclude characters

Use `^` inside `[]` to exclude. Note `a-z` will work and a `-` must be at the start of the end to match a literal `-`.

```re
[^\w-]
```

## Exclude words

Source: [regextester](https://www.regextester.com/15)

```re
^((?!badword).)*$
```

```
badword
test      # match
one two   # match
abadwords
three     # match
```

Multiple exclusions:

```re
?!(foo|bar)

?!(http|[{#])
```
