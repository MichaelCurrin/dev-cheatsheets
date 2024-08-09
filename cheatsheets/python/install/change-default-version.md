# Change default version

## macOS

If you have multiple versions installed with Brew, you can set the new one as your default:

```sh
$ brew unlink python@3.12
$ brew unlink python@3.8
$ brew link --force python@3.12
```

```sh
$ python3 -V
```

```sh
$ which python
```

If another Python is picked ahead of the Brew versions, check the order of values in `PATH` and set in your shell config.
