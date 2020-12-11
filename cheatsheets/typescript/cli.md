# CLI

Command:

```sh
$ tsc
```

Options. these are set in the terminal but you can set in the config too.

| Option              | Description                                                                                                                                                                                                   |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `-p .`              | Set the _project_ directory. Here as the top-level directory (not `src`). A TS config must exist here. You can run `tsc foo.ts` if you prefer.                                                                |
| `--outDir dist`     | Output to given directory rather than the same directory as the source file. Note the directory is **not** cleared each time, so you might want to run `rm -rf dist && tsc -p . --outDir dist`.               |
| `--sourceMap false` | If you don't want `.map` files, you can turn this off like this.                                                                                                                                              |
| `--rootDir src`     | You probably don't need to set this. If you do an import from outside `src` such as to `../../package.json` then you end up changing the root directory and then have to set this param or change the import. |
