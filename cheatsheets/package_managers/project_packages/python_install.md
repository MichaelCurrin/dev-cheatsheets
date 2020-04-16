# Python install cheatsheet
> How to install packages with `pip`

## Install

### Requirements file

Set the version in `requirements.txt` file:

```
foo>=0.2
```

Then install from the file.

```sh
$ pip install -r requirements.txt
```


### Command-line version

Or install the version directly. Note the quotes help to escape characters.

```sh
$ pip install 'foo>=0.2'
```

You omit a version, though this can be dangerous for upgrading or setting up environments for import projects. If you omit a version, you'll get the latest.

```sh
$ pip install foo
```

But note that command has no version number requested. So if you run the command repeatedly, you won't ever get a new version, except on a fresh install.

## Upgrade

Specify a version number higher than the current one.

e.g.

```sh
$ pip install 'foo==1.1'

```

Upgrade to the newest release:

```sh
$ pip install foo --upgrade
```

## Uninstall

```sh
$ pip uninstall foo
```
