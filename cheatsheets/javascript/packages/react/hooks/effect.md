---
title: Effect hook
description: Perform **side effects** in Function components
---

You're likely fetching data or changing the DOM. These are _side effects_ as they happen outside the component and are called _effects_ for short.

After React flushes the DOM, it runs your effect. This is done after every render including the initial render.

{% raw %}

## Resources

See [Using the Effect Hook](https://reactjs.org/docs/hooks-effect.html) in the React docs.


## Triggers

The Effect hook will run when the component:

- is mounted (once) like using `componentDidMount` method.
- updates (multiple times) like using `componentDidUpdate` method.
- unmounts (once) like using `componentWillUnmount` method.


## Syntax

```javascript
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

To prevent the function from running on updates and only on mount/unmount, specify an empty array as the second parameter.

```jsx
useEffect(() => {
  console.log("Mounted or unmounted")
}, []);
```

The docs say that this is close to the mental model of `componentDidMount` and `componentWillUnmount`, but that "there are usually [better solutions][] to avoid re-running effects too often".

From [Hooks Overview][] doc, here we subscribe to the chat notifications when the component mounts and then unsubscribe when unmounting (since there is no point to pull in data if the widget is not on the page anymore).

```jsx
import React, { useState, useEffect } from 'react';

function FriendStatus(props) {
  const [isOnline, setIsOnline] = useState(null);

  function handleStatusChange(status) {
    setIsOnline(status.isOnline);
  }

  useEffect(() => {    
    ChatAPI.subscribeToFriendStatus(props.friend.id, handleStatusChange);    
    
    return () => {   
      ChatAPI.unsubscribeFromFriendStatus(props.friend.id, handleStatusChange); 
    };
  });
  
  if (isOnline === null) {
    return 'Loading...';
  }
  
  return isOnline ? 'Online' : 'Offline';
}
```

[better solutions]: https://reactjs.org/docs/hooks-faq.html#is-it-safe-to-omit-functions-from-the-list-of-dependencies
[Hooks Overview]: https://reactjs.org/docs/hooks-overview.html

### Use multiple effects to separate concerns 

Example from the docs.

```jsx
function FriendStatusWithCounter(props) {
  const [count, _setCount] = useState(0);
  const [_isOnline, setIsOnline] = useState(null);
  
  useEffect(() => { 
      document.title = `You clicked ${count} times` 
    }
  );

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


## Comparison of Effect hook vs Class component

- Functional component with effects to run on mount and update by just using `useEffect`.
    ```jsx
    import React, { useState, useEffect } from 'react';

    function Example() {
      const [count, setCount] = useState(0);

      useEffect(() => {
        document.title = `You clicked ${count} times`;
      });

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
- Class component with logic to run on mount and update in separate methods.
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
            <p>You clicked { this.state.count } times</p>
            
            <button onClick={() => this.setState({ count: this.state.count + 1 })}>
              Click me
            </button>
          </div>
        );
      }
    }
    ```


{% endraw %}
