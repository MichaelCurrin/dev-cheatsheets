# Line endings

You can edit files and commit then using one of the following line endings:

- Unix-style: `\n` i.e. LF ("line feed").
- Windows style: `\r\n` i.e. CRLF ("carriage return and line feed").


## Changing

You might get a message from `git status` as "LF will be replaced by CRLF".

Then you can change how Git behaves (see next section) or change your IDE's LF/CRLF setting.


## Solutions

Based on [answer](https://stackoverflow.com/questions/10418975/how-to-change-line-ending-settings/40821931#40821931).

### Set on Linux and macOS

This will fix any `CRLF` to `LF` when you commit.

```sh
$ git config --global core.autocrlf input
```

### Set Auto-CRLF on Windows

```sh
$ git config --global core.autocrlf true
```

This will make sure that when you checkout in windows, all `LF` will be converted to `CRLF`.

See more info on [StackOverflow thread](https://stackoverflow.com/questions/2825428/why-should-i-use-core-autocrlf-true-in-git).

> The only specific reasons to set `autocrlf` to `true` are:
> 
> - avoid git status showing all your files as modified because of the automatic EOL conversion done when cloning a Unix-based EOL Git repo to a Windows one (see issue 83 for instance)
> - _and_ your coding tools somehow depends on a native EOL style being present in your file

### Git attributes

`.gitattributes` file

> It is a good idea to keep a `.gitattributes` file as we don't want to expect everyone in our team to set their own config. This file should be placed in the repository root and if it exists, git will respect it.

e.g.

```
* text=auto
```

> This will treat all files as text files and convert to OS's line ending on checkout and back to `LF` on commit automatically. 

> If you want to specify the line ending explicitly, you can use:

```
* text eol=crlf
* text eol=lf
```
