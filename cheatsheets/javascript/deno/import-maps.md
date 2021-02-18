---
title: Import maps
description: How to make imports easier to manage in Deno
---

Warning - **this is an unstable feature.**.

This page is based on [Import maps](https://deno.land/manual/linking_to_external_code/import_maps) in the Deno manual.

This uses the following:

- [![WICG - import-maps](https://img.shields.io/static/v1?label=WICG&message=import-maps&color=blue&logo=github)](https://github.com/WICG/import-maps)
    > How to control the behavior of JavaScript imports

For use in general and outside of the Deno context, see the JS [Import maps]({{ site.baseurl }}{% link cheatsheets/javascript/general/modules/import-maps.md %}) section of this cheatsheets guide.


## Standard syntax

This is what an import looks like without an import map.

```typescript
import { red } from "https://deno.land/std@0.82.0/fmt/colors"
```


## Import map syntax

You can collect imports in a central file like this:

- `import_map.json`
    ```json
    {
       "imports": {
          "fmt/": "https://deno.land/std@0.82.0/fmt/"
       }
    }
    ```
- `colors.ts`
    ```typescript
    import { red } from "fmt/colors.ts";

    console.log(red("hello world"));
    ```

Then run as:

```sh
$ deno run --import-map=import_map.json --unstable color.ts
```
