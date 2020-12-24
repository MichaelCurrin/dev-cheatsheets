# Compile

In Deno v1.6, the `compile` command was added. It outputs a module and its dependencies as a single binary. It uses the current directory's name.

See the [v1.6](https://deno.land/posts/v1.6) blog post.

See the discussion [thread](https://github.com/denoland/deno/issues/986#issuecomment-740756795).


Example:

```sh
$ deno compile --unstable index.ts
```

```sh
$ deno compile --unstable https://deno.land/std@0.79.0/examples/cat.ts
```

```sh
$ deno compile --unstable https://deno.land/std@0.79.0/http/file_server.ts
Check https://deno.land/std@0.79.0/http/file_server.ts
Bundle https://deno.land/std@0.79.0/http/file_server.ts
Compile https://deno.land/std@0.79.0/http/file_server.ts
Emit file_server

$ ./file_server
HTTP server listening on http://0.0.0.0:4507/
```
