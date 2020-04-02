# Substitute text


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


## Replace word in files

Replace `foo` with `bar` in all files in the directory

```sh
sed -i 's/foo/bar/g' *
``

On macOS you need to provide a backup extension for -i - '.bak' or '' for no backup.

```sh
sed -i '.bak' 's/foo/bar/g' *
```

Using `find`:

```
find ./ -type f -exec sed -i 's/foo/bar/g' {} \;
```

For case insensitive flag, change `/g` to `/gI`.


From [StackOverflow](https://stackoverflow.com/questions/11392478/how-to-replace-a-string-in-multiple-files-in-linux-command-line)
