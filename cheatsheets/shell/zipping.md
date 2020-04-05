# Zipping

Command-line tools available for Unix-like systems (Linux and macOS):

- [zip and unzip](#zip-and-unzip)
- [tar](#tar)
- `gzip`
- `bzip2`

[source](https://www.cyberciti.biz/howto/question/general/compress-file-unix-linux-cheat-sheet.php) guide.

## zip and unzip

Compress and decompress - use the `zip` utility to handle `.zip` files.

### Compress

```
zip ZIPPED_OUTPUT INPUT
```

e.g.

```sh
zip foo.zip foo.doc

zip bar.zip *.doc
```

### Decompress

```sh
zip ZIPPED_INPUT [OUTPUT]
```

e.g.

```sh
unzip foo.zip
unzip foo.zip baz.doc
```

## tar

The tar utility is creating an archive - a single file which is _not_ compressed. It also handles compression, using either gzip or bzip2 algorithms. Archiving and compression are typically used together. It is recommended that if there are two or more files to compress, then use `tar` rather than `gzip` or `bzip2` utilities. 

- Archive: `.tar`
- Compressed: `.gzip` (or `.bz2`)
- Compressed archive: `.tar.gzip` or `.tgz`

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
