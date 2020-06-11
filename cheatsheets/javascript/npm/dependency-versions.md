# NPM dependency versions

- [About semantic versioning](https://docs.npmjs.com/about-semantic-versioning) in NPM docs.


## Tilde ranges

Approximately equivalent to version.

This is _more_ restrictive as it locks the major and minor versions.

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

- https://docs.npmjs.com/misc/semver#tilde-ranges-123-12-1


## Caret ranges

Compatible with version. 

This is _less_ restrictive as only locks the major version when used for version `1` and above.

```
^1.2.3 := >=1.2.3 <2.0.0
```

 It works differently when below `1`, as shown here.

> Allows changes that do not modify the left-most non-zero digit in the [major, minor, patch] tuple. In other words, this allows patch and minor updates for versions 1.0.0 and above, patch updates for versions 0.X >=0.1.0, and no updates for versions 0.0.X.

```
^0.2.3 := >=0.2.3 <0.3.0
^0.0.3 := >=0.0.3 <0.0.4
```

- https://docs.npmjs.com/misc/semver#caret-ranges-123-025-004
