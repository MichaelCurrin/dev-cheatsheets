# ESLint cheatsheet

- [Configuring](https://eslint.org/docs/user-guide/configuring) doc.
- [Rules](https://eslint.org/docs/rules/)


## Script settings

Approaches to ignore within a script, where `[RULE, ]` below could be empty, or one more or more rules such as `no-alert, quotes, semi`.

For more detail than below, you can set level as 0, 1 or 2 - [Configuring rules](https://eslint.org/docs/user-guide/configuring.html#configuring-rules).


### Ignore all warnings in a file

Place at the top of the file:

```javascript
/* eslint-disable [RULE, ] */
COMMAND
COMMAND
```

## Ignore in a section of a file

```javascript
COMMAND

/* eslint-disable [RULE, ] */
COMMAND
COMMAND
/* eslint-enable [RULE, ] */

COMMAND
```

### Ignore the next line

```
// eslint-disable-next-line [RULE, ]
COMMAND
```

### Ignore a rule in the current line

```javascript
COMMAND // eslint-disable-line [RULE, ]
```

## Config

Filename:

```
.eslintignore
```
