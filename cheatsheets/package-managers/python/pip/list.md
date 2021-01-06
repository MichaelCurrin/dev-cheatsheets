# List

Show installed versions of packages.

## Verbose

Note that packages are shown alphabetically - if you try and _install_ in the same order as the output you may get errors or conflicting versions.

Verbose description of packages.

```sh
$ pip list
```

## Freeze

Minimal description of packages.

```sh
$ pip freeze
```

The content is suitable for a `requirements.txt` file, so you could copy a line there. Or write the entire file.

```sh
$ pip freeze > requirements.txt
```

Note that the this approach is likely to produce a list of packages that are dependencies of your dependencies. So you might want to reduce the lines in the file.

There is no lock file standard for `pip`. If you use alternative approaches like `pipenv` or `poetry` then you'll get a lock file separate from the main requirements file.
