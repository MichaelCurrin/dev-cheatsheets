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
cargo clippy
```


## Tree

Check the dependency graph.

```sh
$ cargo tree
```


## Run

```sh
$ cargo run
$ cargo r
$ cargo run src/main.rs
```

That will also create the `target` directory and add to it.


## Build package

- `cargo build`
    > Compile the current package

Cargo is package manager. It runs the Rustc compiler for you (with a lot of options) and does some extra work (e.g. resolves dependencies and check if the compile step should run).

- `--target TARGET` - Directory for all generated artifacts and intermediate files. Defaults to  `target` directory. Can be overridden as a flag or env variable or config option.
- `--out-dir OUT` - Copy final artifacts to this directory. **Unstable** and only on _nightly channel_.

```sh
$ cargo build
```

Run the output binary:

```sh
target/debug/rust-project-template
Hello, World!
```

Do a production build.

```sh
$ cargo build --release
```

Run the output binary:

```sh
target/release/rust-project-template
Hello, World!
```


## Compile

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
