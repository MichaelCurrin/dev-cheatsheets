# Summary


## Create

The quickest way to get up an running with a Hello World extension in VS Code without writing any code or reading the main docs.

1. Install [Node.js][].
2. Create a new project
    - Create an extension from scratch in a few steps - follow [Start fresh][] steps.
    - Or click [Use this template][] to add a copy of my template project your own repos.
3. Start the extension in debug mode and then use it- see [Usage][] instructions. The extension is not installed globally yet.

Some recommended script commands.

```javascript
{
  "scripts": {
    "watch": "tsc -watch -p .",
    "vscode:prepublish": "npm run compile",
    "build": "mkdir -p build && vsce package --out build/"
  }
}
```


## Export

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

[.vsix]: {{ site.baseurl }}{% link cheatsheets/other/vscode-extensions/vsix-format.md %}
[vsce]: {{ site.baseurl }}{% link cheatsheets/other/vscode-extensions/vsce-command.md %}
[Node.js]: https://gist.github.com/MichaelCurrin/aa1fc56419a355972b96bce23f3bccba
[Start fresh]: https://github.com/MichaelCurrin/vsc-extension-quickstart/blob/master/docs/start-fresh.md#start-fresh
[Use this template]: https://github.com/MichaelCurrin/vsc-extension-quickstart/generate
[Usage]: https://github.com/MichaelCurrin/vsc-extension-quickstart/blob/master/docs/usage.md#usage
