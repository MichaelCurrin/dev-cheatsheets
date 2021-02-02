---
title: Package management
description: Installing and managing project packages
---

## Registries

- [crates.io/crates](https://crates.io/crates)https://crates.io/crates
- [lib.rs/crates/crates](https://lib.rs/crates/crates)
- GitHub - any Rust repo packaged as a Cargo package.


## Update packages

- [cargo-upgrades](https://crates.io/crates/cargo-upgrades).
    > Shows which dependencies in Cargo.toml can be upgraded to a newer version.
    >
    > It's similar to cargo-outdated, but has a simpler implementation, so it won't complain about path dependencies or potential version conflicts. Simply checks whether there is a newer (stable) version for each dependency.

### Installation

```sh
$ cargo install -f cargo-upgrades
```

### Usage

In a Rust/Cargo project.

```sh
$ cargo upgrades
```


## Outdated packages

- [cargo-outdated](https://lib.rs/crates/cargo-outdated)
    > Cargo subcommand for displaying when dependencies are out of date

### Installation

```sh
$ cargo install cargo-outdated
```

### Usage

```sh
$ cargo outdated
Name             Project  Compat  Latest   Kind         Platform
----             -------  ------  ------   ----         --------
clap             2.20.0   2.20.5  2.26.0   Normal       ---
clap->bitflags   0.7.0    ---     0.9.1    Normal       ---
...
```


## Install binary package

From [docs](https://doc.rust-lang.org/cargo/commands/cargo-install.html).

```sh
$ cargo install CRATE
$ cargo install --git URL CRATE
```
