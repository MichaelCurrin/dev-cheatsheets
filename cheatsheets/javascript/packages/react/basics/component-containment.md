---
title: Component containment
description: Passing components to be nested in a component
---

Here we let a component render any number of child components dynamically, without known what they are.

This is common for a sidebar or a dialog as generic boxes of other components.

This similar to _slots_ in other libraries, like Vue.


## Use the childen property

Get the components within the box with the special `children` property:

```jsx
function FancyBorder(props) {
  return (
    <div className={ 'FancyBorder FancyBorder-' + props.color }>
      {props.children}    
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


## Use custom childen

Here is an alternative approach from the docs, using custom _left_ and _right_ components.

```jsx
function SplitPane(props) {
  return (
    <div className="SplitPane">
      <div className="SplitPane-left">
        {props.left}     
      </div>
      
      <div className="SplitPane-right">
        {props.right}     
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
