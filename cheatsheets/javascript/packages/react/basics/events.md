# Events

## HTML vs React

In React:

- Events are named using camelCase, rather than lowercase.
- You pass a function as the event handler, rather than a string.

Compare:

- HTML
    ```html
    <button onclick="activateLasers()">
      Activate Lasers
    </button>
    ```
- React JSX:
    ```jsx
    <button onClick={ activateLasers }>
      Activate Lasers
    </button>
    ```


## Prevent default behavior

Use `e.preventDefault()` where `e` is a [Synthetic event][] and works cross-browser.

e.g.

```jsx
function Form() {
  function handleSubmit(e) {
    e.preventDefault();   
    console.log('You clicked submit.');
  }

  return (
    <form onSubmit={ handleSubmit }>
      <button type="submit">Submit</button>
    </form>
  );
}
```

[Synthetic event]: https://reactjs.org/docs/events.html


## Add event listener

> When using React, you generally don’t need to call addEventListener to add listeners to a DOM element after it is created. 
>
> Instead, just provide a listener when the element is initially rendered.

Here we add `handleClick` as a method attach it to `onClick` in the `render` method.

```jsx
class Toggle extends React.Component {
  constructor(props) {
    super(props);
    this.state = { isToggleOn: true };

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    this.setState(prevState => ({
      isToggleOn: !prevState.isToggleOn
    }));
  }

  render() {
    return (
      <button onClick={this.handleClick}>
        {this.state.isToggleOn ? 'ON' : 'OFF'}
      </button>
    );
  }
}
```

The bind call is necessary to make `this` work in the callback.

> You have to be careful about the meaning of `this` in JSX callbacks. In JavaScript, class methods are not bound by default. If you forget to bind `this.handleClick` and pass it to `onClick`, `this` will be `undefined` when the function is actually called.

This applies for JS in general:

> Generally, if you refer to a method without `()` after it, such as `onClick={this.handleClick}`, you should bind that method.

Alternatively, add an arrow function and leave out `bind`.

```jsx
class Greet extends React.Component {
  handleClick() {
    console.log('this is:', this);
  }

  render() {
    return (      
      <button onClick={() => this.handleClick()}>
        Click me
      </button>
    );
  }
}
```

In most cases this is fine. Though, this approach can cause performance issues if a prop is passed to lower components. So the `bind` approach is recommended.


## Pass arguments to event handlers

You might have a loop where you have an argument to pass to the event call.

Here we pass the `id` of a row.

- Using an arrow function and passing the event as `e` explicitly:
    ```jsx
    <button onClick={ (e) => this.deleteRow(id, e) }>
      Delete Row
    </button>
    ```
- Equivalent syntax using `bind`, where arguments like event are passed implicitly.
    ```jsx
    <button onClick={ this.deleteRow.bind(this, id) }>
      Delete Row
    </button>
    ```