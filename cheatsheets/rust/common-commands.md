# Common commands


See [Cargo commands](https://doc.rust-lang.org/cargo/commands/index.html) in the docs.


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

### Tree

Check the dependency graph.

```sh
$ cargo tree
```

### Install package

```sh
$ cargo install PACKAGE_NAME
```

e.g. Using [rand](https://crates.io/crates/rand) crate, which is currently on top the most-downloaded Crates list.

```sh
$ cargo install rand
```

### Update

[doc](https://doc.rust-lang.org/cargo/commands/cargo-update.html)

> cargo-update - Update dependencies as recorded in the local lock file

```sh
$ cargo update
```


## Run

```sh
$ cargo run
$ cargo r
$ cargo run src/main.rs
```

That will also create the `target` directory and add to it.


## Building

### Check

This is faster than the build command.

```sh
$ cargo check
```

### Build package

- `cargo build`
    > Compile the current package

Cargo is package manager. It runs the Rustc compiler for you (with a lot of options) and does some extra work (e.g. resolves dependencies and check if the compile step should run).

- `--target TARGET` - Directory for all generated artifacts and intermediate files. Defaults to  `target` directory. Can be overridden as a flag or env variable or config option.
- `--out-dir OUT` - Copy final artifacts to this directory. **Unstable** and only on _nightly channel_.

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

