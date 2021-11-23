# Basics

| Symbol | Description:                                                       |
| ------ | ------------------------------------------------------------------ |
| `^`    | Start of a string                                                  |
| `$`    | End of a string                                                    |
| `.`    | Wildcard - matches any character, except a newline                 |
| `|`    | Matches a specific character or group of characters on either side |
| `\`    | Escape a special character                                         |

e.g. Any word characters between literal brackets

```re
\(\w+\)
```

e.g. 10 digits

```re
.{10}
```

e.g. Match `a` or `b`

```re
a | b
```

e.g. Empty line:

```re
^$
```
