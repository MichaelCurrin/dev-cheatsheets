# Install and manage Rust


## Install Rust

See [Install](https://www.rust-lang.org/tools/install) page on Rust docs or the [Rustup](https://rustup.rs/) homepage.

### macOS and Linux

```sh
$ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

You'll have to make some choices like stable or nightly build and whether the installer should update your `PATH`.

### Windows

Download and installed from on the Install page linked above.


## Update Rust

```sh
$ rustup update
```


The instructions for the `cargo fmt` command suggest installing/updating update your global formatter.

```sh
$ rustup component add rustfmt
info: component 'rustfmt' for target 'x86_64-apple-darwin' is up to date
```
