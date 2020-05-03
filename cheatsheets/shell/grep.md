# Grep cheatsheet

## Man page

Linux: https://ss64.com/bash/grep.html

## Tutorials

https://www.computerhope.com/unix/ugrep.htm


## Get version from file

Get bundler version from lockfile, which has a title on one line and version on the next (and in this case always the last line of the file).

```
# Gemfile.lock

# ...
# ...
BUNDLED WITH:
  1.17.2
```


```sh
$ VSN="$(grep -A 1 "BUNDLED WITH" Gemfile.lock | tail -n 1)"
```

Notes:

- If the file does not exist, `grep` will show a warning on stderr. If you are existing on errors you can continue.
- If file does not contain the line, `grep` will exit on a success code still and the value will be an empty string.
- Use `-A 1` as an offeset so we get the line after it. And then tail to keep it one line - don't know what happens if there's more content after it.

Usecase:

```sh
$ BUNDLE_VSN="$(grep -A 1 'BUNDLED WITH' Gemfile.lock | tail -n 1)"
$ gem install bundler -v "${BUNDLE_VSN:-2.1.4}"
```

Copied from [source](https://bundler.io/blog/2019/05/14/solutions-for-cant-find-gem-bundler-with-executable-bundle.html).

Whitespace does not matter here but in other cases could be trimmed.
