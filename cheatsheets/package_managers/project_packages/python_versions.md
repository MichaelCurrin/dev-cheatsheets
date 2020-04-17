# Python versions cheatsheet
> Understanding versioning of Python packages

## Semantic versioning

```
MAJOR.MINOR.BUGFIX
```

Shorthand in this doc:

```
X.Y.Z
```


## Recommended pinning for safety


### Exact version lock


```
== X.Y.Z
```


### Compatible release


```
~= X.Y
```

Minor version can float to be same or higher than specified, to get new backwards-compatible features, plus bug fixes. But the major version does is fixed - to avoid features or refactors which cause breaking changes 

Perhaps the same as this:

```
== X.Y
``` 

## Version format

[Version specifiers](https://www.python.org/dev/peps/pep-0440/#version-specifiers) in a Python PEP.

Example:

```
~= 0.9, >= 1.0, != 1.3.4.*, < 2.0
```

- `~=`: Compatible release clause.
- `==`: Version matching clause
- `!=`: Version exclusion clause
- `<=`, `>=`: Inclusive ordered comparison clause
- `<`, `>`: Exclusive ordered comparison clause
- `===`: Arbitrary equality clause.

For compatible release clause, the documentation says that the following pairs of version clauses are equivalent:

- Two levels (X.Y)
    ```
    # Here we set a minimum minor vsn of 2.2 but the major version is locked.
    # Longer
    >= 2.2, == 2.*
    # Shorthand
    ~= 2.2
    ```
- Three levels (X.Y.Z)
    ```
    # Longer
    >= 1.4.5, == 1.4.*
    # Shorthand
    ~= 1.4.5
    ```

## Examples

From the `pip` docs on [requirements file format](https://pip.readthedocs.io/en/stable/reference/pip_install/#requirements-file-format):

```
docopt == 0.6.1             # Version Matching. Must be version 0.6.1
keyring >= 4.1.1            # Minimum version 4.1.1
coverage != 3.5             # Version Exclusion. Anything except version 3.5
Mopidy-Dirble ~= 1.1        # Compatible release. Same as >= 1.1, == 1.*
```

## More examples

Be careful when setting a range - make sure you understand what is does. See below:

- `== 2.2` - Version `2.2` only.
- `>= 2.2` - Version `2.2` or higher. This can automatically upgrade to version `3` so this is dangerous.
- `>= 2.2, < 2.8` - This sets an upper bound.
- `>= 2.2, < 3.0` - This sets an upper bound too.
- `>= 2.2, == 2.*` - This is preferred notation for a major range.
- `~= 2.2` - This is equivalent to the above but shorter.
