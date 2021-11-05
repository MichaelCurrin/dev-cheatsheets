---
title: Package management
description: Guide to using Cargo for installing and managing Rust packages
---

## Registries

- [crates.io/crates](https://crates.io/crates)https://crates.io/crates
- [lib.rs/crates/crates](https://lib.rs/crates/crates)
- GitHub - any Rust repo packaged as a Cargo package.

## Cargo CLI

Cargo is a package manager and can compile using `rustc`. Rust packages are called "crates".

```bash
$ cargo -V
cargo 1.32.0-beta (1b6702f22 2018-12-06)
```

Some common commands:

```bash
$ cargo update
$ cargo build
$ cargo run
$ cargo test
$ cargo doc
```

The commands in the section below were done from within the [my_package](my_package/) directory, if you want to see the result.


## Create

### Syntax

To create a crate at a given path.

```bash
$ # Create binary. (Default)
$ cargo new PATH # --bin

$ # Create library.
$ cargo new PATH --lib
```

Or, initialize an existing directory.

```bash
$ mkdir my_dir
$ cd my_dir
$ cargo --init
```

Using `new` initializes with a `.git` directory and `.gitignore` file, while `--init` does not.

### Example

Create a new package, which is a git repo with an ignore file. The implied default `--bin` option is to create a _binary_ package with a hello world binary executable.

```bash
$ cargo new my_package
     Created binary (application) `my_package` package
$ cd my_package
```

Structure of the new `my_package` directory:

```
.git
src/main.rs
Cargo.toml
.gitignore
```

(After creating the directory, I deleted the `.git` directory in this case since this is part of a larger repo.)

The `.gitignore` excludes the `target` directory (used for output) and `*.rs.bk` files.


## Build

Use check subcommand:

```console
$ # Check a local package and all of its dependencies for errors
$ cargo check
   Compiling my_package v0.1.0 (.../my_package)
    Finished dev [unoptimized + debuginfo] target(s) in 0.25s
```

Use build subcommand:

```console
$ # Compile a local package and all of its dependencies
$ cargo build
   Compiling my_package v0.1.0 (.../my_package)
    Finished dev [unoptimized + debuginfo] target(s) in 0.04s
```

To see the `rustc` command (and the arguments it gets from your `*.toml` file), clear the output directory and build from scratch, but with the verbose argument.

```console 
$ rm -rf target
$ cargo build --verbose
Compiling my_package v0.1.0 (.../my_package)
     Running `rustc --edition=2018 --crate-name my_package src/main.rs ... ...`
    Finished dev [unoptimized + debuginfo] target(s) in 0.68s
```


## Run

Build and run a package.

```bash
$ cargo run
   Compiling my_package v0.1.0 (.../my_package)
    Finished dev [unoptimized + debuginfo] target(s) in 3.63s
     Running `target/debug/my_package`
Hello, world!
```

## Install a binary package

From [docs](https://doc.rust-lang.org/cargo/commands/cargo-install.html).

```sh
$ cargo install CRATE
$ cargo install --git URL CRATE
```


## Update packages

- [cargo-upgrades](https://crates.io/crates/cargo-upgrades).
    > Shows which dependencies in Cargo.toml can be upgraded to a newer version.
    >
    > It's similar to cargo-outdated, but has a simpler implementation, so it won't complain about path dependencies or potential version conflicts. Simply checks whether there is a newer (stable) version for each dependency.

### Install cargo-upgrades

```sh
$ cargo install -f cargo-upgrades
```

### Usage

In a Rust/Cargo project:

```sh
$ cargo upgrades
```


## Outdated packages

- [cargo-outdated](https://lib.rs/crates/cargo-outdated)
    > Cargo subcommand for displaying when dependencies are out of date

### Install cargo-outdated

```sh
$ cargo install cargo-outdated
```

### Usage

```console 
$ cargo outdated
Name             Project  Compat  Latest   Kind         Platform
----             -------  ------  ------   ----         --------
clap             2.20.0   2.20.5  2.26.0   Normal       ---
clap->bitflags   0.7.0    ---     0.9.1    Normal       ---
...
```


