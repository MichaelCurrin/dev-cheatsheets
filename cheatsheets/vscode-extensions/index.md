---
title: VS Code Extensions
description: From how to develop an extension all the way to publishing it
layout: listing
---

If you are new to developing an extension, see one of the _Beginner_ links in the Resources section.

## Summary

The quickest way to get up an running with a Hello World extension in VS Code without writing any code or reading the main docs.

1. Install [Node.js][].
2. Create a new project
    - Create an extension from scratch in a few steps - follow [Start fresh][] steps.
    - Or click [Use this template][] to add a copy of my template project your own repos.
3. Start the extension in debug mode and then use it- see [Usage][] instructions. The extension is not installed globally yet.

Here is how to export an extension and then install it globally, so you can use it.

1. Export your extension as a [.vsix][] file using [vsce][].
    ```sh
    $ npm install --save-dev vsce
    $ mkdir -p build
    $ vsce package --out build/"
    ```
2. Install your extension globally in VS Code. With the path with a value like `hello-world-0.1.0.vsix`.
    ```sh
    $ code --install-extension VSIX_PATH
    ```
3. Restart VS Code.

[.vsix]: {{ site.baseurl }}{% link cheatsheets/vscode-extensions/vsix-format.md %}
[vsce]: {{ site.baseurl }}{% link cheatsheets/vscode-extensions/vsce-command.md %}
[Node.js]: https://gist.github.com/MichaelCurrin/aa1fc56419a355972b96bce23f3bccba
[Start fresh]: https://github.com/MichaelCurrin/vsc-extension-quickstart/blob/master/docs/start-fresh.md#start-fresh
[Use this template]: https://github.com/MichaelCurrin/vsc-extension-quickstart/generate
[Usage]: https://github.com/MichaelCurrin/vsc-extension-quickstart/blob/master/docs/usage.md#usage
