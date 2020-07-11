---
title: Escaping
---

Prevent markdown from rendering certain styling, you can escape them. In the examples below the italics are part of a filename and italics styling is unwanted.


## Escape with backticks

Code backticks escape any styling characters inside them.

Code:

    Update the `_config.yml` file then run [`__init__.py`](__init__.py).

Result:

Update the `_config.yml` file then run [`__init__.py`](__init__.py).


## Escape text with backslash

Code:

    Update the \_config.yml file then run \_\_init\_\_.py.

Result:

Update the \_config.yml file then run \_\_init\_\_.py.


## Escaping links

Escape the link text using backslash or backticks. The target does not need escaping.

    Update the [\_config.yml](_config.yml) file.

Update the [\_config.yml](_config.yml) file.


## Dash not bullet point

```markdown
> "Art is never finished, only abandoned."
>
> \- Leonardo da Vinci
```

> "Art is never finished, only abandoned."
>
> \- Leonardo da Vinci
