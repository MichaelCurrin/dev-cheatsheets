---
title: Default files
description: Setup default values in another file.
---

Set defaults.

- `defaults.mk`
    ```mk
    FIZZ=${FIZZ}
    BUZZ=${BUZZ}

    export
    ```

Import the defaults.

- `Makefile`
    ```make
    include defaults.mk

    foo:
        # ...
    ```
