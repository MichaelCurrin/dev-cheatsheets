# CLI

## Usage

Command:

```sh
$ tsc
```

Options. These are set in the terminal but you can set them in the config too.

| Option              | Description                                                                                                                                                                                                   |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `-p .`              | Set the _project_ directory. Here as the top-level directory (not `src`). A TS config must exist here. You can run `tsc foo.ts` if you prefer.           
| `--outFile FILE` | Concatenate and emit output to single file.
| `--outDir DIRECTORY`     |  Redirect output structure to the directory. Omitting this flag will output to same directory as the source files. This is usually set in the config file rather. Note the directory is **not** cleared each time, so you might want to run `rm -rf dist && tsc -p . --outDir dist`.               |
| `--sourceMap false` | If you don't want `.map` files, you can turn this off like this.                                                                                                                                              |
| `--rootDir src`     | You probably don't need to set this. If you do an import from outside `src` such as to `../../package.json` then you end up changing the root directory and then have to set this param or change the import. |
| `-w, --watch`   | Watch input files. |
| `--strict` | Enable all strict type-checking options. |


## Script commands

```json
{
  "scripts": {
    "watch": "tsc -watch -p .",
    "compile": "tsc -p .",
  }
}
```

Assume output directory is set based on config below.


## Config

Some values for `compilerOptions` in `tsconfig.json`.

```json
{
    "outDir": "dist",
    "sourceMap": true,
    "rootDir": "src",
    "strict": true 
}
```


See [What is a tsconfig.json](https://www.typescriptlang.org/docs/handbook/tsconfig-json.html) is the TS docs.
