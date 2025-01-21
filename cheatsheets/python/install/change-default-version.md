# Change default version

## macOS

If you have multiple versions installed with Brew, you can set the new one as your default:

```sh
$ brew unlink python@3.12
$ brew unlink python@3.8
$ brew link --force python@3.12
```

Check it:

```sh
$ python3 -V
```

```sh
$ which python
```

If another Python is picked ahead of the Brew versions, check the order of values in `PATH` and set in your shell config.

Link with overwrite, from [AZ CLI instructions](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-macos):

```sh
$ brew update && brew install python@3.10 && brew upgrade python@3.10
$ brew link --overwrite python@3.10
```
