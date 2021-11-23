---
title: Pattern matching
description: Check if a string matches a pattern
---

## Related

- [Globbing][]

[Globbing]: {% link cheatsheets/shell/files/globbing.md %}



## Plain text matching

### Equality

Use single or double equals sign - the same in newer shells.

```sh
[[ VARIABLE == VALUE ]]
```

e.g.

```sh
[[ "$NAME" == "Joe" ]]
```

### Starts with

Test using `==` and a pattern with a `*` globstar and **no** quotes.

```sh
# macOS
OSTYPE=darwin19.0

[[ "$OSTYPE" == darwin* ]] && echo 'Yes' || echo 'No'
# Yes
```

### Contains

A more specific case of pattern matching. Use `=` or `==`.

```sh
[[ VALUE == *NEEDLE* ]]
```

e.g.

```sh
MSG="I like dogs, don't you?"
[[ MSG == *dog* ]] && echo 'Yes' || echo 'No'
Yes
```

Note lack of quotes so that `*` gets expanded for the check. In this case `*` does not have to do with paths like it usually does.

```sh
GREETING='Hello, world'

[[ "$GREETING" = *lo* ]] && echo 'Match' || echo 'No match'
Match
```

Check if a string is in your OS type.

```sh
[[ "$OSTYPE" = *darwin* ]] && echo 'I'm a mac' || echo 'I'm not a mac'
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
FIRST=abc
SECOND=def

[[ "$FIRST" =~ '^d' ]] && echo 'Match' || echo 'No match'
# No match
[[ "$SECOND" =~ '^d' ]] && echo 'Match' || echo 'No match'
# Match
```

```sh
[[ "main" =~ ^m ]] && echo 'Yes' || echo 'No'
# Yes
```

```sh
[[ "$PATH" =~ ^/ ]] && echo 'Yes' || echo 'No'
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
  echo 'Your fruit is not one of the allowed fruit'
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
