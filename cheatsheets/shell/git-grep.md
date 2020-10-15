# Git-grep cheatsheet

> How to use git's search tool


## Resources

- [git-grep Documentation](https://git-scm.com/docs/git-grep)
- [Git - Searching](https://git-scm.com/book/en/v2/Git-Tools-Searching) tutorial.


## Examples

Looks for `time_t` in all tracked `.c` and `.h` files in the working directory and its subdirectories.

```sh
git grep 'time_t' -- '*.[ch]'
```

Looks for a line that has #define and either MAX_PATH or PATH_MAX.

```sh
git grep -e '#define' --and \( -e MAX_PATH -e PATH_MAX \)
```

Looks for a line that has NODE or Unexpected in files that have lines that match both.

```sh
git grep --all-match -e NODE -e Unexpected
```

Looks for solution, excluding files in Documentation.

```sh
git grep solution -- :^Documentation
```
