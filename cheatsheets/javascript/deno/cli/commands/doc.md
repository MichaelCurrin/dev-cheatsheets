---
title: doc
description: Show documentation for a module
---

Deno uses [JSDoc](https://en.wikipedia.org/wiki/JSDoc) internally.


## Help

```sh
$ deno doc -h
```
```
deno-doc 
Show documentation for a module.

Output documentation to standard output:
    deno doc ./path/to/module.ts

Output private documentation to standard output:
    deno doc --private ./path/to/module.ts

Output documentation in JSON format:
    deno doc --json ./path/to/module.ts

Target a specific symbol:
    deno doc ./path/to/module.ts MyClass.someField

Show documentation for runtime built-ins:
    deno doc
    deno doc --builtin Deno.Listener
```

```
USAGE:
    deno doc [OPTIONS] [ARGS]

OPTIONS:
    -h, --help                        Prints help information
        --import-map <FILE>           UNSTABLE: Load import map file
        --json                        Output documentation in JSON format
    -L, --log-level <log-level>       Set log level [possible values: debug, info]
        --private                     Output private documentation
    -q, --quiet                       Suppress diagnostic output
    -r, --reload=<CACHE_BLOCKLIST>    Reload source code cache (recompile TypeScript)
        --unstable                    Enable unstable features and APIs

ARGS:
    <source_file>    
    <filter>         Dot separated path to symbol
```
