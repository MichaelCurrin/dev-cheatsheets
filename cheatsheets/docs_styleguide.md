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

## Github project

### I

### Contributors

```
MAINTAINERS.txt
```

```
.github/CODEOWNERS
```

e.g. https://github.com/benbalter/jekyll-remote-theme/blob/master/.github/CODEOWNERS

### Contributing doc

```
CONTRIBUTING.md
```

Or

```
docs/CONTRIBUTING.md
```

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEzMDE1MzY5MDYsMTY0NDQ4ODU3NCwtOD
E5NTMzODUyXX0=
-->