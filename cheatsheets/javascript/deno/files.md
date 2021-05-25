# Files

See [Read and write files](https://deno.land/manual/examples/read_write_files) in the manual.


## Read file

Use `readTextFileSync` if you don't want to use `await`.

### Text

- `index.ts`
    ```typescript
    const text = await Deno.readTextFile("test.txt");
    console.log(text)
    ```

```sh
$ deno run --allow-read index.ts
```


## Write file

Use `writeTextFileSync` if you don't want to use `await`.

### Text

- `index.ts`
    ```typescript
    const output = "Hello, World!";
    const path = "test.txt";

    const write = await Deno.writeTextFile(path, output);

    console.log(`Wrote file: ${path}`);
    ```
    
```sh
$ deno run --allow-write index.ts
```

### JSON

Based on example in the docs.

```typescript
function writeJson(path: string, data: object): string {
  try {
    Deno.writeTextFileSync(path, JSON.stringify(data));

    return console.log(`Wrote file: ${path}`);
  } catch (e) {
    return e.message;
  }
}

const outData = { hello: "World" }
const outPath = "data.json"
console.log(writeJson(outPath, outData));
```
