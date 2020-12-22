# Import maps

See [Import maps](https://deno.land/manual/linking_to_external_code/import_maps) in the Deno manual.

And [import-maps](https://github.com/WICG/import-maps) on GitHub.

## Plain import syntax

The plain import is by URL.

```typescript
import { red } from "https://deno.land/std@0.82.0/fmt/colors"
```

## Import map syntax

You can collect imports in a central file like this.

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
