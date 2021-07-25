# Closures

A closure or "block scope" defines variables in a scope with curly braces and these and do not persist out the scope.


## Approaches

### For loop

See [Looping][] section.

### If else

See [Control flow][] section.


## Functions

See [Functions][] section.

### Any plain block

Defining a constant variable in a scope.

```javascript
{
    const x = 1
    console.log(x)
    // 1
}

console.log(x)
// Uncaught ReferenceError: x is not defined
```

Defining a variable in the outer scope, overriding it in the inner scope and then using the outer one again.

```javascript
let x = 1

{
    x = 2
    console.log(x)
    // 2
}

console.log(x)
// 1
```


## Scoping a variable


[Control flow]: {{ site.baseurl }}{% link cheatsheets/javascript/general/control-flow/index.md %}
[Functions]: {{ site.baseurl }}{% link cheatsheets/javascript/general/functions.md %}
[Looping]: {{ site.baseurl }}{% link cheatsheets/javascript/general/looping.md %}
