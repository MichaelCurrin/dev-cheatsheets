# Loops


## Using map

You can use `.map` on an array as in plain JS to build up a list of elements such as `li`, then put them inside a wrapping element such as `ul`.

```jsx
function NumbersList(props) {
  const { numbers } = props

  const items = numbers.map(item => <li>{ x }</li>)

  return <ul>{ items }</ul>
}

const numbers = [1, 2, 3]
<NumbersList numbers={ numbers } />
```


## Add a key

- Add a key to each element in the element array created with `map`, to give each element a stable indentity during add, remove, or update.
- This is recommended for performance reasons.
- Make sure the key is something **unique**, though it only has to be unique across siblings within the list, not across lists.
- An index is the default behavior if you do not set a key.
- You can also set an index yourself - see below. 
- But, do **not** use indexes if the order of your list might change, as this can cause performance and state issues. See [article][] for more info.

e.g.

```jsx
<li key={ value.toString() }>
  { value }
</li>
```

Or using an ID, if one is available.

```jsx
<li key={ value.id }>
  { value.text }
</li>
```

How to set with an enumerated index.

```jsx
items.map((item, index) => {
  <li key={ index }>
    { item.text }
  </li>
})
```

[article]: https://medium.com/@robinpokorny/index-as-a-key-is-an-anti-pattern-e0349aece318

Example:

```jsx
function ListItem(props) {
  const { value } = props;
  
  return <li>{ value }</li>
}

function NumberList(props) {
  const { numbers } = props
  const items = numbers.map(items => {
    <ListItem key={ item.toString() } value={ item } />
  })
  
  return <ul>{ items }</li>
}
```
