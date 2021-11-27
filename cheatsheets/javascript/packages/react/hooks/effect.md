---
title: Effect hook
description: Oerforms **side effects** in Function components
---

{% raw %}

## Resources

See [Using the Effect Hook](https://reactjs.org/docs/hooks-effect.html) in the React docs.


## Triggers

The Effect hook will run when the component:

- is mounted (once).
- updates (multiple times).
- unmounts (once).


## Syntax

```jsx
useEffect(FUNCTION)
useEffect(FUNCTION, ARGUMENTS)
```


## Examples

### Click

Here is an example where a callback function is run on state change, changing the DOM outside of the component, setting a value on `document` (or some element) uses the browser API.

```jsx
const [count, setCount] = useState(0);

useEffect(() => {
  document.title = `You clicked ${count} times`;
});
```

### Mount and unmount only

To prevent the function from running on updates, use an empty array s an extra parameter.

```jsx
useEffect(() => {
  console.log("Mounted or unmounted")
}, []);
```

The docs say that this is close to the mental model of `componentDidMount` and `componentWillUnmount`, but that "there are usually [better solutions][] to avoid re-running effects too often".

[better solutions]: https://reactjs.org/docs/hooks-faq.html#is-it-safe-to-omit-functions-from-the-list-of-dependencies

### Tip: Use Multiple Effects to Separate Concerns 

Example from the docs.

```jsx
function FriendStatusWithCounter(props) {
  const [count, _setCount] = useState(0);
  useEffect(() => {
    document.title = `You clicked ${count} times`;
  });

  const [_isOnline, setIsOnline] = useState(null);
  useEffect(() => {
    function handleStatusChange(status) {
      setIsOnline(status.isOnline);
    }

    ChatAPI.subscribeToFriendStatus(props.friend.id, handleStatusChange);

    return () => {
      ChatAPI.unsubscribeFromFriendStatus(props.friend.id, handleStatusChange);
    };
  });

  // ...
}
```

### Comparison of Effect hook vs Class component

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
