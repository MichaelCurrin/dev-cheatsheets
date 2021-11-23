# Cargo

## Install

Rust programs and Cargo plugins can be installed to Cargo's _bin_ directory with:

```sh
$ cargo install
```

The directory includes standard tools and will be added to your `.profile` and `.bash_profile` files on installation. On Unix this path is `$HOME/.cargo/bin` and Windows is `%USERPROFILE%\.cargo\bin`.

## Version 

Check you Cargo version:

```sh
$ cargo -V
cargo 1.32.0-beta (1b6702f22 2018-12-06)
```


## Help

Subcommands from `cargo --help`.

```
    build, b    Compile the current package
    check, c    Analyze the current package and report errors, but don't build object files
    clean       Remove the target directory
    doc         Build this package's and its dependencies' documentation
    new         Create a new cargo package
    init        Create a new cargo package in an existing directory
    run, r      Run a binary or example of the local package
    test, t     Run the tests
    bench       Run the benchmarks
    update      Update dependencies listed in Cargo.lock
    search      Search registry for crates
    publish     Package and upload this package to the registry
    install     Install a Rust binary. Default location is $HOME/.cargo/bin
    uninstall   Uninstall a Rust binary
    
See 'cargo help <command>' for more information on a specific command.
```
