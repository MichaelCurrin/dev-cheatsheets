# tree

## Usage

```sh
$ tree
```

Example output:

```
.
├── Pipfile
├── Pipfile.lock
├── helloworld_project
│   ├── __init__.py
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
└── manage.py

1 directory, 7 files
```


## Flags

Highlights from the many flags.

- `-d` - List directories only (much shorter output).
    e.g.

    ```
    .
    ├── Foo
    │   └── Bar
    │       ├── Baz
    │       │   ├── A
    │       │   ├── B
    │       │   ├── C
    │       │   ├── Multi word
    │       │   └── Last
    │       ├── Next
    ...
    ```
- `-l` - Follow symlinks.
- `-f` - Include the full path prefix for each file.
- `-s` - Include file size.
- `-h` - Human-readable size.
- `-D` - Print the date of the last modification time for the file listed.
- `-t` - Sort the output by last modification time instead of alphabetically.
- `--dirsfirst` - List directories before files.


## Help

Linux manpage - [link](https://linux.die.net/man/1/tree)

Note there are a lot of options there.
