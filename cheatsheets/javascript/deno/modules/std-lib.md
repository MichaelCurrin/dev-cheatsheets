# Standard lib

## Welcome 

```sh
$ deno run https://deno.land/std/examples/welcome.ts
```

## File server

```sh
$ deno run --allow-read --allow-net https://deno.land/std/http/file_server.ts
```

Or write a more complex one.

- `index.ts`
    ```javascript
    import { serve } from "https://deno.land/std@0.59.0/http/server.ts";
    const s = serve({ port: 8000 });
    console.log("http://localhost:8000/");
    for await (const req of s) {
      req.respond({ body: "Hello World\n" });
    }
    ```
    
```sh
$ deno run --allow-read --allow-net index.ts
```

