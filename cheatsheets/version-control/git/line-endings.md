---
description: How to configure line endings for your repo and to get them consistent
---
# Line endings

If you or your team are working on multiple operating systems, this can cause issues. Such as warnings from Git, and files appearing modified even though they look the same aside from whitespace.

See also this article - [CRLF vs. LF: Normalizing Line Endings in Git](https://www.aleksandrhovhannisyan.com/blog/crlf-vs-lf-normalizing-line-endings-in-git/)

## Line endings

You can edit files and commit then using one of the following line endings:

| OS            | Abbreviation | Full name                       | Character |
|---------------|--------------|---------------------------------|-----------|
| Unix-style    | LF           | "line feed"                     | `\n`      |
| Windows style | CRLF         | "carriage return and line feed" | `\r\n`    |

You might also see "CR" or carriage return as the old style Windows line ending, but this is not an option in Git.

## Vertify ling endings

```sh
$ git ls-files --eol
```
e.g.

```
i/lf    w/lf    attr/text=auto          .editorconfig
i/lf    w/lf    attr/text=auto          .gitignore
i/lf    w/lf    attr/text=auto          README.md
...
```

You can also pass a path to that.w

## How to fix inconsisten line endings

You might get a message from `git status` like this: "LF will be replaced by CRLF". And if you check your `git diff` you might see `^M` throughout the file at the end of each line.

To solve this, you can change how Git behaves (see next section). Or hange your IDE's LF/CRLF setting.

Advice below is based on this [StackOverflow thread](https://stackoverflow.com/questions/10418975/how-to-change-line-ending-settings/40821931#40821931).

See [core.autocrlf](https://git-scm.com/docs/git-config#Documentation/git-config.txt-coreautocrlf) in the Git docs for what the settings values mean.

### Set input Auto-CRLF

No input conversion is done.

I found this works for Linux and macOS.

```sh
$ git config --global core.autocrlf input
```

### Set Auto-CRLF on Windows

This will make sure that when you checkout in Windows, all `LF` will be converted to `CRLF`.

```sh
$ git config --global core.autocrlf true
```

See more info on [StackOverflow thread](https://stackoverflow.com/questions/2825428/why-should-i-use-core-autocrlf-true-in-git).

> The only specific reasons to set `autocrlf` to `true` are:
> 
> - avoid git status showing all your files as modified because of the automatic EOL conversion done when cloning a Unix-based EOL Git repo to a Windows one (see issue 83 for instance)
> - _and_ your coding tools somehow depends on a native EOL style being present in your file

### Set git attributes

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

If you still see on Windows that Git doesn't change the files correctly, you can set this in `.editorconfig`.

```
root = true

[*]
end_of_line = lf
```

## Normalize line endings in all files

After setting `core.atuocrlf` or the `text` attribute, set this.

```sh
$ git add --renormalize .
```

Based on [StackOverflow thread](https://stackoverflow.com/questions/7156694/git-how-to-renormalize-line-endings-in-all-files-in-all-revisions) and [article](https://www.aleksandrhovhannisyan.com/blog/crlf-vs-lf-normalizing-line-endings-in-git/).

See [add --renormalize](https://git-scm.com/docs/git-add#Documentation/git-add.txt---renormalize) in the Git docs.

