---
description: Tool for creating CLIs
---
# Click

[Homepage](https://click.palletsprojects.com/en/stable/)

Click stands for "Command Line Interface Creation Kit".

## Printing

```python
click.echo("My value")
```

## Help

For `python script.py --help`.

Set using docstring of a function. Note this does not work for f-strings, they will be ignored.

```python
    def main():
        """
        My help text.
        """
        pass
```

Or set explicitly as `help` in `click.command`. This is useful if you want to use an f-string.

```
@click.command(
    help=f"""\
    My help.

    Sample usage:
        python {__file__} 'My value'
    """
)
    def main():
        pass
```

## Async

For use with async functions.

```python
import asyncio

import click


@click.command()
@click.argument("value")
def main(value: str) -> None:
    response = asyncio.run(foo(value))


if __name__ == "__main__":
    main()
```

Compared with not using Click:

```python
import asyncio


async def main(prompt: str) -> None:
    response = asyncio.run(foo(value))


if __name__ == "__main__":
    asyncio.run(main())
```
