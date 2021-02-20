# Builtin


## Deno functions

In place of the Node standard lib, you can use this built-in methods on the `Deno` module. No imports need.

Available when using `deno run index.ts` or the interactive console `deno repl`.

```typescript
Deno.cwd
Deno.copyFile
Deno.readAllSync
```

See more with:

```sh
$ deno repl
```

```typescript
> Object.keys(Deno).sort()
...
```


## Standard library


### Updating

You might have to rebuild your standard library modules when upgrading Deno.

```sh
$ cd ~
$ deno upgrade
$ deno cache --reload
```

It is also recommend to reference standard library modules by locked versions - this means they will always be available and get installed regardless of Deno version.


### Resources

- [deno.land/std](https://deno.land/std) for modules to import.
- [Standard library](https://deno.land/manual@/standard_library) in the manual.


### Modules


From [Unix cat example](https://deno.land/manual@v1.7.4/examples/unix_cat) in the docs.

- `Deno.args` accesses the command line arguments.
- `Deno.open` is used to get a handle to a file.
- `Deno.copy` is used to transfer data from the file to the output stream.

From the docs, use the `fs` module from the standard library:

- `main.ts`
    ```typescript
    import { copy } from "https://deno.land/std@0.87.0/fs/copy.ts";

    copy("log.txt", "log-old.txt");
    ```

```sh
$ deno run --allow-read --allow-write main.ts
```

See [Read and write text files](https://deno.land/manual@v1.7.4/examples/read_write_files).

Summarized below.

```typescript
Deno.readTextFile("./people.json");

Deno.writeTextFile("./hello.txt", "Hello World!");
```
