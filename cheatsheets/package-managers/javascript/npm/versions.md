---
description: Understanding the NPM packages version pattern
---
# Versions


## Resources

- [About semantic versioning](https://docs.npmjs.com/about-semantic-versioning) in NPM docs.
- [semvar](https://docs.npmjs.com/misc/semver) package docs.


## Summary of common usage

Here is a summary of using the tilde (`~`) and caret (`^`) symbols in versioning NPM packages.

They are both generally used together with the full `X.Y.Z` version. This is covered first below, but they behave differently depending on how many levels are set. When you install packages, NPM may set `.Z` for you even if you only had `X.Y` set.

Note that Python and Ruby also use tilde, but I haven't seen caret use there so it might be just NPM thing. Setting a caret in NPM as `^X.Y.Z` is equivalent to setting `~> X.Y, >= X.Y.Z` in Ruby or Python. Setting `~> X.Y` would be dangerous there without a lock file as if a bug version increment broke your app you would not know what the last known minimum bug version was that worked.

Note that this assumes using a version specified to 3 levels - see the [Detailed](#detailed) section for how this is handled in other cases.

_TODO - how does this work on the command-line with npm install?_

### Tilde ranges

This sets a minimum version but allows **patch** increments (bug fixes) only.

```
~1.2.3
```

This is similar to setting this, though this does not a set a minimum patch.

```
1.2.*
```

### Caret ranges

When installing with `npm install foo`, NPM will write to your package file and use a caret and 3-level version for the package.

This sets a minimum version but allows **minor version** increments within it.

```
^1.2.3
```

This is similar to setting this, though this does not a set a minimum minor and patch here.

```
1.*.*
```

From [cheatsheet](https://bytearcher.com/goodies/semantic-versioning-cheatsheet/)


## Broader usage

### Tilde ranges
> Approximately equivalent to version

Using tilde is _more_ restrictive than caret, as it locks the major and minor versions.

```
~1.2.3 := >=1.2.3 <1.(2+1).0 := >=1.2.3 <1.3.0
```

This is similar to above, but does not specify a minimum minor.

```
~1.2 := >=1.2.0 <1.(2+1).0 := >=1.2.0 <1.3.0 (Same as 1.2.x)
```

Used broadly, this does not lock minor version:

```
~1 := >=1.0.0 <(1+1).0.0 := >=1.0.0 <2.0.0 (Same as 1.x)
```

- [tilde ranges](https://docs.npmjs.com/misc/semver#tilde-ranges-123-12-1) on NPM docs

### Caret ranges
> Compatible with version

Using caret is _less_ restrictive than tilde, as it only locks the major version when used for version `1` and above.

```
^1.2.3 := >=1.2.3 <2.0.0
```

It works _differently_ depending on of you've hit `1` in a major or minor level.

> Allows changes that do not modify the left-most non-zero digit in the [major, minor, patch] tuple.
>
> In other words, this allows patch and minor updates for versions 1.0.0 and above, patch updates for versions 0.X >=0.1.0, and no updates for versions 0.0.X.

```
^0.2.3 := >=0.2.3 <0.3.0
^0.0.3 := >=0.0.3 <0.0.4
```

From [Caret ranges](https://docs.npmjs.com/misc/semver#caret-ranges-123-025-004) on NPM docs
