# How to

Based on [post](https://medium.com/deno-tutorial/deno-testing-bundling-formatting-and-debugging-9c8aad798fc2).


## Install module

```sh
$ deno install https://deno.land/std/examples/welcome.ts
```

The script will be saved and can be run like this:

```sh
$ ~/.deno/bin/welcome
```


## Upgrade deno

```sh
$ deno upgrade
```

## Run

### Run script

Run script in project. Use `-A` to allow all permissions.

```sh
$ deno run index.ts
```

### Run module

Run downloaded module which was installed using `deno install` or after running a script which has an external import.

```sh
$ ~/.deno/bin/welcome
```

### REPL

Start Deno in interactive mode.

```sh
$ deno repl
```


## Development

### Bundle

Bundle a script.

```sh
$ deno bundle https://deno.land/std/examples/echo_server.ts server.bundle.js
```
```
Bundling https://deno.land/std/examples/echo_server.ts
Emitting bundle to "server.bundle.js"
2.61 KB emitted.
```

Run it.

```sh
$ deno run --allow-net server.bundle.js
```
```
Listening on 0.0.0.0:8080
```

### Format

```sh
$ deno fmt index.ts
```

```sh
$ deno fmt --check PATH
```

### Lint

```sh
$ deno lint PATH
```

### Test

- `test.ts`
    ```javascript
    import { assertEquals } from "https://deno.land/std/testing/asserts.ts";

    Deno.test("deno test", () => {
        const name = "Foo";
        const surname = "Bar";
        const fullname = `${name} ${surname}`;
        assertEquals(fullname, "Foo Bar");
    });
    ```

```sh
$ deno test test.ts
```

Assertions

- `equal`
- `assert`
- `assertEquals`
- `assertStrictEq`
- `assertStrContains`
- `assertMatch`
- `assertArrayContains`
- `assertThrows`
- `assertThrowsAsync`
- `unimplemented`
- `unreachable`


## Debugging

### Browser

Allow browser dev tools debugging by using a flag.

```sh
$ deno --inspect
```

- `--inspect` flag allows attaching a debugger at any point in time,
- `inspect-brk` will wait for debugger breakpoint and pause execution on the first line of code.

### VS Code

- `settings.json`
    ```json
    {
        "version": "0.2.0",
        "configurations": [
            {
            "name": "Deno",
            "type": "node",
            "request": "launch",
            "cwd": "${workspaceFolder}",
            "runtimeExecutable": "deno",
            "runtimeArgs": ["run", "--inspect-brk", "-A", "index.ts"],
            "port": 9229
            }
        ]
    }
    ```

