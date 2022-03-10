---
logo: python
---
# Python

Some useful commands, boilerplate code from my existing projects or things to use in new development.

### Related

- [Python package managers]({% link cheatsheets/package-managers/python/index.md %}) - like `pip` and `poetry`.
- [Python pip versions]({% link cheatsheets/package-managers/python/pip/versions.md %})
- [Python recipes][] in my Code Cookbook.

[Python recipes]: https://michaelcurrin.github.io/code-cookbook/recipes/python/


### Other cheatsheets

- [Python Cheatsheet](https://www.pythoncheatsheet.org/) website



### Installing dependencies and installing your package

- [py-project-template](https://github.com/MichaelCurrin/py-project-template)

It uses `requirement.txt` and `pip` which are the traditional/common choices. And `setup.cfg` as from my research that is also the popular/modern way to go. Use `requirements-lock.txt` if you care about subdependencies.

If you care about installing your project itself (not just its dependencies), so it can be installed by others for example, only then do you need to worry about `setup.py`.

See my installable package here: 

- [python-package-quickstart](https://github.com/MichaelCurrin/python-package-quickstart)

Some tools like [poetry](https://python-poetry.org/docs/pyproject/) need `pyproject.toml`.

And if using Pipenv then use `Pipfile` and `Pipfile.lock`.
