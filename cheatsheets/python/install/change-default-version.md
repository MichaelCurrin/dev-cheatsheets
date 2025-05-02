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

The active version of Python will be setup by Brew with a symlink:

```console
> ls -l $(which python)
... /opt/homebrew/bin/python3 -> ../Cellar/python@3.13/3.13.1/bin/python3
```

You can make `python` without the `3` available by adding a symlink to one of the bin directories in your `PATH`.

e.g.

```sh
$ # For dir owned by root:
$ sudo ln -s /opt/homebrew/bin/python3 /usr/bin/python
$ # Or for user's directory`:
$ ln -s /opt/homebrew/bin/python3 ~/.local/bin/python
$ # Or use Homebrews' bin:
$ ln -s /opt/homebrew/bin/python3 /opt/homebrew/bin/python
```
