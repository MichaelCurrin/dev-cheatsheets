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

Note use of lowercase.

```
{string}
{number}
{boolean}

{(number|boolean)}
```

### Key-value pairs

Note use of titlecase.

```
{Object}
```

e.g.

```javascipt
/**
 * @param {Object[]} employee - The employees who is responsible for the project.
 */
```

If you want to break out the attributes with the type, key name and description:

```javascipt
/**
 * @param {Object[]} employee - The employees who is responsible for the project.
 * @param {string} employee.name - The name of the employee.
 * @param {string} employee.department - The employee's department.
 */
```

### Array

Array of strings.

```
{string[]}
// or:
{Array.<string>}
```

An array of `MyClass` instances.

```
{MyClass[]}
// or:
{Array.<MyClass>}
```

An array of key-value pair objects:

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

Either number or null.

```
{?number}
```

### Non-nullable

A number that is required never null (or undefined).

```
{!number}
```
