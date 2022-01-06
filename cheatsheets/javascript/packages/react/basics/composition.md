---
title: Composition
description: Using components in other components
---

## Component containtment

Here we let a component render any number of child components dynamically, without knowing what they are in advance.

This is common for a sidebar or a dialog as generic boxes of other components.

This similar to _slots_ in other libraries, like Vue.

### Use the childen property

Get the components within the box with the special `children` property:

```jsx
function FancyBorder(props) {
  return (
    <div className={ 'FancyBorder FancyBorder-' + props.color }>
      { props.children }    
    </div>
  );
}
```

Pass child components as the content of an element, such as in `FancyBorder`.

```jsx
function WelcomeDialog() {
  return (
    <FancyBorder color="blue">
      <h1 className="Dialog-title">       
        Welcome     
      </h1>
      
      <p className="Dialog-message">      
        Thank you for visiting our spacecraft!     
      </p>
    </FancyBorder>
  );
}
```

### Use custom childen

Here is an alternative approach from the docs, using custom _left_ and _right_ components.

```jsx
function SplitPane(props) {
  return (
    <div className="SplitPane">
      <div className="SplitPane-left">
        { props.left }     
      </div>
      
      <div className="SplitPane-right">
        { props.right }     
      </div>
    </div>
  );
}

function App() {
  return (
    <SplitPane
      left={ <Contacts /> }
      right={ <Chat /> } 
    />
  );
}
```


## Component specialization

See [Composition vs Inheritance tutorial][].

[Composition vs Inheritance tutorial]: https://reactjs.org/docs/composition-vs-inheritance.html

> Sometimes we think about components as being “special cases” of other components. 
> 
> For example, we might say that a `WelcomeDialog` is a special case of `Dialog`.

We achieve this with composition, where a specific component passes props to a generic one and renders it. This is preferred over using inheritance.

If you have common non-UI logic to be used across components, that is probably best in a plain JS module which exports functions for use in components.

Generic component:

```jsx
function Dialog(props) {
  return (
    <FancyBorder color="blue">
      <h1 className="Dialog-title">
        { props.title }    
      </h1>
        
      <p className="Dialog-message">
        { props.message }    
      </p>
    </FancyBorder>
  );
}
```

Specialized component with values set and passed down.

```jsx
function WelcomeDialog() {
  const title = "Welcome"
  const message = "Hello, React developer"
  
  return <Dialog title={ title } message={ message } />;
  
  // OR
  return <Dialog title="Welcome" message="Hello, React developer" />;
}
```
