# Managing imports


Where to put your imports.

See docs - [Linking to external code](https://deno.land/manual/linking_to_external_code)


## Inline

- `index.ts`
    ```typescript
    import { assert, assertEquals, assertStrContains } from "https://deno.land/std@0.85.0/testing/asserts.ts";

    assertEquals("hello", "hello");
    assertEquals("world", "world");

    console.log("Asserted! ✓");
    ```


## Central dependencies file

See also [deps.ts](https://deno.land/x/oak/deps.ts) in _Oak_. Or as [documentation](https://doc.deno.land/https/deno.land/x/oak@v6.5.0/deps.ts).

Based on Deno docs:

- `deps.ts`
    ```typescript
    export {
      assert,
      assertEquals,
      assertStrContains,
    } from "https://deno.land/std@0.85.0/testing/asserts.ts";
    ```
- `index.ts`
    ```typescript
    import { assertEquals, runTests, test } from "./deps.ts";
    
    assertEquals("hello", "hello");
    ```

You can split into:

- `deps.ts` - core dependencies.
- `test_deps.ts` - test dependencies.
