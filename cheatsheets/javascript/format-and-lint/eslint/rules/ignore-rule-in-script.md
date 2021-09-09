# Ignore rule in script

Approaches to ignore within a script, where `[RULE, ]` below could be empty, or one more or more rules such as `no-alert, quotes, semi`.

Minimal setting would be to use double quotes and semi-colons, or flip it to single quotes and no semi-colons.

You can also use an IDE formatter or the CLI (`eslint . --fix`) to change files based on your config or default settings.

For more detail than below, you can set level as 0, 1 or 2 - [Configuring rules](https://eslint.org/docs/user-guide/configuring.html#configuring-rules).


## Related

- [ESLint ignore config]({{ site.baseurl }}{% link cheatsheets/javascript/format-and-lint/eslint/config-files/ignore.md %}) - ignore a path, rather than a rule.


## Ignore entire file

Place at the top of the file:

```javascript
/* eslint-disable [RULE, ] */
COMMAND
COMMAND
```


## Ignore a section

```javascript
COMMAND

/* eslint-disable [RULE, ] */
COMMAND
COMMAND
/* eslint-enable [RULE, ] */

COMMAND
```


## Ignore next line

```javascript
// eslint-disable-next-line [RULE, ]
COMMAND
```


## Ignore current line

```javascript
COMMAND // eslint-disable-line [RULE, ]
```
