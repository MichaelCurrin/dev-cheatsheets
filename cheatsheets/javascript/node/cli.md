---
title: CLI
description: Guide to `node` CLI
---


## Run script

```sh
$ node main.js

$ node index.js
$ # OR even
$ node .
```


## Evaluate script

Use `--eval` flag.

```sh
$ node -e 'console.log("Hello, World!")'
```

Use stdin.

```sh
$ echo 'console.log("Hello")' | node
```

Or using `--print` flag.

> evaluate script and print result

No console logging needed. And only the last expression will be printed.

```sh
$ node -p '"hello"'
hello

$ node -p '"hello" + " world"'
hello world
```

```sh
$ node -p '1 + 2'
3
```

```sh
$ node -p '1 + 2; 3 +4 '
7
```


## Interactive

```sh
$ node
Welcome to Node.js v14.13.1.
Type ".help" for more information.
>
```

Force interactive mode.

> always enter the REPL even if stdin does not appear to be a terminal

```sh
$ node -i
Welcome to Node.js v14.13.1.
Type ".help" for more information.
>
```

This can be useful to run a script snippet first and then go interactive.

```sh
$ node -i -e 'console.log(123)'
123
> 
```

I couldn't get it to work with a script though. This exited the script.

```sh
$ echo 'console.log("Hello")' > test.js
$ node -i test.js
Hello
```


