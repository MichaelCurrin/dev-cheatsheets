# Shebang

Choose a shell or programming language in the first line of an executable script.


## Absolute

For Bash:

```sh
#!/bin/bash
```


## Options

Use options. e.g.

```sh
#!/bin/bash -e
```


## Env

This below is the most **portable** across machines and systems and so is often used for a shebang in a file. 

Note the space, since `env` is a command and `bash` is the argument. Note options cannot be used in the first line in this format, so you must use `set`.

```sh
#!/usr/bin/env bash
set -e
```

This is commonly used for other programming languages. e.g.

```sh
#!/usr/bin/env python
```
```sh
#!/usr/bin/env node
```
```sh
#!/usr/bin/env ruby
```

Note that this **always** starts with `#!` regardless of what language you are using, since the shell must evaluate the shebang first and then comments of the file in the appropriate language.


## Basic

This is valid, but it is not robust, so you should avoid this.

```sh
!#bash
```

```sh
!#python
```
