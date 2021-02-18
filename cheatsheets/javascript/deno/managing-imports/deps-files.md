
# Deps files


## About
There is Deno community convention of putting all dependencies in a central file. With second file for test dependencies if needed.

- `deps.ts`
- `test_depts.ts`

Those act kind of like `package.json` for managing dependencies and versions centrally.


## Example

### Assert from the docs

Based on Deno docs:

- `deps.ts` - use `export` directly without doing an import.
    ```typescript
    export {
      assert,
      assertEquals,
      assertStrContains,
    } from "https://deno.land/std@0.85.0/testing/asserts.ts";
    ```
- `index.ts` - import from the deps file instead of from URLs.
    ```typescript
    import { assertEquals, runTests, test } from "./deps.ts";

    assertEquals("hello", "hello");
    ```

### Oak

See also [deps.ts](https://deno.land/x/oak/deps.ts) in _Oak_. Or as [documentation](https://doc.deno.land/https/deno.land/x/oak@v6.5.0/deps.ts).
