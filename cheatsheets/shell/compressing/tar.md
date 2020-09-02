---
title: Tar utility
---

## Quick reference

Unpack a "tarball" file:

```sh
tar xzvf my-file.tar.gz
```

This is what you'll see in most usage instructions or tutorials to unzip a dowloaded file, though the order of flags must be different.


## About

The `tar` utility is creating an archive - a single file which is _not_ compressed. It also handles compression, using either `gzip` or `bzip2` algorithms. Archiving and compression are typically used together. It is recommended that if there are two or more files to compress, then use `tar` rather than `gzip` or `bzip2` utilities.

- Archive: `.tar`
- Compressed: `.gzip` (or `.bz2`)
- Compressed archive: `.tar.gzip` `.tar.gz` or `.tgz`





## Flags

For `tar`:

- `c` – Creates a new `.tar` archive file.
- `v` – Verbosely show the progress.
- `f` – File name type of the archive file.
- `z` - use `gzip` compress
- `j` - use `bzip2` compress


## Create archive

Create an archive which is not compressed.

```sh
tar cvf ARCHIVE_OUTPUT_FILE INPUT
```

If you prefer to use the dash:

```sh
tar -cvf ARCHIVE_OUTPUT_FILE INPUT
```

## Unpack archive

To unpack an archived file, change `c` to `x`.

```sh
tar xvf ARCHIVE_OUTPUT_FILE
```


## Compress

Archive _and_ compress with `gzip` algorithm to create `.tar.gz` (or `.tgz`) file.

Note use of `z` here.

```sh
tar czvf ZIPPED_OUTPUT_FILE INPUT
```

e.g.

```sh
tar czvf foo.tar.gz foo.txt
# Alternate extension and reference to multiple files.
tar czvf bar.tgz *.jpg *.png
```


## Decompress

Decompress and unpack a compressed archive in `.tar.gz` format.

```sh
tar xzvf ZIPPED_INPUT_FILE
```

e.g.

```sh
tar xzvf foo.tar.gz
```


## Aliases

These cover both compressing and archiving at once.

```sh
# Zip. Args: TARBALL INFILES
alias tarz='tar czvf'
# Unzip. Args: TARBALL
alias taru='tar xzvf'
```
