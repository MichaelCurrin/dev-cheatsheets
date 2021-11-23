# Flags

Highlights of some of the flags I use most or want to use.


## Common

| Short    | Long             | Description                                     |
| -------- | ---------------- | ----------------------------------------------- |
| `-r, -R` | `–-recursive`    | Recursive                                       |
| `-v`     | `–-invert-match` | Invert match                                    |
| `-i`     | `–-ignore-case`  | Case insensitive                                |
| `-c`     | `--count`        | Print only a count of selected lines per `FILE` |
| `-n`     | `--line-number`  | Print line number with output lines             |


## Change output

| Short | Long                    | Description                                                                                                                                                            |
| ----- | ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `-A`  | `--after-context=NUM`   | Print num lines of trailing **context**                                                                                                                                |
| `-o`  | `--only-matching`       | Show only **nonempty** parts of lines that match - this is useful when there are multiple matches on a line and you want to show each match on a separate line         |
| `-H`  | `–-with-filename`       | Print **file name** with output lines  (This is the default)                                                                                                                                |
| `-h`  | `–-no-filename`         | **Suppress** the file name prefix on output                                                                                                                            |
| `-l`  | `–-files-with-matches`  | Print only names of `FILE`s **with** selected lines. i.e. Not the lines matched. A file name only appears once. |
| `-L`  | `-–files-without-match` | Print only names of `FILE`s with **no** selected lines. This is similar to using `-v` to invert the match, except also means you'll see a file path covered only once. |


## Type of matches

| Short | Long                | Description                                                 |
| ----- | ------------------- | ----------------------------------------------------------- |
| `-E`  | `-–extended-regexp` | Extended regex. Same as `egrep`.                            |
| `-F`  | `–-fixed-strings`   | Same as `fgrep`.                                            |
| `-G`  | `–-basic-regexp`    | Basic regex (default).                                      |
| `-P`  | `-–perl-regexp`     | Perl regular expression. Used to match non-greedy using `?` |


## Pattern

| `-f PATH` | `-–file PATH`           | take `PATTERNS` from FILE             |
| `-e`      | `--regexp=PATTERNS`    | use `PATTERNS` for matching           |
