# Ignore

Have a command fail silently, or without breaking the flow.

```sh
CMD || true
```

Optionally hide output.

```sh
CMD > /dev/null || true
```

Or just

```sh
set -e

# ...

set +e
CMD
set -e
```
