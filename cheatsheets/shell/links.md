# Links


## Related

- [ln][] command cheatsheet.

[ln]: {{ site.baseurl }}{% link cheatsheets/shell/commands/ln.md %}


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

### Use realpath

Use on a normal object but especially useful for evaluatin where a symlink points to.

```sh
$ realpath PATH
```

e.g.

```console
$ mkdir my-dir
$ cd my-dir
$ ln -s ../test.txt my-symlink
$ cd ..
$ realpath my-dir/my-symlink 
/home/test.txt
```

### Use readlink

Use `-n` to remove trailing newline.

```
     readlink, stat -- display file status
     
     readlink [-n] [file ...]
```
 
```sh
$ readlink SYMLINK
```

e.g.

```console
$ readlink venv
/Users/mcurrin/.local/virtualenvs/daylio-csv-parser
```
