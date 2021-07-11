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
> aka a map or hash or associative array

### Key and value as strings

Inline:

```typescript
let foo: { [key: string]: string } = {}

foo['abc'] = '123'
```

With a type:

```typescript
type keyValuePairs =  { [key: string]: string }

let foo: keyValuePairs = {}
foo['abc'] = '123
```

### Value as number

```javascript
type CountResult = { [key: string]: number };
```

### Key from available keys

You'll get an error if using a union as a key.

From [#24220](https://github.com/Microsoft/TypeScript/issues/24220) in TS issues.

```javascript
type Foo = 'a' | 'b';
type Bar = {[key in Foo]: any};
```
