---
title: Pattern matching
description: Check if a string matchs a pattern
---

## Related

- [Globbing][]

[Globbing]: {{ site.baseurl }}{% link cheatsheets/shell/files/globbing.md %}


## Plain text matching

Test using `==` and a pattern with a `*` globstar and **no** quotes.

### Starts with

Given:

```sh
OSTYPE=darwin19.0
```

```sh
[[ "$OSTYPE" == darwin* ]] && echo 'Yes' || echo 'No'
# Yes
```

### Contains

```sh
MSG="I like dogs, don't you?"
[[ MSG == *dog* ]] && echo 'Yes' || echo 'No'
Yes
```


## Regex pattern matching

Use `=~` and a regex pattern.

```sh
[[ STRING =~ PATTERN ]]
```

Be sure to **not** use quotes on the pattern or you'll get unexpected behavior.

### Basic

No special functionality. Just string contains.

```sh
[[ "$PATH" =~ ruby ]] && echo 'Yes' || echo 'No'
```

### Starts with

```sh
[[ "$PATH" =~ ^/ ]] && echo 'Yes' || echo 'No'
```

```sh
[[ "main" =~ ^m ]] && echo 'Yes' || echo 'No'
# Yes
```

### List

```sh
FRUIT='apple'
[[ "$FRUIT" =~ banana|apple|orange ]] && echo 'Yes' || echo 'No'
# Yes
```

Negate:

```sh
if [[ ! "$FRUIT" =~ banana|apple|orange ]]; then
  echo 'Your fruit is not one of the allowed fruit
  exit 1
fi
```

### Pattern as a variable

Store your regex pattern as a variable and then use it later.

```sh
PATTERN='banana|apple|orange'

FRUIT='apple'
[[ "$FRUIT" =~ "$PATTERN" ]] && echo 'Yes' || echo 'No'
# Yes
```
