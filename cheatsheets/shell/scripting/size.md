# Size

Directories (or at least paths without `.` to indicated extension.

```sh
$ du -a | grep -v '.git' | grep -v 'pycache' | grep -v '\.\w' | sort -h -r
```

e.g.

```
39920   .
15064   ./abc
6568    ./abc/def
23      ./xyz
...
```

Remove the `-v` of the last `grep` to show just files.

