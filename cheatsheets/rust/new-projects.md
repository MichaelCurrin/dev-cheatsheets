# New projects


## Cargo init

[doc](https://doc.rust-lang.org/cargo/commands/cargo-init.html)

> cargo-init - Create a new Cargo package in an existing directory

The default behavior will also run `git init` for you.

```
cargo init [options] [path]
```

Setup a directory first.

```sh
$ mkdir my-app
$ cd my-app
$ cargo init
```

Or create the directory using the command.

```sh
$ cargo init my-app 
$ cd my-app
```

Note from the cargo file:

> See more keys and their definitions at [https://doc.rust-lang.org/cargo/reference/manifest.html](https://doc.rust-lang.org/cargo/reference/manifest.html)


## Cargo new

[docs](https://doc.rust-lang.org/cargo/commands/cargo-new.html)

> cargo-new - Create a new Cargo package

```
cargo new [options] path
```


## Cargo generate

Create a new project using a template.

This in not a builtin package.

```sh
$ cargo install cargo-generate
```

Example, using [ashleygwilliams/wasm-pack-template](https://github.com/ashleygwilliams/wasm-pack-template).

```sh
$ cargo generate --git https://github.com/rustwasm/wasm-pack-template.git --name my-project
$ cd my-project
```

Links:

- Repo: [cargo-generate](https://github.com/cargo-generate/cargo-generate).
- Crate: [cargo-generate](https://crates.io/crates/cargo-generate).
