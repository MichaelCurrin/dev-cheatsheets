# Template projects

## Related

- [Python libraries][] or packages cheatsheets.
- [Package managers][] Python cheatsheets for using pip and similar tools.

[Python libraries]: {% link cheatsheets/python/libraries/index.md %}
[Package managers]: {% link cheatsheets/package-managers/python/index.md %}

## App with dependencies

Templated for basic Python projects.

- [py-project-template](https://github.com/MichaelCurrin/py-project-template) repo

That uses `requirement.txt` and `pip` which are the traditional/common choices. And `setup.cfg` as from my research that is also the popular/modern way to go. Use `requirements-lock.txt` if you care about subdependencies.

If you care about installing your project itself (not just its dependencies), so it can be installed by others for example, only then do you need to worry about `setup.py`.

## Install your app as a package
 
See my installable package template here: 

- [python-package-quickstart](https://github.com/MichaelCurrin/python-package-quickstart)

Or

- `setup.py`
    ```python
    #!/usr/bin/env python
    """
    Install my-app.
    """

    import setuptools

    setuptools.setup()
    ```

Some tools like [poetry](https://python-poetry.org/docs/pyproject/) need `pyproject.toml`.

And if using Pipenv then use `Pipfile` and `Pipfile.lock`.
