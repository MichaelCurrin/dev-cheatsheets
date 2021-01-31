# New projects


## Cargo init

Create a fresh project for basic Cargo package.

The default it so initialize in the current directory, so make a new directory first.

```sh
$ mkdir my-app && cd my-app
$ cargo init
```

Or create the directory using the command. This will also initialize as a git repo.

```sh
$ cargo init my-app --vcs git
$ cd my-app
```

Note from the cargo file:

> See more keys and their definitions at [https://doc.rust-lang.org/cargo/reference/manifest.html](https://doc.rust-lang.org/cargo/reference/manifest.html)


## Cargo generate

Create a new project using a template.

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
