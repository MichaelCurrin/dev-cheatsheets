---
title: JSX
---

This page is generic - for guide specific to React, see the [React JSX][] page.

[React JSX]: {{ site.baseurl }}{% link cheatsheets/javascript/packages/react/jsx.md %}

{% raw %}


## Comments

Based on [React JSX Comments](https://wesbos.com/react-jsx-comments/) guide.

```jx
{/* A JSX comment */}
```


## Space

```jx
${" "}
```

Or

```html
&nbsp;
```


## Pass values

See [React JSX][] cheatsheet for more complete examples in functions.

[React JSX]: {{ site.baseurl }}{% link cheatsheets/javascript/packages/react/jsx.html %}

### Basic

Use a variable name.

```jsx
name = "World"

return <p>Hello, {name}!</p>
```

Or some other JS expression.

```jsx
name = "World"

return <p>Hello, {name.toUpperCase()}!</p>
```

A value directly on function props.

```jsx
return <p>Hello, {props.name}!</p>
```

### Attributes

```jsx
EVENT={EXPRESSION}
```

```jsx
path = "abc.png"

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
