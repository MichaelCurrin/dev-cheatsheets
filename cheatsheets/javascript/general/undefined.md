# undefined

There are common encounters of `undefined`.

## Intilialize

Set up a var or let variable with no initial value.

```js
var x;
x;
// undefined 

x = 123
x
// 123
```

Note that `const` variables need to be set to a value.


## Check if key is defined

In JS you will get undefined if a key is missing on an object of key/value pairs. In Ruby you get null and Python you get an error. 

How to check for undefined and give an error:

```js
const respData = await requestApi()

const name = respData.name

if (typeof name === "undefined") {
  console.error("Missing 'name' on API response")
}
```

```js
const MY_VAR = process.env.MY_VAR

if (typeof MY_VAR === 'undefined') {
  throw new Error('Must set MY_VAR on environment variables')
}
```


## Use a fallback 

See more info in [Optional chaining][].

[Optional chaining]: {% link cheatsheets/javascript/general/optional-chaining.md %}

In newer JS you can use `??` to replace null and undefined with a default.

```js
const respData = await requestApi()
// e.g. Objecy with age and no name.
// { age: 123 }

const name = respData.name ?? ""

console.log(name.toUpperCase())
```

```js
const MY_VAR = process.env.MY_VAR ?? ""

console.log(MY_VAR.toUpperCase())
```

In older JS, you can use `||` instead. With the downside that falsey values like zero, false, and an empty string will be replaced too.

```js
const MY_VAR = process.env.MY_VAR || ""

console.log(MY_VAR.toUpperCase())
```


## Check if function argument is defined 

JS does not enforce use of all positional arguments.

Here is how to do that yourself.

```js
function foo(abc) {
 if (typeof abc === 'undefined') {
   throw new Error('abc is a required argument')
  }
  console.log(abc)
}

foo(123)
foo(null)
foo() // error
```


## Skip positional arguments

Another use is to skip positional arguments by passing a value explicitly as undefined, assuming it is optional.

```js
foobar("abc", undefined, 456)
```

In Python this is not need as you can switch to keyword params.

```python
foobar("abc", third_param=456)
```
