# End of line

You can edit files and commit then using one of the following line endings:

- Unix-style: `\n` i.e. LF ("line feed").
- Windows style: `\r\n` i.e. CRLF ("carriage return and line feed").


## Changing

You might get a message from `git status` as "LF will be replaced by CRLF".

Then you can change how Git behaves (see next section) or change your IDE's LF/CRLF setting.


## Set Auto-CRLF

```sh
$ git config --global core.autocrlf true
```

See [StackOverflow thread](https://stackoverflow.com/questions/2825428/why-should-i-use-core-autocrlf-true-in-git).

> The only specific reasons to set `autocrlf` to `true` are:
> 
> - avoid git status showing all your files as modified because of the automatic EOL conversion done when cloning a Unix-based EOL Git repo to a Windows one (see issue 83 for instance)
> - _and_ your coding tools somehow depends on a native EOL style being present in your file
