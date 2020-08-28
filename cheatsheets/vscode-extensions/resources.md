---
title: Resources
description: External links around developing VS Code extensions
---

## Beginner guides

### Extension docs

- [Extension overview](https://code.visualstudio.com/api) in the docs
- [Your First Extension](https://code.visualstudio.com/api/get-started/your-first-extension) in the docs

### Sample projects

- [MichaelCurrin/vsc-extension-quickstart](https://github.com/MichaelCurrin/vsc-extension-quickstart) GH repo
    - My repo which contains an auto-generated Hello World extension.
    - I added detailed [docs](https://github.com/MichaelCurrin/vsc-extension-quickstart/tree/master/docs#vs-code-extension-quickstart-docs) explaining how the extension works and how to install and use it locally.
    - It is available as a _template_ repo so you can create get your own copy.
- [VSCode Extension Samples](https://github.com/microsoft/vscode-extension-samples#vs-code-extension-samples)
    - This is good to look at once you're familiar with one of the simple setups above.
    - This Samples repo by Microsoft contains many variations of extensions that demonstrate functionality.
    - Use one of the directories in their as a starting point for one of your projects, or just use pieces you need from each. There are GIFs in each to give a nice preview.
    - In particular, see:
        - [Hello World Minimal Sample](https://github.com/microsoft/vscode-extension-samples/tree/master/helloworld-minimal-sample)
        - [Hello World Sample](https://github.com/microsoft/vscode-extension-samples/tree/master/helloworld-sample) without tests
        - [Hello World Test Sample](https://github.com/microsoft/vscode-extension-samples/tree/master/helloworld-test-sample) which includes tests.


## Export and publish your extension
> What to do next once you've got a working extension that runs in debug mode

- [VSCE CLI](https://vscode-docs.readthedocs.io/en/latest/tools/vscecli/) docs
- [vsce](https://www.npmjs.com/package/vsce) package on NPM
- [microsoft/vscode-vsce](https://github.com/microsoft/vscode-vsce) GH repo
    > vsce, short for "Visual Studio Code Extensions", is a command-line tool for packaging, publishing and managing VS Code extensions.
- [Publishing extensions](https://code.visualstudio.com/api/working-with-extensions/publishing-extension) in VS Code docs


## VS Code
> Links around VS Code itself

- [code.visualstudio.com](https://code.visualstudio.com/) - VS Code homepage
- [microsoft/vscode](https://github.com/microsoft/vscode) GH repo for core VS Code
- [Visual Studio Code Marketplace](https://marketplace.visualstudio.com/vscode)
    - Browse extensions in the browser. Click on an extension and click the GH repo link to look at the source code.
    - Or open the Extensions tab in VS Code and search there.


## More extensions
> Some extensions I'd like to recommend

- [MichaelCurrin/auto-commit-msg](https://github.com/MichaelCurrin/auto-commit-msg#readme)
    > Generate descriptive commit messages based on files to be committed without touching your keyboard
    - I wrote this as my first extension. It is still work in progress but it is working and has a nice flow of tests and installation. It was based heavily on the two extensions listed next.
- [Git Semantic Commit](https://github.com/nitayneeman/vscode-git-semantic-commit)
- [Git Prefix](https://github.com/srmeyers/git-prefix)

You can also find _any_ extension in the marketplace and find a link to the GH repo. Look at the code yourself and use it as a reference or fork a repo.
