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


## Subcommands

Create a group called `cli` and add commands to using `cli.command()`.

```python
import click


@click.group()
def cli():
    """A simple CLI example with subcommands."""
    pass


@cli.command()
@click.option("--name", default="World", help="The person to greet.")
def greet(name):
    """Greets a person."""
    click.echo(f"Hello, {name}!")


@cli.command()
@click.argument("count", type=int)
def count(count):
    """Counts up to a specified number."""
    for i in range(1, count + 1):
        click.echo(i)


if __name__ == "__main__":
    cli()
```


```console
> main.py
Usage: main.py [OPTIONS] COMMAND [ARGS]...

  A simple CLI example with subcommands.

Options:
  --help  Show this message and exit.

Commands:
  count  Counts up to a specified number.
  greet  Greets a person.
```
