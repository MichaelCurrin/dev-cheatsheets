# ls

Some useful or frequently-used flags

Note that some commands work differntly on macOS and Linux.

## Short and long

| Flag                        | Description                                                                                                                     |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `--color`                   | Add color to output. Only valid on Linux. Example: `--color=auto`.                                                              |
| `--group-directories-first` (Linux) | Sort by directories first. For macOS, the recommendation is to use coreutils but I did not get this to work.
| `-F --classify`             | Add type as one of: `*/=>@|`                                                                                                    |
| `-A --almost-all`           | List all files including Hidden files, but not implied `.` and `..` . Always set for the super-user according to Linux manpage. |
| `-a`                        | Include directory entries whose names begin with a dot. (Note using `-A` is probably preferred to `-a`.)                        |
| `-S`                        | Largest files first                                                                                                             |
| `-t`                        | Newest modified first.                                                                                                          |
| `-d`                        | Show directories themselves and not their contents.                                                                             |
| `-R`                        | Recursive.                                                                                                                      |
| `-r`                        | Reverse order.                                                                                                                  |

### Color

| Flag                        | Description                                                                                                                     |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `-G` (macOS) | Enable color output. |
| `--color=FORMAT` (Linux) | e.g. `--color=auto` |


## Long listing

| Flag            | Description                                        |
| --------------- | -------------------------------------------------- |
| `-l`            | Show long listing                                  |
| `-G --no-group` (Linux) | Remove group column in long listing.       |
| `-h`            | Show human-readable size in long listing. `ls -lh` |
| `-C`            | Force multi-column output.                         |
| `-1`            | Show names only but as single column.              |
| `--full-time`   | Show ISO time.                                     |
