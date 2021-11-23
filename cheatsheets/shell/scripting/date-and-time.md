# Date and time


See [date][] command.

[date]: {% link cheatsheets/shell/commands/date/index.md %}

## Resources 

See [How To Format Date And Time In Linux, MacOS, And Bash?](https://www.shell-tips.com/linux/how-to-format-date-and-time-in-linux-macos-and-bash/).


## Unix timestamp

Use a built-in variable for current time in seconds.

```console
$ echo $EPOCHSECONDS
1614012035
```

Or as a float.

```console
$ echo $EPOCHREALTIME
1614012035.3449261189
```

Or use the `date` command with a format.

```console
$ date '+%s'
1614012035
```


