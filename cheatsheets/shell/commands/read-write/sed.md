# sed


## Replace word

Using a string literal.

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


## Replace inline in file with backup flag

You can optionally provide an extension - typically `.bak`. This will create a backup of the file before overwriting it.

Here assume pattern is like `'s/foo/bar/g'` and the PATH could be `*` or a filename.

This will work the same on Linux and macOS:

```sh
$ sed -i'' 's/foo/bar/g' file.txt
```

Note platform-specific usage below.

### Linux

Using GNU Linux version.

Examples:

```sh
$ # No backup.
$ sed PATTERN PATH
$ sed -i PATTERN PATH
$ sed -i '' PATTERN PATH

$ # Backup as .bak files.
$ sed -i=.bak PATTERN PATH
```

A backup is made if you supply a suffix - but you must _not_ leave a gap between the flag and the suffix.

```
-i[SUFFIX], --in-place[=SUFFIX]

        edit files in place (makes backup if SUFFIX supplied)
```

### macOS

Using BSD macOS version.

You _must_ provide an argument for inline. Even if it's an empty string for no backup.


Good examples:

```sh
$ # No backup.
$ sed -i '' PATTERN PATH

$ # Backup as .bak files.
$ sed -i '.bak' PATTERN PATH
```

Note that a space is **required** and not use of equals sign. Using `-i=''` will get the equals sign interpreted **literally**.

Leaving out a space or leaving out the argument will give an **error**.

```sh
$ sed -i'' PATTERN PATH
$ sed -i PATTERN PATH
```

Or you should install and alias the GNU `sed` on macOS as `sed`.
