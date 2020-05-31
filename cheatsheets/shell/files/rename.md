# Rename files shell cheatsheet

Be careful not use reserved variables like `PATH` otherwise things can break. Use `file`, `FILE`, `p` or `PATH`.

Be careful about globbing on hidden directories - as you can break `.git`.


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

Replace `.foo` with `.bar`.

```sh
for file in *.foo; do mv -- "$file" "${file%.foo}.bar"
```

Replace space with underscore in certain file types. The double dash will skip files that are unchanged I think. Or use `mv -i`.

```sh
for P in *.doc *.mp3 *.wav *.txt; do
  mv -- "$P" "${P// /_}"
done
```

Replace underscore with dash in files and directories - using ZSH builtin [globstar](globstar.md).

```sh
for P in **/*_*; do
  echo "$P" "${P//_/-}"
  git mv --verbose "$P" "${P//_/-}"
done
```

Use `-n|--dry-run` flag to preview. The `-v|--verbose` flag is implied with that.

The above can be followed by a search in the IDE with regex pattern. Note that cases should be checked before replacing. Pattern: `\w+_\w+\.md`


### Rename tool

Install the `rename` utility.

```sh
sudo apt install rename
```

Rename file extension of a batch of files.


```sh
rename 's/.foo/.bar/' *.foo
```
