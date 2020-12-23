---
description: Printing terminal text with color and style formatting
---
# Color


## Chalk
> Terminal string styling done right


A popular choice is `chalk`.

[chalk](https://www.npmjs.com/package/chalk) on NPM.

### Usage

Examples from the docs.

```javascript
const chalk = require('chalk');

console.log(chalk.blue('Hello world!'));
```

```javascript
const chalk = require('chalk');
const log = console.log;

// Combine styled and normal strings
log(chalk.blue('Hello') + ' World' + chalk.red('!'));

// Compose multiple styles using the chainable API
log(chalk.blue.bgRed.bold('Hello world!'));

// Pass in multiple arguments
log(chalk.blue('Hello', 'World!', 'Foo', 'bar', 'biz', 'baz'));
```
