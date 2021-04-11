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

### Attributes

Here, inline CSS.

```jsx
function App(){
  return <h1 style={{ color: 'red' }}>
    Hello, World!
  </h1>
}
```

### JS expressions in JSX

Use `{ EXPRESSION }`.

```jsx
function App(props){
 const { age } = props

  const status = age >= 18 ? 'major' : 'minor'

  return (
    <>
      <h1>Hello</h1>
      <p>{ status }</p>
    </>
  )
} 
```

Using a ternary expression.

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

Setting a function as an event.

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

Or `this.setState` above but I need to test.

Here using an intermediate function. Useful for multiple lines that would not good look is JSX.
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
