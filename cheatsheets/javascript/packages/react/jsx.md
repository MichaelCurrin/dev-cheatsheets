# JSX

This page is specific to React. For a more general guide, see the [JSX][] page.

[JSX]: {{ site.baseurl }}{% link cheatsheets/javascript/general/jsx.md %}


{% raw %}

## Structuring JSX

Add parent element. Such as a div with a class or just `<>`.

```jsx
return (
  <>
    <h1>Hello, World!</h1>
    <h2>This is React</h2>
  </>
)
```

Comma to separate items.

```jsx
return (
  <h1>Hello, World!</h1>,
  <h2>This is React</h2>
)
```

### CSS

Use `{{ EXPRESSION }}`.

```jsx
function App(){
  return <h1 style={{ color: 'red' }}>
    Hello, World!
  </h1>
}
```

### JS expressions in JSX

Use `{ EXPRESSION }`.

Substituting variables.

```jsx
function App(props){
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
function App(props){
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
function Image(props){
  const { path } = props

  return <img src={ path } />
} 
```

Setting a function as an event.

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

Or `this.setState` for class components. 

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

      <button onClick={increment}</button>
    </div>
  );
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

Without JSX. Create an element using the `createElement` function. Here it is aliased to `e`.

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

With JSX.

```jsx
function LikeButton() {
  return (
    <button onClick={() => this.setState({ liked: true })}>
      Like
    </button>
  );
}
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
