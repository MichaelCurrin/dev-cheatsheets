# Template literals


## Basic

Subsitute a JS expression in a string. 

```javascript
const x = 'abc'
const y = 123

`Value: ${x}`
// 'Value: abc'
```


Usually just a variable but you can do a function call, method call, ternary, etc.

```javascript
const x = 'abc'
const y = 123

`${x.toUpperCase()} - ${y}`
// 'ABC - 123'
```


## Tagged template literals

### Basic

```javascript
myFunction`Some string here`
// Same as:
myFunction( ['Some string here'] )
```

### Pass a variable

```javascript
const x = 'Joe';

myFunction`They call me ${x} around here`
// Same as:
myFunction(['They call me ', ' around here'], x)
```

### Styled components example

From [Styled components](https://styled-components.com/docs/advanced#tagged-template-literals) docs.

 Text centering won't break if props.upsidedown is falsy.

```javascript
const Title = styled.h1`
  ${props.upsidedown && 'transform: rotate(180deg);'}
  text-align: center;
`;
```

### JSX example

If you want to write JSX code but don't want to add Babel, you can write you code as a tagged template literal using a library like [htm](https://www.npmjs.com/package/htm).

```javascript
html`<div>Hello, { name }</div>`
```

e.g. React example from the docs.

```jsx
import ReactDOM from 'react-dom';
import { html } from 'htm/react';

ReactDOM.render(
  html`<a href="/">Hello!</a>`,
  document.body
);
```

The docs on NPM also cover advanced usage with `h` or `htm` instead of `html`.
