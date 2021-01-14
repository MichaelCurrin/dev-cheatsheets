---
title: JSDoc
description: Writing docstrings for JS functions
---

Add docstrings to your JS functions using the JSDoc standard. There is a format to cover types and descriptions of variables to help developers knwo what to use for a function's input. This might help with intellisense suggestions and validation too.

IDEs like VS Code support synax highlightin to help write the docstrings.


## Resources

- [JSDoc](https://jsdoc.app/) homepage
- [Getting started](https://jsdoc.app/about-getting-started.html)
- [Params](https://jsdoc.app/tags-param.html)
- [Types](https://jsdoc.app/tags-type.html)


## CLI

Generate HTML documentation using the NPM package.

```sg
$ jsdoc book.js
```


## Syntax

### Overview

```javascript
/**
 * @param {string} title - The title of the book.
 * @param {string} author - The author of the book.
 */
function Book(title, author) {
}
```

### Name only

```javascript
/**
 * @param somebody
 */
function sayHello(somebody) {
}
```

### Name and type

```javascript
/**
 * @param {string} somebody
 */
function sayHello(somebody) {
}
```

### Name, type, and description

```javascript
/**
 * @param {string} somebody Somebody's name.
 */
function sayHello(somebody) {
}
```

Or with a hyphen.

```javascript
/**
 * @param {string} somebody - Somebody's name.
 */
function sayHello(somebody) {
}
```
 

### Optional

Use square brackets.

```javascript
/**
 * @param {string} [somebody] - Somebody's name.
 */
function sayHello(somebody) {
}
```


## Types

### Primitives

Note use of lowercase.

```
{string}
{number}
{boolean}

{(number|boolean)}
```

### Key-value pairs

```
{Object}
```

### Array

Array of strings.

```
{Array.<string>}
// or:
{string[]}
```

An array of `MyClass` instances.

```
{Array.<MyClass>}
// or:
{MyClass[]}
```

An array of key-value pair objects.

```javascript
/**
 * Assign the project to a list of employees.
 *
 * @param {Object[]} employees - The employees who are responsible for the project.
 * @param {string} employees[].name - The name of an employee.
 * @param {string} employees[].department - The employee's department.
 */
```

### Nullable

A number or null.

```
{?number}
```

### Non-nullable

A number, but never null.

```
{!number}
```
