# Substitute text

Find and replace text in files.

## Regex

Regex substitution is used in this guide. Test your pattern at [regex101.com](https://regex101.com/).

Example
```
s/foo/bar/g
```

Use `g` for global. Add `I` after `g` for case insensitive flag.

## Replace word in file

Replace `foo` with `bar` in _hello.txt_.

```sh
sed 's/foo/bar/g' hello.txt
# OR
echo 'football' | sed 's/foo/bar/g'
```

From [tutorial](https://www.cyberciti.biz/faq/how-to-use-sed-to-find-and-replace-text-in-files-in-linux-unix-shell/)


## Replace multiple words in a file

You can run multiple replaces at once.

```sh
sed 's/foo/bar/g;s/fizz/buzz/g'
```

For more control, you can use you can use an intermediate term. Like arbitary `~~`.

```sh
sed 's/foo/~~/g; s/bar/foo/g; s/~~/foo/g'
```

[source](https://stackoverflow.com/questions/26568952/how-to-replace-multiple-patterns-at-once-with-sed)


## Replace word in multiple files

Replace `foo` with `bar` in all files in the directory

```sh
sed -i 's/foo/bar/g' *
``

On macOS you may need to provide a backup extension for -i - '.bak' or '' for no backup.

```sh
sed -i '.bak' 's/foo/bar/g' *
```

Using `find`:

```sh
find ./ -type f -exec sed -i 's/foo/bar/g' {} \;
```


From [StackOverflow](https://stackoverflow.com/questions/11392478/how-to-replace-a-string-in-multiple-files-in-linux-command-line)
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE2MDcyODQyNzVdfQ==
-->