---
title: Install
description: How to install an extension from a package archive file
---

Extensions must go in `~/.vscode/extensions` according to the docs - that's where other marketplace extensions go as directories.

Run this to unzip your build package and move it to the appropriate directory.

```sh
$ code --install-extension EXTENSION_PATH
```
```
Installing extensions...
Extension 'auto-commit-msg-0.6.0.vsix' was successfully installed.
```

Check it:

```sh
$ ls ~/.vscode/extensions/
```
```
dbaeumer.vscode-eslint-2.1.8      michaelcurrin.auto-commit-msg-0.6.0
```

You can do this while VS Code is running. You can check `@installed` in your extensions tab and it can refresh to show the latest version under the same name. But you might get "Reload Required" notice so it's a good idea to click that or restart VS Code another way.

If published, you can also install by providing the extension ID from the marketplace for the command above.

There is also the `ext` syntax you'll see in the marketplace which can be added to the command bar.
