---
title: EditorConfig
description: How to set up a `.editorconfig` file for your project
---


## Resources

- See [editorconfig.org](https://editorconfig.org/) homepage for info on what the file is, how use wildcard patterns and what properties are supported.
- See also the [EditorConfig Properties](https://github.com/editorconfig/editorconfig/wiki/EditorConfig-Properties) on the Wiki.
- See [EditorConfig](https://michaelcurrin.github.io/code-cookbook/recipes/other/editor-config.html) in Code Cookbook.

## About

What is EditorConfig?

> EditorConfig helps maintain consistent coding styles for multiple developers working on the same project across various editors and IDEs. The EditorConfig project consists of a file format for defining coding styles and a collection of text editor plugins that enable editors to read the file format and adhere to defined styles. EditorConfig files are easily readable and they work nicely with version control systems.

The point of the editor config file is to set one in each repo so that when you or others edit in the repo in any coding environment that supports it, you'll get the same settings.

Note that this config intended to be a versioned file read by IDEs - I don't think command-line tools use it and I don't know if Vim or Nano etc. support it.


## IDE support

The `.editorconfig` file will actually only be used by your IDE if it supports it.

GitHub and PyCharm **do not** need an extension to support this. And for VS Code, you need an extension. I would highly recommend the [EditorConfig](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig) extension as it is popular and I find it useful.

You can even use that extension to generate config for you. Open the VS Code command prompt and run the _Generate .editorconfig_ command, or right-click in your root directory and select the option from the droplist.

### VS Code notes

Without using editor config, VS Code already lets you choose the indent level and tabs/spaces handling. You cannot set by file type though. It can infer from the current file, this can be annoying when creating a new JS file example and the indent level is set to 4 spaces until you override it or type it that way.

When you use an editor config file and an extension in VS Code, then you get to set the indentation for all new and existing files. This takes preference over the VS Code's inference.

For using the Prettier extension, see the VS Code section of the [Prettier]({% link recipes/javascript/format-and-lint/prettier.md %}) page.


## File format

Here is what the general syntax is like for a `.editorconfig` file. The format is [INI](https://docs.fileformat.com/system/ini/).

```ini
root = true

[*]
foo = bar

[*.foo]
# ...

[*.{buzz,bazz}]
# ...

[lib/**.js]
# ...

[{*.gql,Makefile}]
# ...
```

Some like to put this at the top of the file before `root`.

```ini
# editorconfig.org
```
