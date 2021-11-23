# Props

{% raw %}

Pass values to a component.

A few approaches are covered below. These are just standard JavaScript and JSX is not even used here. But these are the ways that properties are passed in React apps so they are all covered here.


## Attributes 

This is not so clear because you only see a variable unpacked when it is used. Which can be confusing in longer functions or if the variable is used in a complex JSX.

```jsx
function App(props) {
  console.log(props.foo, props.bar)

  // return ...
}
```

## Destructure object

This is clear as all the props are unpacked at the start of the function. So you know what it expects.
```jsx
function App(props) {
  const { foo, bar } = props

  console.log(foo, bar)

  // return ...
}
```


## Destructured params 

I have not seen this syntax so much. It allows the props variable so be left out and saves a line of code.
```jsx
function App({ foo, bar }) {
  console.log(foo, bar)

  // return ...
}
```

{% endraw %}
