---
title: Repo administration
---

So far everything in here is related to VS Code and also will work outside GitHub. Other useful sections would be the EditorConfig and other configs.


## Add settings file

Use force if it is globally ignored.

```sh
git add -f .vscode/*
```


## Disable auto format on save

- `.vscode/settings.json`
    ```json
    {
        "editor.formatOnSave": false
    }
    ```

System default is `false`.  So if your user setting is `true`, then you can only set to `true` as well or untick and the config option (and file if it's empty) disappears. So you need to add it as `true` and then manually edit it. Or create if from scratch.


## Recommend extensions

Add this to your repo and when the repo is opened with VS Code then you'll get a prompt to install all or view the file.

Example:

- `.vscode/extensions.json`
    ```json5
    {
        // See http://go.microsoft.com/fwlink/?LinkId=827846
        // for the documentation about the extensions.json format
        "recommendations": [
            "ms-vscode.vscode-typescript-tslint-plugin"
        ]
    }
    ```


## Settings

A VS Code settings file added to a repo.

The example below is for a TypeScript project. <!-- TODO Move to cookbook -->

- `.vscode/settings.json`
    ```json5
    // Place your settings in this file to overwrite default and user settings.
    {
        "files.exclude": {
            "out": false // set this to true to hide the "out" folder with the compiled JS files
        },
        "search.exclude": {
            "out": true // set this to false to include "out" folder in search results
        },
        // Turn off tsc task auto detection since we have the necessary tasks as npm scripts
        "typescript.tsc.autoDetect": "off"
    }
    ```
    
