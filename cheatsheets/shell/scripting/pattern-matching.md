---
title: Pattern matching
description: Check if a string matchs a pattern
---

See also Globbing section.

## Plain text matching

Test using `==` and `*` globstar.

Examples are for system with this environment variable:

```sh
OSTYPE=darwin19.0
```

### Starts with

```sh
[[ "$OSTYPE" == darwin* ]] && echo 'Yes' || echo 'No'
# Yes
```

### Contains

```sh
[[ "$OSTYPE" == *rwin* ]] && echo 'Yes' || echo 'No'
# Yes
```

Omitting leading `*`:

```sh
[[ "$OSTYPE" == rwin* ]] && echo 'Yes' || echo 'No' 
No
```


## Regex matching

Use `=~` and a regex pattern.
```sh
[[ STRING =~ PATTERN ]]	
```

### Basic

No special functionality. Just string contains.

```sh
[[ "$PATH" =~ "ruby" ]] && echo 'Yes' || echo 'No'
```

### Starts with

```sh
[[ "$PATH" =~ "^/" ]] && echo 'Yes' || echo 'No'
```

This will give an error as it is **not** valid regex:

```
"*ruby*"
```



