# Props

{% raw %}

Pass values to a component.

A few approaches are covered below. These are just standard JavaScript and JSX is not even used here. But these are the ways that properties are passed in React apps so they are all covered here.

## Functional component

### Attributes 

This is not so clear because you only see a variable unpacked when it is used. Which can be confusing in longer functions or if the variable is used in a complex JSX.

```jsx
function Greet(props) {
  return <p>Hello, { props.name }</p>;
}

ReactDOM.render(
  <Greet name="World" />,
  document.getElementById('root')
);
```

### Destructure object

This is clear as all the props are unpacked at the start of the function. So you know what it expects.

```jsx
function Greet(props) {
  const { name, city } = props
  
  return <p>Hello, { name } of { city }</p>;
}


ReactDOM.render(
  <Greet name="World" city="New York"/>,
  document.getElementById('root')
);
```

### Destructured params 

I have not seen this syntax so much. It allows the props variable so be left out and saves a line of code.

```jsx
function App({ name, city }) {
  return <p>Hello, { name } of { city}</p>;
}

ReactDOM.render(
  <Greet name="World" city="New York"/>,
  document.getElementById('root')
);
```


## Class component

### Use props directly

Use `this.props`.

```jsx
class Greet extends React.Component {
  render() {
    return <p>Hello, { this.props.name }</p>;
  }


ReactDOM.render(
  <Greet name="World" />,
  document.getElementById('root')
);
```

### Destructure props

```jsx
class Greet extends React.Component {
  const { name } = this.props

  render() {
    return <p>Hello, {name}</p>;
  }
}

ReactDOM.render(
  <Greet name="World" />,
  document.getElementById('root')
);
```

{% endraw %}
