---
title: Create
description: How to create a text file
---

See also the [Piping and redirection]({{ site.baseurl }}{% link cheatsheets/shell/files/redirection.md %}) page.


## Redirect from stdin

```sh
$ > file.txt
```

From a command.

```sh
$ echo 'My text' > file.txt

$ my_command > file.txt
```

If you use redirection with no input, you need to **type** or **paste** text. Then use a terminating character - <kbd>CTRL</kbd>+<kbd>D</kbd>

```sh
$ > file.txt
My text
^D
```

```sh
$ cat file.txt
My text
```


## Write an empty file

This is not so well known. Using a colon signifies empty input.

```sh
$ : > file.txt
```

More widely-known:

```sh
$ echo '' > file.txt
```
