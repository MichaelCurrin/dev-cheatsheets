# Mount app

{% raw %}


## API

See [ReactDOM](https://reactjs.org/docs/react-dom.html) docs on React homepage. 

### render

Signature:

```
ReactDOM.render(element, container[, callback])
```


## How to render an app

Given HTML as:

```html
<body>
    <div id="app">
    </div>
</body>
```

### With JSX

```jsx
function Welcome() {

  return (
    <p>
      Hello, World!
    </p>
  );
}

ReactDOM.render(
  <Welcome />,
  document.getElementById('app')
);
```

### Without JSX

```javascript
function Welcome() {
  return React.createElement(
    'p',
    null,
    'Hello, World!',
  );
}

ReactDOM.render(
  React.createElement(Welcome, null), 
  document.getElementById('app')
);
```


{% endraw %}
