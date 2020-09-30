---
title: Default variables
---

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
