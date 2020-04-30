# Substitute text

Find and replace text in files.

## Regex

Regex substitution is used in this guide. Test your pattern at [regex101.com](https://regex101.com/).

Example

```sh
s/foo/bar/g
```

Use `g` for global. Add `I` after `g` for case insensitive flag.

## Replace word in text

```sh
echo 'football' | sed 's/foo/bar/g'
```

## Replace word in file

Replace `foo` with `bar` in _hello.txt_ and print to the console.

```sh
sed -i 's/foo/bar/g' hello.txt
```

Note: Use `-i` flag to update the file _in place_. Or remove it to just preview in the console.

From [tutorial](https://www.cyberciti.biz/faq/how-to-use-sed-to-find-and-replace-text-in-files-in-linux-unix-shell/)


## Replace multiple words in a file

You can run multiple replaces at once.

```sh
sed -i 's/foo/bar/g; s/fizz/buzz/g'
```

### Advanced

For more control, you can use you can use an intermediate term. Like the arbitary `~~` below.

Here we rename `foo` to `bar` but preserve instances of `food`.

```sh
sed -i 's/food/~~/g; s/foo/bar/g; s/~~/food/g'
```

[source](https://stackoverflow.com/questions/26568952/how-to-replace-multiple-patterns-at-once-with-sed)

Note there may be a cleaner way to do this, such a with regex in the console or your IDE. Maybe with grep or find.

## Replace word in multiple files

Replace `foo` with `bar` in all files in the directory

```sh
sed -i 's/foo/bar/g' *
```

On macOS you may need to provide a backup extension for -i - '.bak' or '' for no backup.

```sh
sed -i '.bak' 's/foo/bar/g' *
```

Using `find`:

```sh
find ./ -type f -exec sed -i 's/foo/bar/g' {} \;
```


From [StackOverflow](https://stackoverflow.com/questions/11392478/how-to-replace-a-string-in-multiple-files-in-linux-command-line)
