# Upgrade

## Semvar

Specify a version number higher than the current one.

e.g.

```sh
$ pip install 'foo==1.1'
```

```sh
$ pip install 'foo>=1.1'
```

```sh
$ pip install 'foo~=1.1'
```


## Latest

Upgrade to the newest release:

```sh
$ pip install foo --upgrade
```

```sh
$ pip install foo -U
```

You might get a message that requirements are already satisfied, so use [Force](#force) below.

### Virtual env note

If you have a globally-installed version (e.g. `/usr/local/bin/mypy`) and upgrade the version in your virtual environment, the local one will be appear missing when you try to run it and the global one will be used. 

So make sure to reactivate your virtual environment to pick up the local one again. I had this issue before.


## Force

This flag is not document but works for me. 

I don't think it has to be used with `--upgrade`. 

Note that `--force` will force a new version only I think while `--force-install` will force reinstalling a package even if the version will be unchanged.

```sh
$ pip install foo --force
```

Or

```sh
$ pip install -r requirements.txt --force
```

Or

```sh
$ pip install foo --upgrade-strategy eager
```

- `eager` - Dependencies are upgraded regardless of whether the currently installed version satisfies the requirements of the upgraded package(s). 
- `only-if-needed` - (Default) Dependencies are upgraded only when they do not satisfy the requirements of the upgraded package(s).
                              
