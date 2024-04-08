# Argument parsing


## Basic

Without using a library.

```python
import sys

def main(args):
    if not args:
        sys.stderr.write(f"Usage: {__file__} ABC\n")
        sys.exit(1)

    first_arg = args[0]
    print(first_arg)

if __name__ == '__main__':
    main(sys.argv[1:]
```

The snippet I used set up the dynamic value as `sys.argv[0]`. The value of that will be like script name if running standalone as an install package. But if running as `python app.py`, it will be `python`.

I used `__file__` above - so you'll have `app.py`. Or the full path.


## Argparse

- [Argparse Tutorial](https://docs.python.org/3/howto/argparse.html) in PY3 docs.
- [argparse](https://docs.python.org/3/library/argparse.html) module in the docs.

### Parameters

An example using some basic datatypes.

```python
import argparse

parser = argparse.ArgumentParser()


# bool flag. -v for True or omit for False (not need to set default as here it is implied).
parser.add_argument("-v", "--verbose", action="store_true", help="Enable verbose output")
# list of str
parser.add_argument("filenames", type=str, nargs='+', help="The filenames to process")
# int with default and set to optional.
parser.add_argument("count", type=int, default=0, required=False, help="The number of items to process")


args = parser.parse_args()
count = args.count
verbose = args.verbose
filenames = args.filenames
```

### Commands

```python
import argparse

parser = argparse.ArgumentParser()

subparsers = parser.add_subparsers(title="Commands")

# Count command.
count_parser = subparsers.add_parser("count", help="Count the number of items in a file")
count_parser.add_argument("filename", type=str, help="The filename to process")

# Filter command.
filter_parser = subparsers.add_parser("filter", help="Filter a file based on a pattern")
filter_parser.add_argument("filename", type=str, help="The filename to process")
filter_parser.add_argument("pattern", type=str, help="The pattern to filter for")


args = parser.parse_args()

if args.command == "count":
    count_file(args)
elif args.command == "filter":
    filter_file(args)
else:
    print("Invalid command")
```
