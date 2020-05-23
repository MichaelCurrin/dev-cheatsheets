# Substitute text

Find and replace text in files.


## Regex

Regex substitution is used in this guide. Test your pattern at [regex101.com](https://regex101.com/).

Example

```sh
s/foo/bar/g
```

Use `g` for global. Add `I` after `g` for case insensitive flag.

Some characters must be escaped such as with backslash.


## Replace word in text

```sh
$ echo 'football' | sed 's/foo/bar/g'
```

### Replace newline character

```sh
# echo 'Hello\nworld' | sed 's/\\n/ /' 
Hello world
```

```sh
$ echo 'Hello\nworld' | tr '\\n' ' '
Hello  world
```

### Replace character with newline character

Note that `\\n` is not sufficient and the newline needs to be escaped with `\`.

```sh
$ echo 'Hello,World | sed -e 's/,/\
/g'
```
```
Hello
World
```


## Replace word in file

Replace `foo` with `bar` in _file.txt_ and print to the console.

```sh
sed -i 's/foo/bar/g' file.txt
```

Note: Use `-i` flag to update the file _in place_. Or remove it to just preview in the console.

From [tutorial](https://www.cyberciti.biz/faq/how-to-use-sed-to-find-and-replace-text-in-files-in-linux-unix-shell/)


## Replace multiple words in a file

Use multiple replacements in one command

### Separate with semicolon

```sh
sed -i 's/foo/bar/g; s/fizz/buzz/g' file.txt
```

### Separate with newline

```sh
sed -i 's/foo/bar/g
s/fizz/buzz/g
' file.txt
```

### Advanced

For more control, you can use you can use an intermediate term. Like the arbitrary `~~` below.

Here we rename `foo` to `bar` but preserve instances of `food`.

```sh
sed -i 's/food/~~/g; s/foo/bar/g; s/~~/food/g' file.txt
```

[source](https://stackoverflow.com/questions/26568952/how-to-replace-multiple-patterns-at-once-with-sed)

Note there may be a cleaner way to do this, such a with regex in the console or your IDE. Maybe with grep or find.


## Replace a word in multiple files

Replace `foo` with `bar` in all files in a directory.

```sh
sed -i 's/foo/bar/g' *

sed -i 's/foo/bar/g' foo/*
```

I don't think it goes into a directory though and it gives errors on processing directory. So that is why using `find` and setting type as file as later in this guide is useful.

On macOS you will get an error unless need to provide a backup extension.

```sh
# Create .bak files.
sed -i '.bak' 's/foo/bar/g' *

# No backup.
sed -i '' 's/foo/bar/g' *
```


## Delete lines


Delete lines matching pattern. Or use `--delete`.

```sh
tr -d 'foo' < file.txt
```

## Sed and find

Use `sed` and `find` together. This is useful to apply to files only since `sed` will give an error on in-place replacements against directories.


Using `find`:

```sh
find ./ -type f -exec sed -i 's/foo/bar/g' {} \;
```


From [StackOverflow](https://stackoverflow.com/questions/11392478/how-to-replace-a-string-in-multiple-files-in-linux-command-line)

Make sure to use a star that is quoted. Also the star glob will not match hidden directories - so you don't accidentally update and break `.git`.

```sh
find . -type f -name '*' -exec 'sed -i .bak -e "PATTERN" {} +'
```

```sh
find . -exec sed -i '' -e 'PATTERN' {} \;
```

Or reverse the order. I found this easier than the syntax above which I copied but kept getting errors on.

```sh
sed -i 's/foo/bar/g' $(find . -type f)
```

```
 -e command
             Append the editing commands specified by the command argument to the list of commands.
```

### Install

Install Linux sed on macOS.

https://stackoverflow.com/questions/2320564/sed-i-command-for-in-place-editing-to-work-with-both-gnu-sed-and-bsd-osx/27595785#27595785

```sh
brew install gnu-sed

# Add to .bashrc / .zshrc
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTUzOTg4MDc2NiwtNzQzNjU4NTg5LC0xOT
MzNDQwMDI2XX0=
-->
