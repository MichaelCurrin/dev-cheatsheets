# Grep flags cheatsheet

Short | Long | Description
--- | --- | ---
A num   | | Print num lines of training context
-G 	| –basic-regexp | Basic regex (default).
-E 	| –extended-regexp | Extended regex.
-P 	| –perl-regexp | Perl reg
-f file | –file (Get patterns for file)
-F 	| –fixed-strings
-h 	| –no-filename
-H 	| –with-filename
-l | 	–files-with-matches (just print filenames)
-L 	 |–files-without-match
-r, -R 	–recursive | Recursive
-v 	–invert-match | Invert match
-i 	–ignore-case | Case insensitive


## Invert match

```
-v
```

## Add line number

```
-n
```

## Exact match

```
grep -w "opensource" welcome.txt
```


<!--stackedit_data:
eyJoaXN0b3J5IjpbLTU4MjkwMjMwNl19
-->