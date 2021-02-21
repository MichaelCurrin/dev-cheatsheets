# JSX


## Allow JSX syntax in TypeScript

From [IntrinsicElements](https://www.typescriptlang.org/docs/handbook/jsx.html#intrinsic-elements) in JSX docs of TS.

You can try as `.d.ts` to match [shims-vue.d.ts](https://github.com/MichaelCurrin/vue-typescript-quickstart/blob/master/src/shims-vue.d.ts), but Deno + TypeScript gave a me warning that it could not import so I had to use `.ts` instead.

### Catch-all

- `src/shims-react.ts`
    ```typescript
    declare namespace JSX {
      interface IntrinsicElements {
        [elemName: string]: any;
      }
    }
    ```

### Verbose

- `src/shims-react.ts`
    ```typescript
    declare namespace JSX {
      interface IntrinsicElements {
        h1: any;
        h2: any;
        div: any;
        p: any;
        // ...
      }
    }
    ```
