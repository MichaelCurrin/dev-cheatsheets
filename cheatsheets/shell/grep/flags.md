# Grep flags cheatsheet

## Summary

Short | Long | Description
---| --- | ---
-r, -R 	| –recursive | Recursive
-v 	| –invert-match | Invert match
-i 	| –ignore-case | Case insensitive
-A NUM  | 		| Print num lines of training context
-G 	| –basic-regexp | Basic regex (default).
-E 	| –extended-regexp | Extended regex. Same as `egrep`.
-P 	| –perl-regexp | Perl regular expression.
-F 	| –fixed-strings | Same as `fgrep`.
-f PATH | –file PATH | Get patterns for file.
-h 	| –no-filename |
-H 	| –with-filename |
-l 	| –files-with-matches | Just print filenames.
-L 	| –files-without-match |


## Examples

### Recursive

```sh
grep -r foo *
```


### Exact match

```
grep -w "foo" bar.txt
```


<!--stackedit_data:
eyJoaXN0b3J5IjpbLTY5NjIwNjE4Nl19
-->