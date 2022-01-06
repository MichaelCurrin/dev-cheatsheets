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
const RocketComponent = props => <div>my rocket component. {props.fuel}!</div>;

const MemoizedRocketComponent = React.memo(RocketComponent);
```
