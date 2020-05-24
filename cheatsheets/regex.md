# Regex cheatsheet

## Resources

https://regex101.com/

## Repeat

```
\w{2}
\w{4}
\w{2,4}
```


## Insert

Note use of `$1` to keep the original text. Brackets seem to be needed for this to work.

### Add character

Add header symbol before a number.

- Find: `\d`
- Replace with: `# $1`

### Add break tag

Using VS Code regex replace.

- Find: `(^[^#].+)`
- Replace with: `$1<br>`

## Modifiers

https://www.w3schools.com/jsref/jsref_regexp_m.asp

<!--stackedit_data:
eyJoaXN0b3J5IjpbMTMzNzA0NjAxOV19
-->