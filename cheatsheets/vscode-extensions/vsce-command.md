---
title: VSCE command
description: About the vsce command and how to use it
---

## What is VSCE?

VSCE is the extension manager for developers working with VS Code extensions.

> vsce, short for "Visual Studio Code Extensions", is a command-line tool for packaging, publishing and managing VS Code extensions.

It an NPM package which helps you package your VS Code extension as a [vsix] file so it can be shared and installed easily.

[vsix]: {{ site.baseurl }}{% link cheatsheets/vscode-extensions/vsix-format.md %}

## Install

You can install it scoped to your project.

```sh
$ npm install vsce
```

Or install it globally.

```sh
$ npm install vsce -g
```


## CLI

### How to run

If installed in your project, run like this:

```sh
$ node_modules/.bin/vsce COMMAND ARGS
```

If installed globally, run like this:

```sh
$ vsce COMMAND ARGS
```

For the case of brevity, the shorter style is used for the remainder of this guide.

After getting familiar with the command, I now prefer to run it indirectly through `npm run COMMAND` style


### Usage

```sh
$ vsce --help
```
```
Usage: vsce <command> [options]

Options:
  -V, --version                        output the version number
  -h, --help                           output usage information

Commands:
  ls [options]                         Lists all the files that will be published
  package [options]                    Packages an extension
  publish [options] [<version>]        Publishes an extension
  unpublish [options] [<extensionid>]  Unpublishes an extension. Example extension id: microsoft.csharp.
  ls-publishers                        List all known publishers
  create-publisher <publisher>         Creates a new publisher
  delete-publisher <publisher>         Deletes a publisher
  login <publisher>                    Add a publisher to the known publishers list
  logout <publisher>                   Remove a publisher from the known publishers list
  show [options] <extensionid>         Show extension metadata
  search [options] <text>              search extension gallery
```


## Commands

Run these from the project root.

### List

List all file that will be included in your package archive.

```sh
$ vsce ls
```
e.g.

```
...
> auto-commit-msg@0.10.0 clean /Users/mcurrin/repos/auto-commit-msg
> rm -rf ./out/*

bin/reset_sandbox.sh
docs/commit-philosophy.md
docs/credit.md
docs/deploy.md
...
shell/sample.sh
shell/simple-hook.sh
 INFO
```

If there any unexpected or unnecessary files, be sure to list them in your project's `.vscodeignore` file.

This runs through all the build/test/pre-publish step but just does not output a file, only printing output.


## Notes

The `.vscodeignore` file determines what gets excluded from the package. The `.vsix` file seems implied and not needed to be listed there. Same for `package-lock.json` and `.vscode` directory.

But other dot paths like `.github` and `.gitignore` must be listed in the ignore file. You might want to keep the `docs` and `LICENSE` though.

The `vscode:prepublish` step is set in `package.json`. This is run as part of `vsce package` command.
