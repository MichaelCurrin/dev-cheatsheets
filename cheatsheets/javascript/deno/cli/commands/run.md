# run


## Start a dev server

Use the unstable watch feature to watch for file changes and rebuild and restart. This does not push the browser to reload though, so you'll have to add that yourself.

```sh
$ deno run --tsconfig tsconfig.json --allow-net --unstable --watch server.ts
```


## Serve a static directory

Serve static assets.

Such as if you have a build directory with:

- `index.html`
- `bundle.js`

And you want to preview serving the production build locally.

```sh
$ deno run --tsconfig tsconfig.json --allow-net --allow-read static.ts
```

See fuller example [here](https://michaelcurrin.github.io/code-cookbook/recipes/javascript/deno/servers.html) including content for the script.

In production, you'd use Nginx or similar to serve.
