---
description: Print colored text with `echo`
---
# Colors


## Basic

Use ANSI codes escaped as `\e[CODEm` where `CODE` is an ANSI code.

You must use the `-e` flag and also double quotes.

```sh
echo -e "\e[31mHello, world"
# Reset.
echo -e "\e[31mHello, world\e[0m"
# Change styles.
echo -e "\e[31mHello, \e[0m\e[1mworld"
# Set text and background colors.
echo -e "\e[33m\e[42mHello, world"
```

When to reset:

- You don't have to use a reset code at the end when using the terminal. The next echo will be back to normal.
- But when running multiple prints in a script, you do need to **reset** otherwise you'll keep the style. Or use this to your advantage - set the color on the initial echo and then only reset a couple lines down.
-

## Reuse

As a function. Use one quoted string or multiple unquoted words.

```sh
warn() {
  echo -e "\e[31m$@\e[0m"
}

warn 'This text will be red'
# => This text will be red
```

As an alias. This seems to include a leading space.

```sh
alias warn='echo -e "\e[31m"'
warn 'This text will be red'
# =>  This text will be red
```


## Mapping

Note that Normal can remove bold and dim but not colors, while Reset can remove both.

| Style                 | Code |
| --------------------- | ---- |
| Reset                 | 0    |
| Normal                | 22   |
| Bold                  | 1    |
| Dim                   | 2    |
| Underline on          | 4    |
| Underline off         | 24   |
| Blink start           | 5    |
| Blink end             | 25   |
| Inverse pallete start | 7    |
| Inverse pallete end   | 27   |
| Conceal               | 8    |


| Color      | Text code | Background code |
| ---------- | --------- | --------------- |
| Black      | 30        | 40              |
| Red        | 31        | 41              |
| Green      | 32        | 42              |
| Yellow     | 33        | 43              |
| Blue       | 34        | 44              |
| Magenta    | 35        | 45              |
| Cyan       | 36        | 46              |
| Light Grey | 37        | 47              |
