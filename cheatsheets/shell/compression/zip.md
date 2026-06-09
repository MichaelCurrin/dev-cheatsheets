# Zip utility


Compress and decompress - use the `zip` utility to handle `.zip` files. With `zip` and `unzip` commands.

Standard on macOS and Linux.

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
zip ZIPPED_FILE INFILES
```

e.g.

```sh
zip -r foo.zip foo/
# Equivalent without .zip explicitly.
zip -r foo foo/

zip foo.zip a.txt b.py

zip bar.zip *.doc
```

Common flags:

| Flag | Description |
| --- | --- |
| -r | Add all files in a folder and its subfolders to the archive. |
| -e | Prompt for a password to encrypt the files. |
| -d | Remove a file from a zip archive. |
| -u | Update an existing archive (adds new files or replaces changed ones). |
| -l | Translate line endings (LF to CRLF) for text files. |
| -q | Quite mode. |
| -j | Junk paths (store files without their directory structure). |

## Decompress

```sh
unzip ZIPPED_FILE [OUTPUT]
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
