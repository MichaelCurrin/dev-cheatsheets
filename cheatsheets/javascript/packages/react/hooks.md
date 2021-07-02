---
title: Hooks
description: Manage state in React components
---

> Hooks are a new addition in React 16.8. They let you use state and other React features without writing a class.


{% raw %}

## useState

Get the state of a variable or fallback to default state.

See [Using the State Hook](https://reactjs.org/docs/hooks-state.html) in the React docs.

> `useState` is a Hook that lets you add React state to function components

Calling `useState` is a React hook to unpack a variable's value and its change handler to update it, like this:

```javascript
const [ value, setValue ] = useState("my default value");
```

Or

```javascript
const [ name, setName ] = useState("Sam");
```

An example from the docs with multiple variables.

```javascript
function ExampleWithManyStates() {
  const [age, setAge] = useState(42);
  const [fruit, setFruit] = useState('banana');
  const [todos, setTodos] = useState([{ text: 'Learn Hooks' }]);
}
```

### Comparison

Here are equivalent examples from the docs.

Setting up `count` and `setCount` comes as a pair and is similar to using `this.state.count` and `this.setState` in a Class component.

- Functional component with hooks.
    ```jsx
    import React, { useState } from 'react';

    function Example() {
      const [count, setCount] = useState(0);

      return (
        <div>
          <p>You clicked {count} times</p>
          <button onClick={() => setCount(count + 1)}>
            Click me
          </button>
        </div>
      );
    }
    ```
- Class component
    ```jsx
    class Example extends React.Component {
      constructor(props) {
        super(props);
        this.state = {
          count: 0
        };
      }

      render() {
        return (
          <div>
            <p>You clicked {this.state.count} times</p>
            <button onClick={() => this.setState({ count: this.state.count + 1 })}>
              Click me
            </button>
          </div>
        );
      }
    }
    ```

## useEffect

Perform **side effects** in Function components.

See [Using the Effect Hook](https://reactjs.org/docs/hooks-effect.html) in the React docs.

Here is an example where a function is run on state change, change the DOM outside of the component. Setting a value on `document` (or some element) uses the browser API.

```jsx
const [count, setCount] = useState(0);

useEffect(() => {   
  document.title = `You clicked ${count} times`;  
});
```

### Comparison

Use of `useEffect` is similar to `componentDidMount` and `componentDidUpdate` in a Class component.

- Functional component with hooks.
    ```jsx
    import React, { useState, useEffect } from 'react';

    function Example() {
      const [count, setCount] = useState(0);

      useEffect(() => {   
        document.title = `You clicked ${count} times`;  
      });

      return (
        <div>
          <p>You clicked {count} times</p>
          <button onClick={() => setCount(count + 1)}>
            Click me
          </button>
        </div>
      );
    }
    ```
- Class component
    ```jsx
    class Example extends React.Component {
      constructor(props) {
        super(props);
        this.state = {
          count: 0
        };
      }

      componentDidMount() {    
        document.title = `You clicked ${this.state.count} times`;  
      } 
      
      componentDidUpdate() { 
        document.title = `You clicked ${this.state.count} times`; 
      }
      
      render() {
        return (
          <div>
            <p>You clicked {this.state.count} times</p>
            <button onClick={() => this.setState({ count: this.state.count + 1 })}>
              Click me
            </button>
          </div>
        );
      }
    }
    ```
{% endraw %}
