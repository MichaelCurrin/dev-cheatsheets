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

Using `find` and [rename](#rename-tool)

```sh
find . -name "*.foo" -exec rename 's/\.foo$/.bar/' '{}' \;
```

### Recursively

[source](https://askubuntu.com/questions/35922/how-do-i-change-extension-of-multiple-files-recursively-from-the-command-line)
Recursively

```sh
find . -depth -name "*.foo" -exec sh -c 'mv "$1" "${1%.foo}.bar"' _ {} \;
```

Use [globstar](globstar.md) to get recursive globs (`**`).

```sh
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

Install the `rename` utility.

```sh
sudo apt install rename
```

Rename file extension of a batch of files.


```sh
rename 's/.foo/.bar/' *.foo
```
