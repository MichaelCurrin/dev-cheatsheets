# setup.cfg

See [setuptools docs](https://setuptools.pypa.io/en/latest/userguide/declarative_config.html).

e.g.

```ini
[metadata]
name = my_package
version = attr: my_package.VERSION
description = My package description
long_description = file: README.rst, CHANGELOG.rst, LICENSE.rst
keywords = one, two
license = BSD 3-Clause License
classifiers =
    Framework :: Django
    Programming Language :: Python :: 3

[options]
zip_safe = False
include_package_data = True
packages = find:
install_requires =
    requests
    importlib-metadata; python_version<"3.8"
```
