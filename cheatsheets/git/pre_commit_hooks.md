# Git hooks cheatsheet


## Resources

- https://githooks.com/


## Pre-commit hooks

- https://github.com/pre-commit/pre-commit-hooks - good for use with Python
- https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks

### Example

From Poetry

`.pre-commit-config.yaml`

```yaml
repos:
  - repo: https://github.com/psf/black
    rev: stable
    hooks:
      - id: black

  - repo: https://gitlab.com/pycqa/flake8
    rev: 3.7.8
    hooks:
      - id: flake8

  - repo: https://github.com/timothycrosley/isort
    rev: 4.3.21-2
    hooks:
      - id: isort
        additional_dependencies: [toml]
        exclude: ^.*/?setup\.py$

  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v2.3.0
    hooks:
      - id: trailing-whitespace
        exclude: ^tests/.*/fixtures/.*
      - id: end-of-file-fixer
        exclude: ^tests/.*/fixtures/.*
      - id: debug-statements
 ```
## Actions

```yaml
jobs:
  Linting:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v2
      - name: Set up Python 3.8
        uses: actions/setup-python@v1
        with:
          python-version: 3.8
      - name: Linting
        run: |
          pip install pre-commit
          pre-commit run --all-files
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTY3NzMyNDc2NF19
-->