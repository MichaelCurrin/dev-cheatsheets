# Groups

A non-captured and a captured part of a pattern.

```re
\w (\w)
```

Named group.

```re
(?<foo>\w)
```

Non-capturing group. If you want to use brackets to make a group such as to make it be repeated, but don't care about capturing it.

```re
(?:\w) (\w)
```
