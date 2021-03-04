---
description: Find and replace text in a file, a variable or a string
---
# Replace


## Using shell parameter expansion

Syntax: `${VARNAME//FIND/REPLACE}`. The `//` is necessary for global replacement.

```sh
$ x=foo_bar_baz_buzz
$ echo ${x//_/-}
foo-bar-baz-buzz
$ echo ${x/_/-}
foo-bar_bazz_buzz
```


## Using sed and a regex pattern

Regex substitution is used in this guide. Test your pattern at [regex101.com](https://regex101.com/).

Syntax: `s/FIND/REPLACE/g`.

The `g` is for global and is more useful for files and multi-line strings than for one-line strings.

Example:

```sh
s/foo/bar/g
```

Use `g` for global. Add `I` after `g` for case insensitive flag.

Some characters must be escaped such as with backslash.

### Replace word

Using a string.

```sh
$ echo 'football' | sed 's/foo/bar/g'
bartball
$ echo 'football' | sed 's/foo/bar/g'
tball
```

Using a variable.

```sh
$ x='football'
$ echo $x | sed 's/foo/bar/g'
bartball
```

### Replace newline character

Given text:

```sh
$ echo 'Hello\nworld'
Hello
world
```

Note that those also remove a trailing newline.

Note you don't need to escape `\n` as `\\n`.


#### sed

Using `sed`. This doesn't work on macOS `sed` though.

```sh
$ echo 'Hello\nworld' | sed 's/\n/ /'
Hello world
```

#### tr

Using `tr`.

```sh
$ echo 'Hello\nworld' | tr '\n' ' '
Hello world
```


### Replace character with a newline character

Use `\` followed by pressing enter. Using `\n` doesn't seem to work here.

#### sed

```sh
$ echo 'Hello,World' | sed 's/,/\
/g'
```
```
Hello
World
```

#### tr

Both of these work.

```sh
$ echo "Hello:world" | tr ':' '\n'
Hello
world
```

```sh
$ echo "Hello:world" | tr ':' '
'
Hello
world
```
Make sure that the 2nd argument for `tr` is `'` followed by enter - if you press space and then enter then it doesn't work.


## Replace inline with backup flag

The default use of `sed` will just print, so use the inline flag to update the file.

You can optionally provide an extension - typically `.bak`. This will create a backup of the file before overrwriting it.

Note that this flag works differently on macOS and Linux.

Here assume pattern is like `'s/foo/bar/g'` and the PATH could be `*` or a filename.

### Linux

This is for Linux.

```sh
$ sed -i PATTERN PATH
$ sed -i=.bak PATTERN PATH
```


A backup is made if you supply a suffix - but you must _not_ leave a gap between the flag and the suffix.

```
-i[SUFFIX], --in-place[=SUFFIX]

        edit files in place (makes backup if SUFFIX supplied)
```

### macOS

On the BSD `sed` on macOS you can't just use `-i`. You _must_ to provide an argument - even if its an empty string for no backup.

```sh
$ sed -i '' PATTERN PATH
$ sed -i '.bak' PATTERN PATH
```

For the first line, do **not** use this below, since it gets interpreted as a literal `=` sign.

```sh
sed -i=''
```

Or you should install and alias the GNU sed.


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


## Delete lines

Delete an entire line matching pattern.

### sed

```sh
$ sed -i '' '/foo/d' file.txt
```

Use the reverse match.

```sh
$ sed -i '' -n '/foo/!p' file.txt
```

### tr

Using `--delete` flag.

```sh
$ tr -d 'foo' < file.txt
```

### awk

Use the reverse match.

Note that `>` will start overwriting immediately so you need a temp file.

```sh
$ awk '!/foo/' file.txt > temp && mv temp file.txt
```

### grep

Use the reverse match.

```sh
$ grep -v "foo" file.txt > temp && mv temp file.txt
```


## Replace and output a new file

```sh
$ sed 's/spam/eggs/g' foo.html > bar.html
```


## Combine sed and find

Use `find` to find files and replace in-line, while the `sed` part is your transformation.

This is useful to apply to _files_ only since `sed` will give an error on in-place replacements against _directories_. Also, `find` is suited for finding files nested in directories.

General:

```sh
$ find . -type f -exec sed -i 'PATTERN' {} \;
```

e.g.

```
$ find . -type f -exec sed -i 's/foo/bar/g' {} \;
```

Replace tabs with 2 spaces in a directory:

```sh
$ find . -type f -exec sed -i 's/\t/  /g' {} \;
```

From [StackOverflow](https://stackoverflow.com/questions/11392478/how-to-replace-a-string-in-multiple-files-in-linux-command-line).

You can narrow down the name. Here is a glob. Make sure to use a star that is _quoted_. Also the star glob will not match hidden directories - this will help you avoid accidentally updating and breaking `.git`.

```sh
$ find . -type f -name '*' -exec 'sed -i .bak -e "PATTERN" {} +'
```

```sh
$ find . -exec sed -i '' -e 'PATTERN' {} \;
```

```
 -e command
             Append the editing commands specified by the command argument to the list of commands.
```

Or reverse the order so `find` is used by `sed`. I found this easier than the syntax above which I copied but kept getting errors on.

```sh
$ sed -i 's/foo/bar/g' $(find . -type f)
```


### Install sed

If you are used to the GNU (Linux) `sed`, you can set it up on macOS too.

[StackOverflow](https://stackoverflow.com/questions/2320564/sed-i-command-for-in-place-editing-to-work-with-both-gnu-sed-and-bsd-osx/27595785#27595785)

```sh
$ brew install gnu-sed
```

Add to `.bashrc` or `.zshrc` to make is accesible.

```sh
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
```
