# New project


## Cargo new

[docs](https://doc.rust-lang.org/cargo/commands/cargo-new.html)

> cargo-new - Create a new Cargo package

```
cargo new [options] path
```

Path is required but `.` or a new directory name are both allowed.

### Binary package

The default implies `--bin`. You cannot use `--bin` and `--lib` together.

```sh
$ cargo new --bin foo
```

- `foo/src/main.rs`
    ```rs
    fn main() {
        println!("Hello, world!");
    }
    ```

### Lib package

```sh
$ cargo new --lib foo
```

Output:

- `foo/src/lib.rs`
    ```rs
    #[cfg(test)]
    mod tests {
        #[test]
        fn it_works() {
            assert_eq!(2 + 2, 4);
        }
    }
    ```


## Cargo init

[doc](https://doc.rust-lang.org/cargo/commands/cargo-init.html)

> cargo-init - Create a new Cargo package in an existing directory

Despite the description, this create the directory if it does not exist yet.

This can be run without a path which implies `.`, or specify an existing directory name.

The default behavior will also run `git init` for you.

Note that this will give an **error** if you run it in project which already has a `Cargo.toml` file in it.

```
cargo init [options] [path]
```

Set up a directory first.

```sh
$ mkdir my-app
$ cd my-app
$ cargo init .
```

Or create the directory using the command.

```sh
$ cargo init my-app
$ cd my-app
```

Structure:

```
my-app
|- src
  |- main.rs
|- Cargo.toml
|- .gitignore
```

Note from the cargo file:

> See more keys and their definitions at [https://doc.rust-lang.org/cargo/reference/manifest.html](https://doc.rust-lang.org/cargo/reference/manifest.html)


## Cargo generate

Create a new project based on a template.

Use `cargo-generate`. This in not a builtin package, so install it globally.

```sh
$ cargo install cargo-generate
```

Pass a Rust git repo as a flag value.

Example, using [ashleygwilliams/wasm-pack-template](https://github.com/ashleygwilliams/wasm-pack-template).

```sh
$ cargo generate --git https://github.com/rustwasm/wasm-pack-template.git --name my-project
$ cd my-project
```

Links:

- Repo: [cargo-generate](https://github.com/cargo-generate/cargo-generate).
- Crate: [cargo-generate](https://crates.io/crates/cargo-generate).
