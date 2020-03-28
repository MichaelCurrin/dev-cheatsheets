# ESLint cheatsheet

Where `[RULES]` below could be empty, or one more or more rules such as `no-alert, quotes, semi`.

## Script settings

### Ignore all warnings in a file.

```javascript
/* eslint-disable [RULE, ] */
COMMAND
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
