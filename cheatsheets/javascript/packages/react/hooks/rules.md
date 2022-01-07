# Rules of hooks

From [Rules of hooks](https://reactjs.org/docs/hooks-rules.html) in the docs.

You can use the [eslint-plugin-react-hooks][] package to enforce this, as covered in the React doc linked above.

[eslint-plugin-react-hooks]: https://www.npmjs.com/package/eslint-plugin-react-hooks

## Rules

- Only use hooks within a function. A functional component or a custom hook. Not in plain JS or a class component.
- Only use hooks at the top level of a component. Not inside loops, conditions (hooks cannot be conditional), or nested functons. This allows React to preserve the state between mutliple `useState` and `useEffect` calls.
