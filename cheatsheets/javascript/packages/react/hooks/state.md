# State hook

{% raw %}

Get the state of a variable or fallback to default state.

See [Using the State Hook][] in the React docs.

> `useState` is a Hook that lets you add React state to function components

[Using the State Hook]: https://reactjs.org/docs/hooks-state.html


## Syntax

Calling `useState` is a React hook to unpack a variable's value and its change handler to update it.

```javascript
useState(initialStateValue);

useState(initialStateFunction)
```

Typical use:

```javascript
const [ state, setState ] = useState(initialState);

setState(newState);
```

If you have an expensive computation, then you can pass this in a function to `useState`. Example from the [Hooks API Reference][] docs:

```javascript
const [state, setState] = useState(() => {
  const initialState = someExpensiveComputation(props);
  
  return initialState;
});
```

[Hooks API Reference]: https://reactjs.org/docs/hooks-reference.html


## Example

### Simple


```javascript
const [ name, setName ] = useState("Sam");
```

### Multiple values

An example from the docs with multiple variables.

```javascript
function ExampleWithManyStates() {
  const [age, setAge] = useState(42);
  const [fruit, setFruit] = useState('banana');
  const [todos, setTodos] = useState( [ { text: 'Learn Hooks' } ] );
}
```


## Comparison

Here are equivalent examples from the docs.

Setting up `count` and `setCount` comes as a pair and is similar to using `this.state.count` and `this.setState` in a Class component.

- Functional component with hooks.
    ```jsx
    import React, { useState } from 'react';

    function Example() {
      const [count, setCount] = useState(0);

      return (
        <div>
          <p>You clicked { count } times</p>
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

{% endraw %}
