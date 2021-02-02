# Install applications

Install a Rust application.

Run the `install` command from anywhere - it is not specific to a project.

This will install a Rust package only if it is distributed as a **binary** package. You'll get any error otherwise.

```sh
$ cargo install PACKAGE_NAME
```

Example:

```sh
$ cargo install cargo-generate
```

The installed binary will be here:

- `~/.cargo/bin`

So the command will be available from anywhere.

```sh
$ cargo-generate
...
```


## Compiling yourself vs downloading a compiled binary

Note that approach installs all the package's dependencies and does a build for you. This can take a few minutes.

You may also get weird errors in the applications that you won't know how to debug. Perhaps related to your OS or your vesion of Rust.

If you prefer, go to the docs site or GH Releases section for the package and download a pre-compiled binary.
