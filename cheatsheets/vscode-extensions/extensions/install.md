---
title: Install
description: How to install an extension in multiple ways
---

Extensions must go in `~/.vscode/extensions` according to the docs - that's where other marketplace extensions go as directories.

## Install from path

Run this against an a locally built or downloaded `.vsix` package file. This will unzip your built package and move it to the appropriate directory.

```sh
$ code --install-extension EXTENSION_PATH
```
Sample result:

```
Installing extensions...
Extension 'auto-commit-msg-0.6.0.vsix' was successfully installed.
```

You can verify it was unzipped and moved to here:

```sh
$ ls ~/.vscode/extensions/
```
```
dbaeumer.vscode-eslint-2.1.8      michaelcurrin.auto-commit-msg-0.6.0
```

Then restart VS Code.

You can even do this while VS Code is running. You can check `@installed` in your extensions tab and it can refresh to show the latest version under the same name. But you might get "Reload Required" notice so it's a good idea to click that or restart VS Code another way.

## Install from ID

If published, you can also install by providing the extension ID from the marketplace for the command above.

```sh
$ code --install-extension MARKETPLACE_EXTENSION_ID
```

Then restart VS Code.

### Install within VS Code

There is also the `ext` syntax you'll see in the marketplace, which can be used to the command prompt within VS Code, rather than using the terminal.
