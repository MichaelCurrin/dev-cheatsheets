---
description: How to parse args given to a Node.js script
---
# Argument parsing


## Resources

- [Accept arguments from the command line](https://nodejs.dev/learn/nodejs-accept-arguments-from-the-command-line) on the Node.js Learn site


## Code

### Basic

Use `process.argv`. Drop the first two arguments, which are the path to Node and the current script.

```javascript
const args = process.argv.slice(2)
console.log(args)
```

Example usage:

```sh
$ node app.js foo --bar=bazz
```
```
[ 'foo', '--bar=bazz' ]
```

### Keyword arguments

You need a package like [minimist](https://www.npmjs.com/package/minimist) to parse key-value pairs for you.

```javascript
const minima = require('minimist')

const args = minima(process.argv.slice(2))
console.log(args['name'])
```

Example usage.

```sh
$ node app.js --bar=bazz
```
```
joe
```
