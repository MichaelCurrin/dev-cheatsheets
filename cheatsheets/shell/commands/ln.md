# ln


## Help

```
NAME
     link, ln -- make links

SYNOPSIS
     ln [-Ffhinsv] source_file [link_name]
     ln [-Ffhinsv] source_file ... link_dirname
     link source_file link_name
...
```


## Create

### Symbolic link

A one-way pointer.

```sh
$ ln -s TARGET DEST
```

e.g. Create `venv` in current directory.

```sh
$ ln -s ~/.local/virtualenvs/daylio-csv-parser venv
```

Or another directory.

```sh
$ ln ~/.local/virtualenvs/daylio-csv-parser ~/my-project/venv
```

### Hard link

A two-way link. No flags needed. I don't think I've ever had to use this.

```sh
$ ln TARGET DEST
```

### Relative symlink

This doesn't work on macOS with the BSD `ln`. So I don't use this.

```sh
$ ln -s -r TARGET DEST
```

e.g.

```sh
$ ln -s -r my-target.txt my-dir/my-symlink
$ ls -l my-dir
my-symlink -> ../my-target.txt
```

Without the flag, your link would be **invalid**. The symlink would point to a file as `./my-target.txt` in its own directory rather than one level up.

```console
$ ln -s my-target.txt my-dir/my-symlink
$ ls -l my-dir
my-symlink -> my-target.txt
```

Here is a workaround to get the same behavior without using the flag, by using `cd`.

```sh
$ cd my-dir
$ ln -s ../my-target my-dest
```

### Force

You'll get a warning if the destination already exists, so use the force flag.

```sh
$ ln -s -f TARGET DEST
```


## View

Set up:

```sh
$ echo 'Hello' > my-target.txt
$ cd my-dir
$ ln -s my-symlink ../my-target.txt
```

```sh
$ ln -s ~/.local/virtualenvs/daylio-csv-parser venv
```


### Use cat

This will show the contents of the target of the symlink.

```console
$ cat my-symlink
Hello
```

### Use ls

```console
$ ls -l
...       my-symlink -> ../my-target
```

```console
$ ls -l
...       venv -> /Users/mcurrin/.local/virtualenvs/daylio-csv-parser
```


### Use readlink

```sh
$ readlink SYMLINK
```

e.g.

```console
$ readlink venv
/Users/mcurrin/.local/virtualenvs/daylio-csv-parser
```

