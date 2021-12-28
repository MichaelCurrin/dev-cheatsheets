---
title: JSX
---

This page is generic - for guide specific to React, see the [React JSX][] page.

See also [JSX][] in my Code Cookbook.

[JSX]: https://michaelcurrin.github.io/code-cookbook/recipes/javascript/general/jsx.html


{% raw %}


## Comments

Based on [React JSX Comments](https://wesbos.com/react-jsx-comments/) guide.

```jsx
{/* A JSX comment */}
```


## Space

```jsx
{" "}
```

e.g.

```jsx
<button>Hello</button>
{" "}
<button>Goodbye</button>
```

This can be useful when you need to add space around another tag like a link. If you had in a plain space, that can get stripped out when a formatter is applied. So we explicitly add a space using the JS expression syntax.

```jsx
<p>
  We increment a numeric counter here, based on the{' '}
  <a href="https://reactjs.org/docs/hooks-state.html">
    Using the State Hook
  </a>{' '}
  tutorial in the React docs.
</p>
```

Or just add a non-breaking space in plain HTML. This gives the same result.

```html
&nbsp;
```

e.g.

```jsx
<button>Hello</button>
&nbsp;
<button>Goodbye</button>
```


## Pass values

See [React JSX][] cheatsheet for more complete examples in functions.


### Basic

Here we use a variable inside a JS expression within the inner HTML.

Use a variable name.

```jsx
const name = "World"

return <p>Hello, { name }!</p>
```

Or some other JS expression.

```jsx
const name = "World"

return <p>Hello, { name.toUpperCase() }!</p>
```

Using value directly on a function's properties:

```jsx
return <p>Hello, { props.name }!</p>
```

### Attributes

```jsx
EVENT={EXPRESSION}
```

```jsx
const path = "abc.png"

return <img src={ path } />
```

Plain HTML:

```jsx
<img src="abc.png" />
```

#### Events

Set an attribute like `onClick` with a function.

```jsx
EVENT={ MY_FUNCTION }
```

e.g.

```jsx
<button onClick={() => console.log('Hello')}>
  Click me
</button>
```

### CSS

```jsx
<h1 style={{ color: 'red' }}>
```

{% endraw %}


[React JSX]: {% link cheatsheets/javascript/packages/react/jsx.md %}
