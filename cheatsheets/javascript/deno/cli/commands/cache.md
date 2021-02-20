# cache


## Help

From the CLI help:

> deno-cache 
> 
> Cache and compile remote dependencies recursively.

> Download and compile a module with all of its static dependencies and save them in the local cache, without running any code:
>
>    deno cache https://deno.land/std/http/file_server.ts

> Future runs of this module will trigger no downloads or compilation unless `--reload` is specified.


## Lockfile

For more info, see [Integrity checking & lock files](https://deno.land/manual/linking_to_external_code/integrity_checking) in the docs.

Flags:

- `--lock <FILE>` - Check the specified lock file
- `--lock-write` -  Write lock file (use with --lock)

Example:

```sh
$ deno cache --lock=lock.json --lock-write src/deps.ts
$ git add lock.json
```
