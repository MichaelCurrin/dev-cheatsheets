# Compile

In 1.6, the `compile` command was added. It outputs a module and its dependencies as a single binary. It uses the current directory's name.

See the discussion [thread](https://github.com/denoland/deno/issues/986#issuecomment-740756795).

Example:

```sh
$ deno compile --unstable index.ts

$ deno compile --unstable https://deno.land/std@0.79.0/examples/cat.ts
```
