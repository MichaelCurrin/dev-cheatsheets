# Find line in file


## Match line from two lines

Get Bundler version from lock file.

_Note: I no longer care about this specific case as this was to overcome an issue that was doesn't matter anymore, but the detailed approach of using `grep` is still a good example to learn from._

This is an usual search - we can't just search for a version alone, as we'll match too many. We need to find the heading one line and version on next.

- `Gemfile.lock` sample
    ```
    # ...
    # ...
    BUNDLED WITH:
      1.17.2
    ```

Shell command:

```sh
$ VSN="$(grep -A 1 "BUNDLED WITH" Gemfile.lock | tail -n 1)"
```

Notes:

- If the file does not exist, `grep` will show a warning on stderr. If you are existing on errors you can continue.
- If file does not contain the line, `grep` will exit on a success code still and the value will be an empty string.
- Use `-A 1` as an **offset** so we get the line after it. And then tail to keep it one line - don't know what happens if there's more content after it.
- Whitespace does not matter here but in other cases could be trimmed.

Using the version after matching it.

```sh
$ BUNDLE_VSN=gem install bundler \
-v "$(grep -A 1 '"BUNDLED WITH'" Gemfile.lock | tail -n 1)"
$ gem install bundler -v "${BUNDLE_VSN:-2.1.4}"
```

Copied from [source](https://bundler.io/blog/2019/05/14/solutions-for-cant-find-gem-bundler-with-executable-bundle.html).

