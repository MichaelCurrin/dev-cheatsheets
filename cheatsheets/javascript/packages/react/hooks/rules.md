# Rules of hooks

From [Rules of hooks](https://reactjs.org/docs/hooks-rules.html) in the docs.

You can use the [eslint-plugin-react-hooks][] package to enforce this, as covered in the React doc linked above.

[eslint-plugin-react-hooks]: https://www.npmjs.com/package/eslint-plugin-react-hooks

## Rules

### Only call hoosk at the top level

Not inside loops, conditions, or nested functons.

This allows React to preserve the state between mutlipel `useState` and `useEffect` calls.

### Only call hooks from React functions

Don't call from regular JS functions.

Call from functional component or a custom hook.
