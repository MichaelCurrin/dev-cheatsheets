# JSX

This page is specific to React. For a more general guide, see the [JSX][] general page. Including various ways to process JSX.

[JSX]: {% link cheatsheets/javascript/general/jsx.md %}


{% raw %}

Creating elements or components (which are made of elements) using JSX syntax.

## Function vs variable

### Function

- JSX:
    ```jsx
    function Greet() {
      return <h1>Hello, World!</h1>
    }
    ```
    
    
With parameters:

- JSX:
    ```jsx
    function Greet(props) {
      const { name } = props;
      
      return <h1>Hello, { name }!</h1>
    }
    ```
    
### Variable

```jsx
const el = h1>Hello, World!</h1>
```

```jsx
const name = 'World'
const greet = h1>Hello, {name}!</h1>
```


## Structuring JSX

Using approaches like outer elements or not for writing JSX.

### Single element

This is a simple case. Just return a single flat element.

- JSX:
    ```jsx
    function Greet() {
      return <h1>Hello, World!</h1>
    }
    ```
- HTML DOM result:
    ```html
    <div id="root">
        <h1>Hello, World!</h1>
    </div>
    ```
- Compiled JS:
    ```javascript
    function Greet() {
      return React.createElement("h1", null, "Hello, World!");
    }
    ```

### Group elements without a parent element

Here we use an empty JSX fragment to group our elements together, but it won't get rendered.

- JSX:
    ```jsx
    return <>
        <h1>Hello, World!</h1>
        <h2>This is React</h2>
      </>
    ```
    Add brackets if you want to start the tag on its own line after `return`.
    ```jsx
    function Greet() {
      return (
        <>
          <h1>Hello, World!</h1>
          <h2>This is React</h2>
        </>
      )
    }
    ```
- HTML DOM result:
    ```html
    <div id="root">
        <h1>Hello, World!</h1>
        <h2>This is React</h2>
    </div>
    ```
- Compiled JS:
    ```javascript
    function Greet() {
      return React.createElement(React.Fragment, null,
        React.createElement("h1", null, "Hello, World!"),
        React.createElement("h2", null, "This is React"));
      }
    ```

Be careful of this. Without brackets, this would return `undefined`.

- JSX:
    ```jsx
    function Greet() {
      return
        <>
          <h1>Hello, World!</h1>
          <h2>This is React</h2>
        </>
    }
    ```

### Group elements under a parent element

Add a parent element. Such as a `div`, with a class if you like.

You can optionally use the brackets. It doesn't change the result but allows you to start your opening tag on a new line. Note there are no commas between elements.


- JSX:
    ```jsx
    function Greeting() {
      return <div className="my-class">
          <h1>Hello, World!</h1>
          <h2>This is React</h2>
        </div>
    }
    ```
    With brackets:
    ```jsx
    function Greeting() {
      return (
        <div className="my-class">
          <h1>Hello, World!</h1>
          <h2>This is React</h2>
        </div>
      )
    ```

- HTML DOM result:
    ```html
    <div id="root">
        <div class="my-class">
            <h1>Hello, World!</h1>
            <h2>This is React</h2>
        </div>
    </div>
    ```
- Compiled JS equivalent:
    ```javasript
    function Greeting() {
      return React.createElement(
        "div",
        { className="my-class" },
        React.createElement("h1", null, "Hello, World!"),
        React.createElement("h2", null, "This is React");
        );
    }
    ```

### JS expressions in JSX

Use `{ EXPRESSION }`.

Substituting variables.

```jsx
function Greet(props) {
 const { name, age } = props

  const status = age >= 18 ? 'major' : 'minor'

  return (
    <>
      <h1>Hello, { name }</h1>
      <p>{ status }</p>
    </>
  )
}
```

You can put an expression in like an arrow function call or ternary.

```jsx
function Greet(props) {
  const { age } = props

  return (
    <>
      <h1>Hello</h1>
      <p>{age >= 18 ? 'major' : 'minor'}</p>
    </>
  )
}
```

If your JSX gets long and complicated, consider rather making a variable first and then inserting that.

Setting attributes.

```jsx
function Image(props) {
  const { path } = props

  return <img src={ path } />
}
```

Setting a function as an event:

```jsx
function Greet() {
  return (
    <button onClick={() => alert("Hello!")}>
      Greet
    </button>
  );
}
```

```jsx
import { setState } from "react";

function LikeButton() {
  return (
    <button onClick={() => setState({ liked: true })}>
      Like
    </button>
  );
}
```

Or `this.setState` - possibly only for class components?

Here using an intermediate function. Useful for multiple lines that would not good look is JSX.

Usestate is unpacked as a value and a function to set, using your own names.

```jsx
import { useState } from "react";

export default function Counter() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>Count: {count}</p>

      const increment = () => setCount(count + 1)

      <button onClick={increment}>Click me</button>
    </div>
  );
}
```

### CSS

Put a key-value pair object inside your JS expression.

i.e. `{{ MY_CSS }}`.

e.g.

```jsx
function Greet() {
  return <h1 style={{ color: 'red' }}>
    Hello, World!
  </h1>
}
```

### Custom components

Insert a component as a element in JSX.

The first component here doesn't take any properties.

The second one takes a `name` property, which can be passed as a literal value or as a JS expression such as a variable.

```jsx
function Greet() {
  return <p>Hello</p>
}

function GreetPerson(props) {
  return <p>Hello, {props.name}!</p>
}

function App() {
  const name = "Joe"

  return (
    <div className="App">
      <Greet/>
      <GreetPerson name="World"/>
      <GreetPerson name={name}/>
    </div>
  )
}
```


## With and without JSX

Example from [React docs](https://reactjs.org/docs/add-react-to-a-website.html)

Writing code with JSX.

```jsx
function LikeButton() {
  return (
    <button onClick={() => this.setState({ liked: true })}>
      Like
    </button>
  );
}
```

Writing code without JSX - it is more verbose and less like HTML. Create an element using the `createElement` function. Here it is aliased to `e`.

```javascript
const e = React.createElement;

function LikeButton() {
  return e(
    'button',
    { onClick: () => this.setState({ liked: true }) },
    'Like'
  );
}
```


## Compiled JSX

See the [Babel REPL](https://babeljs.io/repl/) to get live conversion of your JSX to plain JS.

For example:

- Input
    ```jsx
    const element = <h1>Hello, world!</h1>;
    const container = document.getElementById('root');
    
    ReactDOM.render(element, container);
    ```
- Result
    ```jsx
    const element = /*#__PURE__*/React.createElement("h1", null, "Hello, world!");
    const container = document.getElementById('root');
    
    ReactDOM.render(element, container);
    ```


## Allow JSX syntax in TypeScript

From [IntrinsicElements](https://www.typescriptlang.org/docs/handbook/jsx.html#intrinsic-elements) in JSX docs of TS.

You can try as `.d.ts` to match [shims-vue.d.ts](https://github.com/MichaelCurrin/vue-typescript-quickstart/blob/master/src/shims-vue.d.ts), but Deno + TypeScript gave a me warning that it could not import so I had to use `.ts` instead.

### Catch-all

- `src/shims-react.ts`
    ```typescript
    declare namespace JSX {
      interface IntrinsicElements {
        [elemName: string]: any;
      }
    }
    ```

### Verbose

- `src/shims-react.ts`
    ```typescript
    declare namespace JSX {
      interface IntrinsicElements {
        h1: any;
        h2: any;
        div: any;
        p: any;
        // ...
      }
    }
    ```

{% endraw %}
