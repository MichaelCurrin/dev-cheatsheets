---
description: a `cat` clone with wings
---
# bat

See [GitHub repo](https://github.com/sharkdp/bat)

## Benefits

- Supports **syntax highlighting**
- It communicates with **Git** to show modifications

## Usage

See [How to use](https://github.com/sharkdp/bat?tab=readme-ov-file#how-to-use) in the docs.

### Basic file viewing

View the contents of a file with syntax highlighting.

```sh
$ bat filename
```

### View multiple files

View the contents of multiple files, each with syntax highlighting.

```sh
$ bat file1 file2 file3
```

### Line numbering

Display line numbers alongside the file contents.

```sh
$ bat -n filename
```

### Show non-printable characters

Show non-printable characters like tabs and newlines.

```sh
$ bat -A filename
```

### Paging with less

Use `less` for paging through the file contents.

```sh
$ bat --paging=always filename
```

### Compare file versions

Compare multiple file versions side by side.

```sh
$ bat --diff file1 file2
```

### Highlight specific lines

Highlight specific lines in the file, for example, lines 10 to 20.

```sh
$ bat --highlight-line 10:20 filename
```

### Customize theme

Specify a theme for syntax highlighting.

```sh
$ bat --theme="TwoDark" filename
```

### List available themes

List all available themes for syntax highlighting.

```sh
$ bat --list-themes
```

### Display plain text

Display the file contents without syntax highlighting.

```sh
$ bat --plain filename
```

### Show file header

Show a header with the file name and metadata.

```sh
$ bat --style=header filename
```
