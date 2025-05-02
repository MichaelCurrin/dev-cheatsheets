# Link

You can run `brew link` directly but it also runs as part of install or upgrade.

If a symlink cannot be created, you will get an error message with instructions, added here as well for convenience.


## Overwrite

To force the link and overwrite all conflicting files:

```sh
brew link --overwrite PACKAGE
```

To list all files that would be deleted:

```sh
$ brew link --overwrite --dry-run PACKAGE
```

Sample of a full message:

```
==> Pouring six--1.16.0_2.all.bottle.1.tar.gz
Error: The `brew link` step did not complete successfully
The formula built, but is not symlinked into /usr/local
Could not symlink lib/python3.9/site-packages/six.py
Target /usr/local/lib/python3.9/site-packages/six.py
already exists. You may want to remove it:
  rm '/usr/local/lib/python3.9/site-packages/six.py'

To force the link and overwrite all conflicting files:
  brew link --overwrite six

To list all files that would be deleted:
  brew link --overwrite --dry-run six

Possible conflicting files are:
/usr/local/lib/python3.9/site-packages/six.py
```
  

## Manage multiple versions

For example, you have multiple versions of Python or Node installed and want to pick which one is active.

### Node

Recommended - use NVM to manage Node versions instead.

```sh
$ brew install node@22
$ node -v  # see 23 for example used
$ brew unlink node
$ brew link node@22  # set 22 to active version
$ node -v  # verify
```

### Python

For Python, see [Change Default Version][].

[Change Default Version]: {% link cheatsheets/python/install/change-default-version.md %}