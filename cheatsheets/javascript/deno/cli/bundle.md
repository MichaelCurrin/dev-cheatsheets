# Bundle

Bundle a TS or JS module as a single JS file.

This includes import modules, both your scripts and external packages.


## Usage

```
deno bundle [OPTIONS] SOURCE [DESTIONATION]
```


## Preview bundle

This does not persist - it just prints.

```sh
$ deno bundle index.ts
```


## Write bundle

```sh
$ deno bundle index.ts build/bundle.js
```

Or if you refer:

```sh
$ deno bundle src/index.ts dist/myApp.bundle.ts
```


## Write and watch bundle

Watch for changes continuously using the `--watch` flag.

```sh
$ deno bundle --unstable --watch index.ts dist/bundle.js
```

This is **unstable**. See [issue](https://github.com/denoland/deno/issues/2401#issuecomment-744563503).


## How to run the bundled file

See more details in the [bundle](https://deno.land/manual/tools/bundler) manual.

### Run with Deno

```sh
$ deno run build/bundle.js
```

### Import in scripts

The output file is an ES module, so you can do imports from it. 

For example.

- `lib.bundle.js`
    ```js
    export { foo } from "./foo.js"; // Note export from another module, without an import.

    export const bar = "bar";
    ```
- `main.js`
    ```js
    import { bar, foo } from "./lib.bundle.js";
    
    foo()
    ```

### Browser

```html
<script type="module" src="website.bundle.js"></script>
```

Or use in an inline script.

```html
<script type="module">
  import * as website from "website.bundle.js";

  import { fizz } from "buzz.bundle.js";

</script>
```
