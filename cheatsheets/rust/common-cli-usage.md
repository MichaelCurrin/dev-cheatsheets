# Common CLI usage

Resources:

- [Getting started](https://www.rust-lang.org/learn/get-started) guide in the docs.
    > Quickly set up a Rust development environment and write a small app!
- [Cargo commands](https://doc.rust-lang.org/cargo/commands/index.html) in the docs.


## Update Rust

```sh
$ rustup update
```


## Formatting

Automatic code formatter.

```sh
$ cargo fmt
```

Update the global formatter.

```sh
$ rustup component add rustfmt
info: component 'rustfmt' for target 'x86_64-apple-darwin' is up to date
```


## Linting

Linting to catch common API misuses and unidiomatic code.

```sh
$ cargo clippy
```

## Manifest commands

Note that Rust packages are not stored in your project itself, but in a global cache directory.

### Tree

Check the dependency graph.

```sh
$ cargo tree
```

### Install project packages

Here, I've manually added the [rand](https://crates.io/crates/rand) crate, which is currently on top the most-downloaded Crates list.

```toml
[dependencies]
rand = "0.8.0"
```

If you don't know the version, just leave as `""`. You'll see the version logged next.

To download and install packages on your dependencies list, run one of:

```sh
$ cargo build
$ cargo run
```


### Update

[doc](https://doc.rust-lang.org/cargo/commands/cargo-update.html)

> cargo-update - Update dependencies as recorded in the local lock file

This will install any missing crates listed in `Cargo.toml` dependencies and will also upgrade packages and save changes in the lockfile.

```sh
$ cargo update
```

For example, using:

```toml
[dependencies]
rand = "0.8.0"
```

This crate and its dependencies will get added to the lockfile. But they will **not** be installed until your run `build` or `run`.

```sh
$ cargo update
```
```
    Updating crates.io index
      Adding cfg-if v1.0.0
      Adding getrandom v0.2.2
      Adding libc v0.2.84
      Adding ppv-lite86 v0.2.10
      Adding rand v0.8.3
      Adding rand_chacha v0.3.0
      Adding rand_core v0.6.1
      Adding rand_hc v0.3.0
      Adding wasi v0.10.2+wasi-snapshot-preview1
```

Additionally, if you remove a package from your `Cargo.toml` list of `dependencies`, then running `cargo update` will also remove unneeded packages in your `Cargo.lock` file.

### Install binary

Install a **binary** package. I think this will install it globally.

```sh
$ cargo install PACKAGE_NAME
```

This won't work for any packages without binaries as you will get an error.

```sh
$ cargo install rand
Updating crates.io index
error: specified package `rand v0.8.3` has no binaries
```


## Run

```sh
$ cargo run
$ cargo r
$ cargo run src/main.rs
```

That will create the `target` directory and add intermediate files to it.

This step will also **download** and **install** any missing packages.


## Building

### Check

This is faster than doing build command.

```sh
$ cargo check
```

It will install dependencies If you removed a package from `Cargo.toml`, this comamnd will also remove the unnecessary dependencies from the lockfile.

### Build package

- `cargo build`
    > Compile the current package

This will download and install any missing packages and compile your app to an output directory - `target` by default.

```sh
$ cargo build
```

Run the output binary in a debug directory.

```sh
target/debug/rust-project-template
Hello, World!
```

Do a production-optimized build.

```sh
$ cargo build --release
```

Run the output binary in a release directory.

```sh
target/release/rust-project-template
Hello, World!
```

Cargo is a package manager, not a compiler. It runs the Rustc compiler for you (with a lot of options) and does some extra work (e.g. resolves dependencies and check if the compile step should run).

- `--target TARGET` - Directory for all generated artifacts and intermediate files. Defaults to  `target` directory. Can be overridden as a flag or env variable or config option.
- `--out-dir OUT` - Copy final artifacts to this directory. **Unstable** and only on _nightly channel_.


### Compile

Output a binary using `rustrc` compiler. This useful if you have a Rust project which is not structured for distribution as a Cargo pacakge.

The `cargo build` command will run the `rustc` compiler internally.

Compile the main script - this will output as `main` in the project root.

```sh
$ rustc src/main.rs
```

Run the output binary:

```sh
$ ./main
Hello, World!
```

Output to custom path.

```sh
$ rustc src/main.rs -o build/rust-project-template
```

```sh
$ build/rust-project-template
Hello, World!
```


## Docs

Generate HTML docs from your code.


```sh
$ cargo doc
```

Check the contents:

```sh
$ ls target/doc
```
```
COPYRIGHT.txt
...
rust-logo.png
rust_project_template/
...
src/
...
wheel.svg
```

Notable HTML paths in `doc`:

- `rust_project_template/index.html`
- `rust_project_template/main.rs.html`

Build docs and open the browser automatically.

```sh
$ cargo doc --open
```

The full path to the `index.html` on disk is used. 

e.g. `/Users/mcurrin/repos/rust-project-template/target/doc/rust_project_template/index.html`

Relative paths are used for assets - e.g. `href="../normalize.css"`.

This doc sites does't seem to need a web server to run. In fact, if you start a web server in `doc/rust_project_template`, you'll be unable to load assets on level up. So you will have to start a web server in `doc` where there is no `index.html` file, then navgiate to `/rust_project_template/`.

