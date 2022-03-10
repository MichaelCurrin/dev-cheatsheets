# Install and upgrade Python

## macOS

Using Homebrew.

Note that upgrading Python with Homebrew causes all my virtual envs to break. Using `pyenv` is safer.

### Upgrading

I had 3 versions of PY3 installed.

The system default is Python3.7.

```sh
$ python3 -V
Python 3.7.3
$ which python3
/usr/bin/python3
```

And Python 3.8 was known by Brew.

```sh
$ brew info python
python@3.8: stable 3.8.6 (bottled)
```

Python 3.9 got installed because sphinx-doc has it as a dependency, but it did not replace the existing one. See notes from the output.


```
==> python@3.9
Python has been installed as
  /usr/local/bin/python3

Unversioned symlinks `python`, `python-config`, `pip` etc. pointing to
`python3`, `python3-config`, `pip3` etc., respectively, have been installed into
  /usr/local/opt/python@3.9/libexec/bin

You can install Python packages with
  pip3 install <package>
They will install into the site-package directory
  /usr/local/lib/python3.9/site-packages

See: https://docs.brew.sh/Homebrew-and-Python

python@3.9 is keg-only, which means it was not symlinked into /usr/local,
because this is an alternate version of another formula.

If you need to have python@3.9 first in your PATH run:
  echo 'export PATH="/usr/local/opt/python@3.9/bin:$PATH"' >> ~/.zshrc

For compilers to find python@3.9 you may need to set:
  export LDFLAGS="-L/usr/local/opt/python@3.9/lib"

For pkg-config to find python@3.9 you may need to set:
  export PKG_CONFIG_PATH="/usr/local/opt/python@3.9/lib/pkgconfig"
```


Try this to sort out the linking.

```sh
$ brew unlink python && brew link python
```

```
Unlinking /usr/local/Cellar/python@3.8/3.8.6... 2 symlinks removed
Linking /usr/local/Cellar/python@3.8/3.8.6...
Error: Could not symlink bin/pip3
Target /usr/local/bin/pip3
is a symlink belonging to python@3.9. You can unlink it:
  brew unlink python@3.9

To force the link and overwrite all conflicting files:
  brew link --overwrite python@3.8

To list all files that would be deleted:
  brew link --overwrite --dry-run python@3.8
```

Or

```sh
$ brew unlink python
$ brew link python@3.9
Warning: python@3.9 is keg-only and must be linked with --force

If you need to have this software first in your PATH instead consider running:
  echo 'export PATH="/usr/local/opt/python@3.9/bin:$PATH"' >> ~/.zshrc
```


```sh
$ brew link python@3.9 --force
Linking /usr/local/Cellar/python@3.9/3.9.0... 21 symlinks created

If you need to have this software first in your PATH instead consider running:
  echo 'export PATH="/usr/local/opt/python@3.9/bin:$PATH"' >> ~/.zshrc
```
```sh
$ python3 -V
Python 3.7.3
```

Create by hand:


```sh
$ cd /usr/local/opt
$ ln -s  ../Cellar/python@3.9/3.9.0 python@3.9
$ ln -s  ../Cellar/python@3.9/3.9.0 python@3
```

Then you can add this to `PATH` - `/usr/local/opt/python@3`.


Also I can't just delete the old one as it is used by other Brew packages.

```sh
$ brew uninstall python@3.8
Error: Refusing to uninstall /usr/local/Cellar/python@3.8/3.8.6
because it is required by ipython, libxml2 and libxmlsec1, which are currently installed.
You can override this and force removal with:
  brew uninstall --ignore-dependencies python@3.8
```

Doing an install of Python 3.9 made it the default without having to update my `PATH`.

```sh
$ brew upgrade python@3.9
```

And `/usr/local/bin/python3` links to `../Cellar/python@3.9/3.9.0/bin/python3` now.
