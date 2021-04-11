# Props

{% raw %}

Pass values to a component.

A few approaches are covered below. These are just standard JavaScript and JSX is not even used here. But these are the ways that properties are passed in React apps so they are all covered here.


## Attributes 


```jsx
function App(props){
  console.log(props.foo, props.bar)

  // return ...
}
```

## Destructure object

```jsx
function App(props){
  const { foo, bar } = props

  console.log(foo, bar)

  // return ...
}
```


## Destructured params 

```jsx
function App({ foo, bar }){
  console.log(foo, bar)

  // return ...
}
```



{% endraw %}
