# Expressions

## Related

- [Pattern matching][]

[Pattern matching]: {{ site.baseurl }}{% link cheatsheets/shell/scripting/control-flow/pattern-matching.md %}


## Match string

Replace `true` or `false` above with an expression.

Text check

```sh
x='abc'

if [[ "$x" == 'abc' ]]; then
  echo 'Yes!'
fi
# Yes!
```

## Check numeric condition

```sh
AGE=20

if [[ "$AGE" -ge 18 ]]; then
  echo 'Major!'
fi
# Major!
```

## Check maths condition

Use double brackets `$((CALC))` to evaluate a mathematical expression.

```sh
[[ "$(($a))" -eq "$(($b))" ]]
```

OR

```sh
[[ "$((a == b))" -ne 0 ]]
```
