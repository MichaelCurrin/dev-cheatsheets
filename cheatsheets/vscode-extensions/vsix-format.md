---
title: VSIX format
---

VSCE is used to create a `.vsix` file - VS Code's format for bundling extensions as single compressed archive file.

That file can be used as follows:

- Locally
    - unzipped and placed in `.~/vscode/extensions` for user and maybe repo level
    - Using the [Install](#install) flow makes it easy to install globally without having to worry about the path
- Send to others
    - Directly such as by email
    - Download on GitHub (such as if the file is uploaded to a Release)
- Publish to the VS Code marketplace
