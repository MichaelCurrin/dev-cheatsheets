---
title: Effect hook
description: Perform **side effects** in Function components
---

This hooks lets use _side effects_ - things that happen outside the component and are called _effects_ for short.

e.g.

- fetching data
- updating the DOM
- timers

After React flushes the DOM, React runs your effect. This is done after every render including the initial render.

{% raw %}

## Resources

- [Using the Effect Hook](https://reactjs.org/docs/hooks-effect.html) in the React docs.
- [Effect Hook](https://reactjs.org/docs/hooks-reference.html#useeffect) in the Hooks reference of the React docs.


## Triggers

The Effect hook will run when the component:

- Is mounted (once) like using `componentDidMount` method.
- Updates i.e. rerender (which can happen multiple times) like using `componentDidUpdate` method.
- Unmounts (once) like using `componentWillUnmount` method.


## Syntax

```javascript
useEffect(effect)
```

Or

```javascript
useEffect(effect, deps)
```

Docs:

```
@param effect — Imperative function that can return a cleanup function
@param deps — If present, effect will only activate if the values in the list change.
```

Pass `deps` as an empty array to only run on mount and unmount.

```javascript
useEffect(effect, [])
```

Or so the effect only runs when that changes, pass your an array with your variable s

```javascript
useEffect(effect, [myValue])
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

If you need to perform an action based on user-interaction in addition to the page load, you can do that outside the hook with an event.

```jsx
// On mount.
useEffect(() => {
  loadPosts()
}, [])

// User-driven.
<button onClick={ () => loadPosts() }
  Fetch posts
</button>
```

#### Chat example

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
