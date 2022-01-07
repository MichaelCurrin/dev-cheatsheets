# Memo

Usually all of React components will go through a render when changes are made.

But we can refactor so components only re-render if their props change, improving performance.

- Class components - use `PureComponent` or `shouldComponentUpdate`
- Functional components - use `React.memo()`.

From [post][] in 2018.

```javascript
const MyComponent = React.memo(function MyComponent(props) {
  /* only rerenders if props change */
});
```

[post]: https://reactjs.org/blog/2018/10/23/react-v-16-6.html

Wrap an existing component:

```jsx
import React from "react"

function RocketComponent() {
  return <div>my rocket component. { props.fuel }!</div>;
}

const MemoizedRocketComponent = React.memo(RocketComponent);
```

Or

```jsx
import React from "react";

const Todos = ({ todos }) => {
  console.log("child render");
  
  return (
    <>
      <h2>My Todos</h2>
      
      {todos.map((todo, index) => {
        return <p key={ index }>
          {todo}
        </p>;
      })}
    </>
  );
};

export default React.memo(Todos);
```


See also `useMemo` under Hooks.
