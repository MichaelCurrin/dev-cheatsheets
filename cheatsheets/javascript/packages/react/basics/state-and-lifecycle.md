# State and lifecycle

Based on [tutorial](https://reactjs.org/docs/state-and-lifecycle.html)


## No state

Here we have no state. We call render every second and return a new element from `Clock`.

```jsx
function Clock(props) {
  const now = props.date.toLocaleTimeString()
  
  return (
    <div>
      <h1>Hello, world!</h1>
      <h2>It is { now }.</h2>
    </div>  
  );
}

function tick() {
  ReactDOM.render(
    <Clock date={new Date()} />,   
    document.getElementById('root')
  );
}

setInterval(tick, 1000);
```


## Make stateful component

### 1. Convert to class

Here we make `Clock` responsible to updating itself. Only one instance of `Clock` is created and then the `render` method is called for UI updates.

We add state to `Clock` by making it a class with a single method and use `this.props` in place of `props`.

```jsx
class Clock extends React.Component {
  render() {
    const now = this.props.date.toLocaleTimeString() 
    
    return (
      <div>
        <h1>Hello, world!</h1>
        <h2>It is { now }.</h2>
      </div>  
    );
  }
}

ReactDOM.render(
  <Clock date={ new Date() } />,   
  document.getElementById('root')
);
```

### 2. Add state to class

1. Replace `this.props` with `this.state`.
1. Add a constructor to set the initial state. 

In this case, we don't need any props values to be passed and so let the constructor set the time.

```jsx
class Clock extends React.Component {
  constructor(props) {
    super(props)
    this.state = { date: new Date() }
  }

  render() {
    const now = this.state.date.toLocaleTimeString()
    
    return (
      <div>
        <h1>Hello, world!</h1>
        <h2>It is { now }.</h2>    
      </div>
    );
  }
}

ReactDOM.render(
  <Clock />,   
  document.getElementById('root')
);
```

Each instance of `Clock` has its own independent state.

Sample:

```jsx
function App() {
  return (
    <>
      <Clock />      
      <Clock />     
      <Clock />    
    </>
  );
}

ReactDOM.render(
  <App />,
  document.getElementById('root')
);
```

### 3. Add lifecycle methods

Here free up resources taken by the components when they are destroyed.

On mount, we use `componentDidMount` set up the timer.

And on unmount, we use `componentWillUnmount` to clear the timer.

NB. Use `this.setState` method to change state. Do not change values directly on `this.state` except in the constructor.

```jsx
class Clock extends React.Component {
  constructor(props) {
    super(props)
    this.state = { date: new Date() }
  }
  
  tick() {
    this.setState({ date: new Date() })
  }
  
  componentWillMount() {
    this.timerId = setInterval(() => this.tick(), 1000)
  }
  
  componentWillMount() {
    clearInterval(this.timerId)
  }

  render() {
    return (
      <div>
        <h1>Hello, world!</h1>
        <h2>It is {this.state.date.toLocaleTimeString()}.</h2>
      </div>
    );
  }
}

ReactDOM.render(
  <Clock />,   
  document.getElementById('root')
);
```

### 4. Handle asynchronous behavior

React might batch `setState` requests for performance.

This values of `this.props` and `this.state` may be updated asychronously.

This may fail to update correctly:

```js
this.setState({
  counter: this.state.counter + this.props.increment,
});
```

So rather pass a function to `setState` which has `state` and `props` as parameters.

```js
this.setState((state, props) => {
  counter: state.counter + props.increment
})
```

### 5. Set multiple variables on the state

When you call `this.setState`, values are merged in so only the relevant keys are updated and the rest are left intact.

```js
class Clock extends React.Component {
  constructor() {
    this.state = {
      posts: [],
      comments: []
    }
  }
  
  componentWillMount() {
    fetchPosts()
      .then(resp => this.setState({ posts: resp.posts })
      
    fetchComments()
      .then(resp => this.setState({ comments: resp.comments })
  }
}
```

### 6. Data flows down

State should be local or encapsulated. Other components should not be able to see the state of a component.

You can however pass a component's state down to a child component, which doesn't care where the data comes from but just finds it on the props.

```jsx
function FormattedDate(props) {
  return <h2>It is {props.date.toLocaleTimeString()}.</h2>;
}

<FormattedDate date={this.state.date} />
```
