---
description: How to run shell scripts
---
# Execute


The `.sh` extension is not necessary but is common when the script contains Bash or ZSH code.


## Summary

- Run executable.
    ```sh
    $ ./my_script.sh
    ```
- Pass script name to `bash` command.
    ```sh
    $ bash my_script.sh
    ```
- Run source code in current process.
    ```sh
    $ source my_script.sh
    ```
- Pass contents of a file to `bash` with no args.
    ```sh
    $ cat script.sh | bash -
    ```
- Redirect in
    ```sh
    $ bash < my_script.sh
    ```


## Source

This will run the content of the given script inside the parent shell. The target script should be a shell script and does not have to be executable.

Use the source command to persist changes from a script, such as changing directories, setting variables or activating a virtual environment.

- `persist.sh`
    ```sh
    echo 'Hello, world!'
    cd ~/Documents
    pwd
    ```

```sh
$ source persist.sh
```

Note that `.` is an alias for `source`.

```sh
$ . persist.sh
```

If you use using `/bin/sh` (such as in a Makefile or cronjob), on Ubuntu that `dash`. Which means you cannot use `source` and also you need to make the path relative. So use this:

```sh
$ . ./persist.sh
```

You can use arguments too.

```sh
$ source persist.sh foo bar
```


## Execute with subshell

This will not persist any changes.

```sh
$ bash script.sh
```

e.g.

- `script.sh`
    ```sh
    echo 'Hello, world!'
    cd ~/Documents
    pwd
    ```

```sh
$ cd ~/Downloads
$ bash script.sh
Hello, world!
/my-user/home/Documents
$ pwd
/my-user/home/Downloads
```


## Execute directly

This requires the file to be executable.

### Scripts

The file can be any language (Python, JS, Bash) as long it has an appropriate shebang or the parent shell matches.

- `file.sh`
    ```sh
    echo 'Hello, world!'
    ```

```sh
$ chmod+ x file.sh
```
```sh
$ ./file.sh
```

If no shebang is set, then the script will be executed using the parent shell.

If you set a shebang then that will be used.

e.g.

- `my_executable.sh`
    ```sh
    #!/bin/bash

    echo 'Hello from the Bash world!'
    ```
- `my_executable.py`
    ```sh
    #!/usr/bin/env python3

    print('Hello from the PY world!')
    ```

```sh
$ ./my_executable.sh
Hello from the Bash world!
$ ./my_executable.py
Hello from the PY world!
```


### Binary executables

The file can also be a binary compiled from a C or Go program. It is not easily readable as a text file but can be executable.

```sh
$ ./compiled
Hello, world!
```
