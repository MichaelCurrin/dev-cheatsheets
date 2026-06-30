# ripgrep

**ripgrep** is a line-oriented, recursive command-line search tool written in Rust. It is designed to rip through your directories for regular expression patterns at lightning speeds. By default, it intelligently respects your `.gitignore` files, ignores hidden folders, and skips binary data.

## Why use it

* **Speed:** It is routinely faster than standard GNU `grep` and `ack` because it utilizes Rust's finite-automata regex engine, SIMD optimizations, and aggressive literal optimizations.
* **Smart filtering:** It avoids searching through irrelevant files (like `node_modules/` or `.git/` folders) out-of-the-box, ensuring higher-quality results without manual configuration.
* **Unicode support:** It handles full Unicode seamlessly without the performance hits typically associated with GNU `grep`.
* **Wide integration:** Its incredible performance has made it the default backend search engine for popular modern editors like **Visual Studio Code**.

## Basic search

Search for a specific string recursively in the current directory:

```sh
rg "your_search_term"
```

## Target file types

Only search inside specific file types (e.g. Python files):

```sh
rg -tpy "def function_name"
```

## Disable smart filtering

By default, `ripgrep` respects your `.gitignore` and skips hidden files. To force it to act like a traditional `grep -r` and search **absolutely everything** (hidden, binary, and ignored files), use the triple-unrestricted flag:

```sh
rg -uuu "search_term"
```
