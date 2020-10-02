---
title: Variables
---


## Basic

```mk
SHELL = /bin/bash
JS_DIR = assets/js
```

Sometimes you'll see `:=` instead of `=`.


## Export variables

This makes the variable available in subprocesses, after executing source command.
But also make sure not to overwrite a value set already, such as with Netlify secrets.

```make
export GITHUB_TOKEN := $(if $(GITHUB_TOKEN), $(GITHUB_TOKEN), '')
```

## Default variables

Setup default values to be overridden by the user.


Set defaults.

- `defaults.mk`
    ```mk
    FOO=${FIZZ}
    BAR=${BUZZ}

    export
    ```

Import defaults.

- `Makefile`
    ```make
    include defaults.mk
    
    foo:
        # ...
    ```
