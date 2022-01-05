---
title: Events
description: Use events to add interactivity and change state
---


## HTML vs React

In React:

- Events are named using camelCase, rather than lowercase.
- You pass a function as the event handler, rather than a string.

Compare:

- HTML
    ```html
    <button onclick="myFunc()">
      Click me
    </button>
    ```
- React JSX - note `onClick` vs `onclick` and not calling `onClick={ myFunc() }` as that would run on every render rather than on click.
    ```jsx
    <button onClick={ myFunc }>
      Click me
    </button>
    ```
    Or like this:
    ```jsx
    <button onClick={ () => myFunc(myParam) }>
      Click me
    </button>
    ```


## Basic

### Function component

Here we add a click event that logs to the console.

Inline:

```jsx
function Square{
  return (
    <button className="square" onClick={ () => console.log('click') }>
      {this.props.value}
    </button>
  );
}
```

Named function:

```jsx
function Square{
  const handleClick = () => console.log('click')

  return (
    <button className="square" onClick={ handleClick }>
      {this.props.value}
    </button>
  );
}
```

### Class component

Inline:

```jsx
class Square extends React.Component {
  render() {
    return (
      <button className="square" onClick={ () => console.log('click') }> 
        {this.props.value}
      </button>
    );
  }
}
```

Named function:

```jsx
class Square extends React.Component {
  handleClick() {
    console.log('click')
  }
  
  render() {
    return (
      <button className="square" onClick={ this.handleClick }> 
        {this.props.value}
      </button>
    );
  }
}
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


## Change state

Use `this.setState` to set a value in state on a click:

```jsx
class Square extends React.Component {
  constructor(props) {
    super(props);
    
    this.state = {
      value: null,
    };
  }

  render() {
    return (
      <button className="square" onClick={ () => this.setState({ value: 'X' }) }>
        { this.state.value }     
      </button>
    );
  }
}
```


## Call a function given as a property

This is useful if you want to change state in a level higher than the current component.

```jsx
class Square extends React.Component {  
  render() {  
    return (
      <button className="square" onClick={ () => this.props.onClick() }>
        {this.props.value}     
      </button>
    );
  }
}

// Usage:
<Square onClick={ myClickFunction } />
```


## Add event listener

> When using React, you generally don’t need to call `addEventListener` to add listeners to a DOM element after it is created. 
>
> Instead, just provide a listener when the element is initially rendered.

Here we add `handleClick` as a method attach it to `onClick` in the `render` method:

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
