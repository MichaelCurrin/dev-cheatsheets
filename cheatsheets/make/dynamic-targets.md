# Dynamic targets

1. Setup a target like `PRE.%` where the `%` can be matched dynamically.
2. Then call it using `PRE.VALUE` e.g. `echo.deps`.
3. Use the value in the `PRE.%` target as `$*`.


Example:

- `Makefile`
    ```make
    cyan = "\\033[1\;96m"
    off  = "\\033[0m"

    echo.%:
      @echo "\n$(cyan)Building $*$(off)"

    deps: echo.deps
      pip install --upgrade pip
      pip install -r requirements.txt

    site: echo.site
      rm -rf site
      mkdir site
      mkdocs build
    ```
