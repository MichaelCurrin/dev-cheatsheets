# File compression
> How to zip and unzip with a few utilities

<!-- Move to Learn to Code and then link to a shorter version here, maybe with tables -->

Command-line tools available for Unix-like systems (Linux and macOS):

- [zip utility](#zip-utility)
- [tar utility](#tar-utility)
- `gzip`
- `bzip2`

The last two are not covered as commands in this guide.

## Resources

- [Compress file cheatsheet](https://www.cyberciti.biz/howto/question/general/compress-file-unix-linux-cheat-sheet.php).
- [Tar examples in Linux](https://www.tecmint.com/18-tar-command-examples-in-linux/)

## zip utility

Compress and decompress - use the `zip` utility to handle `.zip` files.


### manpage

```sh
man zip
```

> The program is useful for packaging a set of files for distribution; for archiving files; and for saving disk space by temporarily compressing unused files or directories.

Online

- https://linux.die.net/man/1/zip
- http://www.linuxguide.it/command_line/linux-manpage/do.php?file=zip


### Compress

The zip command will replace any existing `.zip` file, but it will _add_ target infiles to it and keep the existing files in the zip file. Check the flags to change how this works.

The target can be one or more files or directories.

```sh
zip -r ZIPPED_FILE INFILES
```

e.g.

```sh
zip -r foo.zip foo
# Equivalent
zip -r foo foo

zip -r foo.zip a.txt b.py

zip -r bar.zip *.doc
```

### Decompress

```sh
zip ZIPPED_FILE [OUTPUT]
```

e.g.

```sh
unzip foo.zip
# => foo/
```

```sh
unzip foo.zip baz.doc
```

### Compress with encryption

```sh
zip -r -e data.zip data/
```


## tar utility

The `tar` utility is creating an archive - a single file which is _not_ compressed. It also handles compression, using either gzip or bzip2 algorithms. Archiving and compression are typically used together. It is recommended that if there are two or more files to compress, then use `tar` rather than `gzip` or `bzip2` utilities. 

- Archive: `.tar`
- Compressed: `.gzip` (or `.bz2`)
- Compressed archive: `.tar.gzip` `.tar.gz` or `.tgz`

### Flags

For `tar`:

- `c` – Creates a new `.tar` archive file.
- `v` – Verbosely show the  progress.
- `f` – File name type of the archive file.
- `z` - use gzip compress
- `j` - use bzip2 compress


### Archive

Create an archive which is not compressed.

```sh
tar cvf ARCHIVE_OUTPUT_FILE INPUT
```

If you prefer to use the dash:

```sh
tar -cvf ARCHIVE_OUTPUT_FILE INPUT
```

### Reverse archive

To unpack an archived file:

```sh
tar xvf ARCHIVE_OUTPUT_FILE
```

### Compress

Archive _and_ compress with `gzip`. Note use of `z` here.

```sh
tar zcvf ZIPPED_OUTPUT_FILE INPUT
```

e.g.

```sh
tar zcvf foo.tgz *.doc
tar zcvf bar.tar.gz *.jpg *.png
```

### Decompress

This unzips a compressed archive.

```
tar zxvf ZIPPED_INPUT_FILE
```


## List

Look at the contents of a file without creating new files.

Use the commands below. 


```sh
unzip -l ZIPPED_TARGET
```

```sh
tar ztvf TAR_ZIPPED_TARGET
```

```sh
view ZIPPED_TARGET

vim ZIPPED_TARGET
```
