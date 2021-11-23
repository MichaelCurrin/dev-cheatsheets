# Semtantic versioning


## Standard

Most software teams use **Semantic Versioning** standard for creating release tags.

For example:

```
1.2.3
```

The `v` prefix is popular.

```
v1.2.3
```


## Syntax

That can be broken down as:

```
MAJOR.MINOR.PATCH
```

That standard defined as:

```
Given a version number MAJOR.MINOR.PATCH, increment the:

    MAJOR version when you make incompatible API changes,
    MINOR version when you add functionality in a backwards compatible manner, and
    PATCH version when you make backwards compatible bug fixes.
    Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.
```

Read more on [semvar.org](https://semver.org/) homepage.

Note that this is defined above as a **API**, in the sense of how other people rely on the **external-facing** functionality. 

Such as if you have a CLI tool, code that will imported and used as library into other projects, or a REST API. You can make larger changes more safely if it doesn't affect the external view of your code.


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


## Repo example

See the [Releases](https://github.com/vuejs/vue/releases) section of the Vue repo.

If you use Vue and are upgrading from Vue 2.1 to Vue 2.3, there will be features, but it will probably not break your existing code.

But to upgrade from Vue 2 to Vue 3, things could break all over. Unless you change your your functional calls, imports and CLI commands.

Same for React 16 to 17.
