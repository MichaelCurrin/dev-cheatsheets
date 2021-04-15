---
title: Default files
description: Set up default values in another file.
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
