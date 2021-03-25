---
title: CLI
description: Guide to ESLint CLI
---


Output is from running:

```sh
$ npx eslint -h
```


## Usage

```
eslint [options] file.js [file.js] [dir]
```

e.g.

```sh
$ eslint file.js
$ eslint .
$ eslint src
$ eslint src test
$ eslint . --ext .ts
```


## Flags

Some flags to highlight.


### Extenions

```
  --ext [String]                  Specify JavaScript file extensions
```

e.g.

```sh
$ eslint . --ext .ts
```

### Fixing problems

```
  --fix                           Automatically fix problems
  --fix-dry-run                   Automatically fix problems without saving the changes to the file system
  --fix-type Array                Specify the types of fixes to apply (problem, suggestion, layout)
```

To avoid warnings from breaking your CI, you can switch to only use error status on errors, or set a limit to number of warnings and then use error status.

### Handling warnings

```
  --quiet                         Report errors only - default: false
  --max-warnings Int              Number of warnings to trigger nonzero exit code - default: -1
```
