# Data structures


## Array

```typescript
string[]
number[]
```

Or the longer form:

```typescript
Array<string>
Array<number>
```


## Tuple

```typescript
[string, number]
```

Example:

```typescript
type Foo = [string, number]
```

Inside an interface.

```typescript
interface Foo {
  value: [string, number]
}
```


## Dictionary

Set the type of an object as a dictionary / map / hash / associative array so that you can have type compilation pass and you can perform operations on an object knowing that it will behave as a dictionary.

You don't need to always set the type as it can be inferred where it used (like when passed to a function).

But at object definition time, including in unit tests, it can help to ensure you have all the attributes set and of the right type.

You need to define both the type of the key and of the values. 

- Note that JavaScript requires a key to always be a string (unless you use `Map` instead).
- While value could be something like: `any`, `number`, `string`, `number | string`, `string[]`.
- In the cases here, we don't require any specific keys to exist and let the data be freeform.

### String value

Inline:

```typescript
let foo: { [key: string]: string } = {}

foo['abc'] = '123'
```

With a type - this is usually more readable and reusable.

```typescript
type KeyValuePairs = { [key: string]: string }

const foo: KeyValuePairs = {}
foo['abc'] = '123'

const bar: KeyValuePairs = {
  abc: '123',
  def: '456'
}
```

In a function.

```typescript
function foo(bar: KeyValuePairs) {
  const keys = Object.keys(bar)
  console.log(keys)
}
```

### Number value

```javascript
type CountResult = { [key: string]: number };
```

### Nested dictionary value

Here we set the value of the dictionary to also be a dictionary, but with fixed structure of `count` as key as `number` as a type.

```typescript
export type MyType = { [key: string]: { count: number } };

const foo: MyType = {
  abc: {
    count: 1
  },
  def: {
    count: 2
  }
}
```

### Enforce specific keys

Set up your type with each of the named keys and their types.

```typescript
type MyType = {
  KEY_NAME: VALUE_TYPE,
  // ...
}
```

Here with two required keys and `buzz` as optional key. The order doesn't matter of required vs optional, like it does in functions.

```typescript
type MyType = {
  foo: number,
  bar: string,
  buzz?: string
}

const x:M yType = {
  foo: 123,
  bar: "abc"
}

const y :MyType = {
  foo: 123,
  bar: "abc",
  buzz: "def"
}
```

This is different - `buzz` is a required key but its value could be `undefined`.

```typescript
type MyType = {
  foo: number,
  bar: string,
  buzz?: string
}
```


### Key from available keys

Set the type of a string key when looking up a value.

You'll get an error if using a union as a key, so must do this.

From [#24220](https://github.com/Microsoft/TypeScript/issues/24220) in TS issues.

```javascript
type Foo = 'a' | 'b';
type Bar = {[key in Foo]: any};
```
