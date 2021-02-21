# Components


## Component types

### Functional component

The modern, easy-to-test way.

```jsx
function Welcome(props) {
  return <h1>Hello, { props.name }</h1>;
}
```

Or with destructuring:

```jsx
function Welcome(props) {
  const { name } = props;
  
  return <h1>Hello, { name }</h1>;
}
```

### Class component

The older, more verbose way.

```jsx
class Welcome extends React.Component {
  render() {
    return <h1>Hello, {this.props.name}</h1>;
  }
}
```

See documentation on [React.Component](https://reactjs.org/docs/react-component.html).


## Choosing an approach

See blog post [Functional vs Class-Components in React](https://medium.com/@Zwenza/functional-vs-class-components-in-react-231e3fbd7108)

> If you need a **state** in your component you will either need to create a **class** component or you lift the state up to the **parent** component and **pass** it down the functional component via props.

Reasons to use functional components:

> 1. Functional component are much easier to read and test because they are plain JavaScript functions without state or lifecycle-hooks.
> 2. You end up with less code.
> 3. They help you to use best practices. It will get easier to separate container and presentational components because you need to think more about your component’s state if you don’t have access to `setState()` in your component.
> 4. The React team mentioned that there may be a performance boost for functional component in future React versions.



## Component lifecycle

See this [Lifecycle diagram](https://projects.wojtekmaj.pl/react-lifecycle-methods-diagram/) which the React docs recommend as a cheatsheet.

The methods below make sense for class component - I don't know about for a functional component.

### Mounting

1. `constructor()`
2. `static getDerivedStateFromProps()`
3. `render()`
4. `componentDidMount()`

### Updating

1. `static getDerivedStateFromProps()`
2. `shouldComponentUpdate()`
3. `render()`
4. `getSnapshotBeforeUpdate()`
5. `componentDidUpdate()`


## Resources

- [React.Component](https://reactjs.org/docs/react-component.html) in the React docs.

Tutorials:

- [W3 Schools - React components](https://www.w3schools.com/react/react_components.asp)
- [Class Component Overview in React](https://www.digitalocean.com/community/tutorials/react-class-components)
- [ReactJS \| Class Based Components](https://www.geeksforgeeks.org/reactjs-class-based-components/)
