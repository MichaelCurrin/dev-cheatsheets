# Docs styleguide

## Variables

Options shown with examples.

### URL

```
https://github.com/<USERNAME>
https://github.com/{USERNAME}
https://github.com/[USERNAME]
```

Curly brackets are used in Shell so don't work everywhere.

Hard brackets are used for optional values in CLIs so could be misleading.


### Shell

Avoid using `$VAR` , then someone knows to use their own value.

```
command PATH
```

```
command <PATH_TO_DIR>/foo
```

You can also use lowercase - from a git command's help:

```sh
git pull <remote> <branch>
```


## Menu

At the top of a file, you can give a summary horizontally of important links.

Use an `emdash` rather than a pipe for increasing spacing. I've seen this in use before.

Code:

```markdown
[foo](target) &mdash; [bar](target)
```

Result:

[foo](target) &mdash; [bar](target)


Read more here:

https://www.html.am/html-codes/character-codes/html-em-dash-code.cfm

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTY4MzE5MzgzLDE2NDQ0ODg1NzQsLTgxOT
UzMzg1Ml19
-->