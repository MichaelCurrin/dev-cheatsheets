# Component lifecycle

See this [Lifecycle diagram](https://projects.wojtekmaj.pl/react-lifecycle-methods-diagram/) which the React docs recommend as a cheatsheet.

## Class component methods

The methods below make sense for class component - I don't know about for a functional component.

### Mounting

1. `constructor()`
1. `static getDerivedStateFromProps()`
1. `render()`
1. `componentDidMount()`

### Updating

1. `static getDerivedStateFromProps()`
1. `shouldComponentUpdate()`
1. `render()`
1. `getSnapshotBeforeUpdate()`
1. `componentDidUpdate()`

