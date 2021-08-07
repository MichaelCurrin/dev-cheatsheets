---
title: Default files
description: Set up default values in another file
---

Set defaults in a separate file to keep your other file lighter. Such as a some constants which may or may not need to be override by a user.

I'm not sure if the curly brackets are right here. See also the other pages on conditionals and default values.

- `defaults.mk`
    ```mk
    FIZZ = ${FIZZ}
    BUZZ = ${BUZZ}

    export
    ```

Then import the defaults.

- `Makefile`
    ```make
    include defaults.mk

    foo:
        echo $(FIZZ)
    ```
