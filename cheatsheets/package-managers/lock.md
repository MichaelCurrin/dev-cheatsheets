# Lock dependencies

How to pin packages at version or range.

- [NPM package versions]({{ site.baseurl }}{% link cheatsheets/package-managers/javascript/npm/versions.md %})
- [Python pip package versions]({{ site.baseurl }}{% link cheatsheets/package-managers/python/pip/versions.md %})
- [Ruby gem versions]({{ site.baseurl }}{% link cheatsheets/package-managers/ruby/versions.md %})


Summary:

- `~> 1.2.3` -  using tilde - compatible patch increments. Supported by NPM, pip and Ruby.
- `^1.2.3` - using caret - minor versions. Supported by NPM only.
- Note that NPM versions work differently above and below `1.0.0`.
