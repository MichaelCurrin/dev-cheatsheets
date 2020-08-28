---
title: VSIX format
description: An exported form of a VS Code extension
---

The VSCE command is used to export an extension as `.vsix` file. This extension is VS Code's format for bundling extensions as single compressed archive file.

That file can be used as follows:

- Locally
    - unzipped and placed in `.~/vscode/extensions` for user and maybe repo level
    - Using the [Install] flow makes it easy to install globally without having to worry about the path
- Share with friends
    - Send your file by Slack/Email along with the appropriate [Install] command.
    - Download on GitHub (such as if the file is uploaded to a Release)
- Publish to the VS Code marketplace

[Install]: {{ site.baseurl }}{% link cheatsheets/vscode-extensions/extensions/install.md %}
