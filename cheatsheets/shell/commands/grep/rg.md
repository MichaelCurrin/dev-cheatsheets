---
description: |
    `ripgrep` recursively searches directories for a regex pattern while respecting your gitignore
---
# rg


> ripgrep is a line-oriented search tool that recursively searches the current directory for a regex pattern. By default, ripgrep will respect gitignore rules and automatically skip hidden files/directories and binary files.



## Install

See [Installation](https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation) in the docs.

```sh
$ sudo apt-get install ripgrep
```

## Manpage

```
NAME
       rg - recursively search the current directory for lines matching a pattern

SYNOPSIS
       rg [OPTIONS] PATTERN [PATH...]

       rg [OPTIONS] -e PATTERN... [PATH...]

       rg [OPTIONS] -f PATTERNFILE... [PATH...]
...
```

## Usage

### Basic search

Search for "pattern" in the current directory and its subdirectories.

```sh
$ rg "pattern"
```

### Search in specific file types

Search for "pattern" in files of the specified type, in this case, Rust files.

```sh
$ rg "pattern" -t rust
```

### Ignore files

Ripgrep respects `.gitignore` and other ignore files automatically, so it won't search in files and directories listed there.

### Search in specific files

Restrict the search to files with a `.txt` extension.

```sh
$ rg "pattern" *.txt
```

### Case insensitive search

Perform a case-insensitive search.

```sh
$ rg -i "pattern"
```

### Show line numbers

Show line numbers in the search results.

```sh
$ rg -n "pattern"
```

### Count matches

Count the number of matches per file.

```sh
$ rg -c "pattern"
```

### Search in a specific directory

Search for the pattern in the specified directory.

```sh
$ rg "pattern" /path/to/directory
```

### Inverted search (show non-matching lines)

Show lines that do not match the pattern.

```sh
$ rg -v "pattern"
```

### Basic Search

Search for "pattern" in the current directory and its subdirectories.

```sh
$ rg "pattern"
```

### Search in Specific File Types
Search for "pattern" in files of the specified type, in this case, Rust files.

```sh
$ rg "pattern" -t rust
```


### Ignore Files
Ripgrep respects `.gitignore` and other ignore files automatically, so it won't search in files and directories listed there.

### Search in Specific Files

```sh
$ rg "pattern" *.txt
```
Restricts the search to files with a `.txt` extension.

### Case Insensitive Search

```sh
$ rg -i "pattern"
```
Performs a case-insensitive search.

### Show Line Numbers

```sh
$ rg -n "pattern"
```
Shows line numbers in the search results.

### Count Matches

```sh
$ rg -c "pattern"
```
Counts the number of matches per file.

### Search in a Specific Directory

```sh
$ rg "pattern" /path/to/directory
```
Searches for the pattern in the specified directory.

### Inverted Search (Show Non-Matching Lines)

```sh
$ rg -v "pattern"
```
Shows lines that do not match the pattern.
