# Third-party modules

Examples of how to run


## About

> Deno can import modules from any location on the web, like GitHub, a personal webserver, or a CDN like pika.dev or jspm.io.
> 
> To make it easier to consume third party modules Deno provides some built in tooling like `deno info` and `deno doc`. deno.land also provides a web UI for viewing module documentation. It is available at doc.deno.land.
> 
> deno.land also provides a simple public hosting service for ES modules that work with Deno. It can be found at deno.land/x. [source](https://deno.land/)

From [deno.land/x](https://deno.land/x):

> deno.land/x is a URL rewriting service for Deno scripts.
>
> The basic format of code URLs is `https://deno.land/x/MODULE_NAME@BRANCH/SCRIPT.ts`.
>
> If you leave out the branch, it will default to the module’s default branch, usually master.

Example page:

- [https://deno.land/x/](https://deno.land/x/denosaur)


## Oak

From the [deno.land/x/oak/](https://deno.land/x/oak/#oak) module.

The `Application` class wraps the `serve()` function from the `http` package.

Middleware is added with the `.use()` method.

A Hello World server:

- `index.ts`
    ```javascript
    import { Application } from "https://deno.land/x/oak/mod.ts";

    const app = new Application();

    app.use((ctx) => {
      ctx.response.body = "Hello World!";
    });

    await app.listen({ port: 8000 });
    ```

Run:

```sh
$ deno run --allow-net index.ts
```

View in the browswer:

- http://localhost:8000
