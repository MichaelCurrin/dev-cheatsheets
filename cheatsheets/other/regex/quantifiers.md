# Quantifiers

| Symbol   | Description                                                                              |
| -------- | ---------------------------------------------------------------------------------------- |
| `*`      | Match 0 or more of the previous                                                          |
| `+`      | At least one of the previous                                                             |
| `?`      | Optional - matches 0 or 1 of the previous                                                |
| `{n}`    | Exact count e.g. `{5}` matches 5 occurenes.                                              |
| `{n, m}` | Match a range of counts. e.g. `{5, 10}` matches everything between 5 and 10 occurrences. |

e.g.

```re
.*
.+
\d{10}
(a|b)?
```

e.g. match number of 1 or 2 digits. Using either pattern.

```re
\d?\d
\d{1,2}
```

e.g. JS comments over 80 characters long

```re
// .{80}
```

Note there may be text before or after the match - this is not restricted like using `^` and `$`.
