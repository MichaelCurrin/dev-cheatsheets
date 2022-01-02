# Character classes

| Symbol        | Description                              |
| ------------- | ---------------------------------------- |
| `\d `         | digit. Same as `[0-9]`                   |
| `\D`          | not a digit                              |
| `\w`          | word character  - same as `[a-z]`        |
| `\W`          | not word character                       |
| `[a-z]`       | Lowercase alphabet                       |
| `[a-zA-Z]`    | Any letter of the alphabet, any case.    |
| `[a-zA-Z0-9]` | Alphanumeric                             |
| `\s`          | Whitespace                               |
| `\S`          | Not whitespace                           |
| `\b`          | Word boundary, like space or punctuation |
| `.`           | Any character, except a newline          |
| `:alpha:`     | Letter                                   |
| `:digit:`     | Digit                                    |
| `:space:`     | Space                                    |
| `:blank:`     | Space or tab, but not a newline.         |

You can also use word boundary to pick up letters. e.g. `\b\s+\b` can be used to find spaces surrounded by letters, i.e. ignoring part of a line starting with spaces.

Escaped literal characters:

| Symbol | Description             |
| ------ | ----------------------- |
| `\.`   | A literal dot           |
| `\n`   | A newline character     |
| `\t`  | A tab character         |
| `\\`   | A literal backspace     |
| `\$`   | A literal dollar sign   |
| `\?`   | A literal question mark |
| `\(`   | A literal bracket       |
| `\[`   | A literal bracket       |

