---
title: Compile
description: Generate a single binary executable from your TS scrips
---

In Deno v1.6, the `compile` command was added. It outputs a module and its dependencies as a single binary. It uses the current directory's name.

See the [v1.6](https://deno.land/posts/v1.6) blog post.

See the discussion [thread](https://github.com/denoland/deno/issues/986#issuecomment-740756795).


## Write

Write to same directory. This output file will use the name of the current directory. No extension.

```sh
$ deno compile --unstable index.ts
```

Write to a custom path.

```sh
deno compile --unstable -o build/bundle.js index.ts
```

Note flags must _come_ before arguments. Using `deno compile index.ts --unstable` gives an error and using `-o` at the end gets ignored.


## URL

Use a URL instead of a path to a local module.

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
