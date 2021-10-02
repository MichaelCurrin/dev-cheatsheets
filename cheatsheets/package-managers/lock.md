# Lock dependencies


## Links to sections

How to pin packages at version or range.

- [NPM package versions]({{ site.baseurl }}{% link cheatsheets/package-managers/javascript/npm/versions.md %})
- [Python pip package versions]({{ site.baseurl }}{% link cheatsheets/package-managers/python/pip/versions.md %})
- [Ruby gem versions]({{ site.baseurl }}{% link cheatsheets/package-managers/ruby/versions.md %})


## Summary

For Python, Ruby and NPM.

- `1.2.3` - exact match. All support. Uncommon in JS.
- `>=1.2.3, <2` - range. All support. Uncommon in JS.
- `~1.2.3` -  using tilde - compatible patch increments i.e. `X.Y.*` with minimum `Z`. Supported by all. Very common in JS as it gets automatically set in package.json file. 
- Tilde variations. I've never seen these in JS/NPM and they might not even be valid.
    - `~= 1.2.3` - using tilde and equals - Python only. Common.
    - `~> 1.2.3` - using tilde and greater than - Ruby only. Common.
- `^1.2.3` - using caret - minor versions i.e. `X.*.*` with minimum `Y` and `Z`. Supported by NPM/JS only. Sometimes set manually in package.json file. 

Note that NPM versions work differently above and below the first major release - `1.0.0`.
