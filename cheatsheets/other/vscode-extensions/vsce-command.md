---
title: VSCE command
description: About the `vsce` command and how to use it
---


## What is VSCE?

VSCE is the extension manager for developers working with VS Code extensions.

> vsce, short for "Visual Studio Code Extensions", is a command-line tool for packaging, publishing and managing VS Code extensions.

It an NPM package which helps you package your VS Code extension as a [vsix] file so it can be shared and installed easily.

[vsix]: {{ site.baseurl }}{% link cheatsheets/other/vscode-extensions/vsix-format.md %}


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

See [Export and Publish](https://michaelcurrin.github.io/dev-resources/resources/other/vscode-extensions/export-publish.html) in Dev Resources for more info on the CLI.

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
  -h, --help                           display help for command

Commands:
  ls [options]                         Lists all the files that will be published
  package [options] [<version>]        Packages an extension
  publish [options] [<version>]        Publishes an extension
  unpublish [options] [<extensionid>]  Unpublishes an extension. Example extension id: microsoft.csharp.
  ls-publishers                        List all known publishers
  delete-publisher <publisher>         Deletes a publisher
  login <publisher>                    Add a publisher to the known publishers list
  logout <publisher>                   Remove a publisher from the known publishers list
  verify-pat [options] [<publisher>]   Verify if the Personal Access Token has publish rights for the
                                       publisher.
  show [options] <extensionid>         Show extension metadata
  search [options] <text>              search extension gallery
  help [command]                       display help for command
```


## Commands

Run these from the project root.

### List command

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

### Package command

```sh
$ vsce package
```

Here is how I use it:

```json
{
  "scripts": {
    "build": "mkdir -p build && vsce package --out build/",
  }
}
```


## Prepublish

Make sure to define your own prepublish step. This will be when running the `vsce package` command.


Example: 

```json
{
  "scripts": {
    "vscode:prepublish": "npm run compile"
  }
}
```


### Publish

Package and upload to Marketplace. You will be asked for your Personal Access Token.

```sh
$ vsce publish
```

Presumably that doesn't using tagging.

#### Increment version

From the [docs](https://code.visualstudio.com/api/working-with-extensions/publishing-extension#autoincrementing-the-extension-version).

This will run `npm version` internally to increment the package number and make a tag and then

```sh
$ vsce publish major
$ vsce publish minor
$ vsce publish patch
$ vsce publish 2.0.1
```


## Including and ignoring

What actually needs to be included is:

- Always included (even if you ignore everything)
    - `README.md`
    - `package.json`
- `LICENSE`
- assets like images.
- `out` - built JS files, excluding tests. Note that `src` and TS files must be excluded.
You should exclude code in `src`.

The `.vscodeignore` file determines what gets excluded from the package. 

These are implied as ignored and not needed to be listed there:

- `.vsix`
- `package-lock.json`
- `.vscode`

Note that you do need to explicitly igore dotfiles, such as `.github` or `.github`. 

### Ignore rules

A template project will give you a base for the ignore file.

- [.vscodeignore](https://github.com/MichaelCurrin/vsc-extension-quickstart/blob/master/.vscodeignore) in `MichaelCurrin/vsc-extension-quickstart`.

Unfortunately, that is rather verbose.

I came up my own approach to ignore everything and then include certain files with `!`. 

```
# Ignore
**

# Keep
!LICENSE
!images/
!out/**/*.js
```

Unfortunately that keeps `out/test` files. Even if you ignore `out/test/**` or `*.test.*` fies. 

Note use of `**/*.js` above. Using one of these below does _not_ handle subdirectories.

```
!out/*.js
# OR
!out/**.js
```
