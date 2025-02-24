# Python testing

Related to the Testing sidepanel in VS Code for running tests.


## Settings file

Create a Pytest testing config with VS Code and pick `myproject` (for `myproject/tests`) as the directory for tests. Or pick `tests` for `tests` at the repo root.

```json
{
    "python.testing.pytestArgs": [
        "myproject"
    ],
    "python.testing.unittestEnabled": false,
    "python.testing.pytestEnabled": true
}
```


## Dotenv

If your tests are in `tests` you can skip this. 

If your tests are in `myproject/tests` and you want to import from within `myproject`, then you need changes.

You have to write imports from the repo root:

```python
from myproject.abc.def import x
```

But if you configure this in `.env`:

```sh
PYTHONPATH=myproject:.venv
```

Then you can write your imports relative to the path above, so it recognizes the imports:

```python
from abc.def import x
```
