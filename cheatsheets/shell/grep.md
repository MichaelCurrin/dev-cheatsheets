# Grep cheatsheet


## Get version from file

Get bundler version from lockfile, which has title on one line and version on the next (and in this case always the last line of the file).

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
