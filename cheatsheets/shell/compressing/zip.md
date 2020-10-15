# Zip utility


Compress and decompress - use the `zip` utility to handle `.zip` files.


## Manpage

```sh
man zip
```

> The program is useful for packaging a set of files for distribution; for archiving files; and for saving disk space by temporarily compressing unused files or directories.

Online

- [linux.die.net/man/1/zip](https://linux.die.net/man/1/zip)
- [Zip](https://www.linuxguide.it/command_line/linux-manpage/do.php?file=zip) on Linux Guide


## Compress

The zip command will replace any existing `.zip` file, but it will _add_ target input files to it and keep the existing files in the zip file. Check the flags to change how this works.

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


## Decompress

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


## Compress with encryption

```sh
zip -r -e data.zip data/
```
