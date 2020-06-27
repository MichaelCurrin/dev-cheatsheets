# CLI help


Deno CLI help.

## Command

```sh
~/.deno/bin/deno --help
```

## Output

### Intro

```
deno 1.1.1
A secure JavaScript and TypeScript runtime

Docs: https://deno.land/manual
Modules: https://deno.land/std/ https://deno.land/x/
Bugs: https://github.com/denoland/deno/issues

To start the REPL:
  deno

To execute a script:
  deno run https://deno.land/std/examples/welcome.ts

To evaluate code in the shell:
  deno eval "console.log(30933 + 404)"
```

### Usage

```
USAGE:
    deno [OPTIONS] [SUBCOMMAND]
```

### Options

```
OPTIONS:
    -h, --help                     
            Prints help information

    -L, --log-level <log-level>    
            Set log level [possible values: debug, info]

    -q, --quiet                    
            Suppress diagnostic output
            By default, subcommands print human-readable diagnostic messages to stderr.
            If the flag is set, restrict these messages to errors.
    -V, --version                  
            Prints version information
```

### Subcommands

```
SUBCOMMANDS:
    bundle         Bundle module and dependencies into single file
    cache          Cache the dependencies
    completions    Generate shell completions
    doc            Show documentation for a module
    eval           Eval script
    fmt            Format source files
    help           Prints this message or the help of the given subcommand(s)
    info           Show info about cache or info related to source file
    install        Install script as an executable
    lint           Lint source files
    repl           Read Eval Print Loop
    run            Run a program given a filename or url to the module. Use '-' as a filename to read from stdin.
    test           Run tests
    types          Print runtime TypeScript declarations
    upgrade        Upgrade deno executable to given version

ENVIRONMENT VARIABLES:
    DENO_DIR             Set the cache directory
    DENO_INSTALL_ROOT    Set deno install's output directory
                         (defaults to $HOME/.deno/bin)
    NO_COLOR             Set to disable color
    HTTP_PROXY           Proxy address for HTTP requests
                         (module downloads, fetch)
    HTTPS_PROXY          Proxy address for HTTPS requests
                         (module downloads, fetch)
```
