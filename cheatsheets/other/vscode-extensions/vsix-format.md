---
description: An exported form of a VS Code extension
---
# VSIX format


The VSCE command is used to export an extension as `.vsix` file. This extension is VS Code's format for bundling extensions as single compressed archive file.

That file can be used as follows:

- Install locally
    - Use the [Install][] flow to install globally, without having to worry about unzipping or moving the package.
    - Install by hand
        1. Unzip the package e.g. using `tar` or `unzip`.
        2. Move the folder `~/.vscode/extensions/` for your user. Or `./.vscode/extensions/` to scope it to just one repo.
- Share with friends
    - Send your file by Slack/Email along with the appropriate [Install] command.
    - Download from GitHub (such as if the file is uploaded to a GH Release)
- Publish to the VS Code marketplace to share publicly
    - See the [Publish][] guide.

[Install]: {{ site.baseurl }}{% link cheatsheets/other/vscode-extensions/workflows/install.md %}
[Publish]: {{ site.baseurl }}{% link cheatsheets/other/vscode-extensions/workflows/publish.md %}
