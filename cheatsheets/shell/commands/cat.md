---
title: cat
description: built-in concatenate command
---


## Related

See also [bat](https://github.com/sharkdp/bat) - a more advanced `cat`.


## Show file contents

```console
$ cat file.txt
Hello, World!
```

Equivalent to:

```console
$ < file.txt
Hello, World!
```


## Send file contents to another command

```console
$ cat file.txt | my-cmd
```

Equivalent to:

```console
$ my-cmd < file.txt
```


## Combine

```sh
$ cat file.txt file-2.txt
```

More interactive mode and the name of each file at the top, use `less` rather:

```sh
$ less file.txt file-2.txt
```
