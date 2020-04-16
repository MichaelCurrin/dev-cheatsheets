# Rename files shell cheatsheet

## Change extension

Rename `*.foo` files to `*.bar`.

### Find command

[source](https://stackoverflow.com/questions/21985492/recursively-change-file-extensions-in-bash)

```sh
find . -name "*.foo" -exec bash -c 'mv "$1" "${1%.foo}".bar' - '{}' \;
```

Using `git mv`.

```sh
find . -name "*-it.md" -exec bash -c 'mv "$1" "${1%-it.md}".md' - '{}' \;
```

Using `find` and `rename`.

```sh
find . -name "*.foo" -exec rename 's/\.foo$/.bar/' '{}' \;
```

### Recursively

[source](https://askubuntu.com/questions/35922/how-do-i-change-extension-of-multiple-files-recursively-from-the-command-line)
Recursively

```sh
find . -depth -name "*.foo" -exec sh -c 'mv "$1" "${1%.foo}.bar"' _ {} \;
```

In Bash 4, you can use globstar to get recursive globs (`**`).

```sh
shopt -s globstar
for file in PATH/**/*.foo; do
  mv "$file" "${file%.foo}.bar"
done
```

### For loop

[source](https://www.howtogeek.com/423214/how-to-use-the-rename-command-on-linux/)

```sh
for f in *.foo; do mv -- "$f" "${f%.foo}.bar"
```

### Rename tool

Rename file extension of a batch of files.

```sh
sudo apt install rename
```

```sh
rename 's/.foo/.bar/' *.foo
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEwMjExNTA3MzVdfQ==
-->