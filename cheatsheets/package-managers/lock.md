# Lock dependencies


## Links to sections

How to pin packages at version or range.

- [NPM package versions]({{ site.baseurl }}{% link cheatsheets/package-managers/javascript/npm/versions.md %})
- [Python pip package versions]({{ site.baseurl }}{% link cheatsheets/package-managers/python/pip/versions.md %})
- [Ruby gem versions]({{ site.baseurl }}{% link cheatsheets/package-managers/ruby/versions.md %})


## Summary

For Python, Ruby and NPM.

- `1.2.3` - exact match. All support.
- `>=1.2.3, <2` - range. All support.
- `~1.2.3` -  using tilde - compatible patch increments. Supported by all.
    - `~= 1.2.3` - using tilde and equals - Python only.
    - `~> 1.2.3` - using tilde and greater than - Ruby only.
- `^1.2.3` - using caret - minor versions. Supported by NPM only.
- Note that NPM versions work differently above and below the first major release - `1.0.0`.
