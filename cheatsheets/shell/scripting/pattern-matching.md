---
title: Pattern matching
description: Check if a string matchs a pattern
---

See also ]Globbing][] section.

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

Be sure to **not** use quotes on the pattern or you'll get unexpected behavior.

```sh
[[ STRING =~ PATTERN ]]	
```

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
BRANCH='main'
[[ "$BRANCH" =~ master|main|dev|edge ]] && echo 'Yes' || echo 'No'
# Yes
```
