---
title: Export
description: How to export/bundle/package your extension as a single archive file
---

The package and publish steps could be added to `package.json` and also then to a workflow for a release. For now, manually using and also uploading to a release will work. The trick is to do the build _after_ using tagging (e.g. `npm version minor`), to ensure the name of the filename and the contents matches.


```sh
$ vsce package
Executing prepublish script 'npm run vscode:prepublish'...
...
DONE  Packaged: /home/michael/repos/auto-commit-msg/auto-commit-msg-0.6.0.vsix (31 files, 33.21KB)
```

Alternatively specify ignored `build` directory. Some may prefer `dist` for distribution.

```sh
$ vsce package --out build
```

Example output name: `auto-commit-msg-0.6.0.vsix`. That will be in the repo root or a given out directory.

```sh
$ vsce package -h
```
```
Usage: package [options]

Packages an extension

Options:
  -o, --out [path]        Output .vsix extension file to [path] location
  --baseContentUrl [url]  Prepend all relative links in README.md with this url.
  --baseImagesUrl [url]   Prepend all relative image links in README.md with this url.
  --yarn                  Use yarn instead of npm
  --ignoreFile [path]     Indicate alternative .vscodeignore
  --noGitHubIssueLinking  Prevent automatic expansion of GitHub-style issue syntax into links
  -h, --help              output usage information
```
