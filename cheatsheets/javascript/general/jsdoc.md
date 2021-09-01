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

```sh
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

### Parameter name only

```javascript
/**
 * @param author
 */
function sayHello(author) {
}
```

### Name and type

```javascript
/**
 * @param {string} author
 */
function sayHello(author) {
}
```

### Name, type, and description

```javascript
/**
 * @param {string} author Somebody's name.
 */
function sayHello(author) {
}
```

Or with a hyphen.

```javascript
/**
 * @param {string} author - Somebody's name.
 */
function sayHello(author) {
}
```
 

### Optional

Use square brackets.

```javascript
/**
 * @param {string} author - Somebody's name.
 * // OR
 * @param {?string} author - Somebody's name.
 */
function sayHello(author) {
}
```


## Types

### Primitives

Note use of _lowercase_.

```
{string}
{number}
{boolean}

{(number|boolean)}
```

### Hashes

Aka key-value pair objects.

Note use of _titlecase_.

```
{Object}
```

e.g.

```javascipt
/**
 * @param {Object} employee - The employees who is responsible for the project.
 */
```

You cn break out the attributes using the name of the key.

```javascipt
/**
 * @param {Object} employee - The employees who is responsible for the project.
 * @param {string} employee.name - The name of the employee.
 * @param {string} employee.department - The employee's department.
 */
```

### Array

Array of strings.

```
{string[]}

// Or, less common:
{Array.<string>}
```

An array of `MyClass` instances.

```
{MyClass[]}

// Or, less common:
{Array.<MyClass>}
```

An array of hashes (key-value pair objects), with keys described for the items.

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

Value may be null, undefined, or set.

```
{?number}
```

### Required

Value is "non-nullable" i.e. must be set and never `null` or `undefined`.

```
{!number}
```
