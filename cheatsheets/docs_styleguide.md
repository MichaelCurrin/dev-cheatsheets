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
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTY0NDQ4ODU3NCwtODE5NTMzODUyXX0=
-->