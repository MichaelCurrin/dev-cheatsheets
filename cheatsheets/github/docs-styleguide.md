# Docs styleguide

## Variables

Options shown with examples.

### URL

```
https://github.com/<USERNAME>
https://github.com/{USERNAME}
https://github.com/[USERNAME]
```

Curly brackets are used in Shell so don't work everywhere.

Hard brackets are used for optional values in CLIs so could be misleading.


### Shell

Avoid using `$VAR` , then someone knows to use their own value.

```
command PATH
```

```
command <PATH_TO_DIR>/foo
```

You can also use lowercase - from a git command's help:

```sh
git pull <remote> <branch>
```


## Menu

At the top of a file, you can give a summary horizontally of important links.

Use an `emdash` rather than a pipe, for increased spacing. I've seen this in use before.

Code:

```markdown
[foo](target) &mdash; [bar](target)
```

Result:

[foo](target) &mdash; [bar](target)

### About the emdash

The mdash or emdash is the width of the letter **M** while the endash is the width of the letter **N**.

#### HTML

`&mdash;`

Read more here - [HTML emdash](https://www.html.am/html-codes/character-codes/html-em-dash-code.cfm).

#### Text

Instead of the HTML symbol you can use the plain text one: `—`.

Note that this can look different depending on the view - GH markdown editor view it looks too narrow but on a markdown rendered page it looks wide. And it is not used with spaces on each side.

Here are keyboard shortcuts:

- Windows: <kbd>CTRL</kbd>+<kbd>ALT</kbd>+<kbd>-</kbd>
- macOS: <kbd>SHIFT</kbd>+<kbd>OPTION</kbd>+<kbd>-</kbd>

 From [emdash](https://www.grammarly.com/blog/why-you-should-love-the-em-dash/) article on Grammarly site.
