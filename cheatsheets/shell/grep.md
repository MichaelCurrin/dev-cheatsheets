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
gem install bundler \
-v "$(grep -A 1 "BUNDLED WITH" Gemfile.lock | tail -n 1)"
```

Copied from [source](https://bundler.io/blog/2019/05/14/solutions-for-cant-find-gem-bundler-with-executable-bundle.html).

Whitespace does not matter here but in other cases could be trimmed.
