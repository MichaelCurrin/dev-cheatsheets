# Standard lib

Examples of how to run modules in the Deno standard library.

>  Deno also provides a list of audited standard modules that are reviewed by the core Deno team and are guaranteed to work with a specific Deno version. [source](https://deno.land/)

See [denoland/deno](https://github.com/denoland/deno) repository for source code of Deno and standard lib.

These are hosted at [deno.land/std](https://deno.land/std).


## Welcome 

```sh
$ deno run https://deno.land/std/examples/welcome.ts
```


## File server

Using `std/http/file_server.ts`:

```sh
$ deno run --allow-read --allow-net https://deno.land/std/http/file_server.ts
```

Or write a more complex one using `http/server.ts`:

- `index.ts`
    ```javascript
    import { serve } from "https://deno.land/std@0.59.0/http/server.ts";
    
    const s = serve({ port: 8000 });
    
    console.log("http://localhost:8000/");
    
    for await (const req of s) {
      req.respond({ body: "Hello World\n" });
    }
    ```
   
Start the server.

```sh
$ deno run --allow-read --allow-net index.ts
```
