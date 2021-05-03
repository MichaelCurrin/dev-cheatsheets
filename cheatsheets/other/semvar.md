# Semtantic versioning

## Standard used

Most software teams use **Semantic Versioning** standard for creating release tags.

Specifically:

```
MAJOR.MINOR.PATCH
```

That is defined as:

```
Given a version number MAJOR.MINOR.PATCH, increment the:

    MAJOR version when you make incompatible API changes,
    MINOR version when you add functionality in a backwards compatible manner, and
    PATCH version when you make backwards compatible bug fixes.
    Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.
```

Read more on [semvar.org](https://semver.org/) homepage.


For example:

```
1.2.3
```

The `v` prefix is popular.

```
v1.2.3
```

## Example sequence

We might make releases like this for a product in a Git repo.

1. `1.0.0`
1. `1.0.1` - increment patch version.
1. `1.0.2` - increment patch version.
1. `...`
1. `1.0.9`
1. `1.0.10` - note change from 9 to 10 in patch only.
1. `1.0.11`
1. `...`
1. `1.1.0` - increment minor version, for a large breaking changing. We rarely increment like this.
1. `1.1.1`
1. `...`
1. `2.0.0` - increment major version, for a very large breaking changing.
1. `2.0.1`
1. `2.0.2-alpha` - alpha release or "pre-release".
1. `2.0.2` - confirmed release.

See for example the [taxi releases](https://github.com/2uinc/taxi/releases). Ignore the numbers with are like `100`. Those are tags created by BuildKite automatically.
