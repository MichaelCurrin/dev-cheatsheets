# Components


## Resources

- [React.Component](https://reactjs.org/docs/react-component.html) in the React docs.

Tutorials:

- [W3 Schools - React components](https://www.w3schools.com/react/react_components.asp)
- [Class Component Overview in React](https://www.digitalocean.com/community/tutorials/react-class-components)
- [ReactJS \| Class Based Components](https://www.geeksforgeeks.org/reactjs-class-based-components/)


## Element

From [Rendering Elements](https://reactjs.org/docs/rendering-elements.html) tutorial.

```jsx
const element = <h1>Hello, world</h1>;

ReactDOM.render(element, document.getElementById('root'));
```


## Component approaches

### Functional component

The modern, easier-to-test way that uses functions. 

```jsx
function Welcome(props) {
  return <h1>Hello, { props.name }</h1>;
}
```

See the [Props][] cheatsheet for alternative ways of handling properties.

To handle state, you can use [React Hooks][] or a state library. This makes is easier think about and layer components.

Use `onInput` for text inputs.

Use `onChange` for a checkbox or radio button.

```jsx
import { useState } from "react";

function Welcome() {
  const [ value, setValue ] = useState("my default value");
  
  const onInput = (event) => {
    setValue(event.target.value);
  };

  return (
    <>
      <input
        id="value-input"
        onInput={ onInput }
      />
      
      <br />
      <br />
      
      <div>{ value }</div>
    </>
  );
}
```

You can also set `value` variable as the `input` tag's `value` attribute. So that when the page loads (or refreshes), you can fill the text box with the user's value (persisted from state like maybe localStorage).

```jsx
<input
  id="value-input"
  value={ value }
  onInput={ onInput }
/>
```

Setting the value as above does't matter so much when you use `onInput`.

If you use `onSubmit` to set the value then you'll find that you actually **cannot** edit the value in the text input because you have fixed it to match a variable. So then you'll want to **remove** the value bit.

```jsx
<input
  id="value-input"
  onSubmit={ onSubmit }
/>
```

[Props]: {% link cheatsheets/javascript/packages/react/basics/props.md %}
[React Hooks]: https://reactjs.org/docs/hooks-intro.html

### Class component

The older, more verbose way. Using a class and `this` (which can be confusing and works differently to other languages)

```jsx
class Welcome extends React.Component {
  render() {
    return <h1>Hello, { this.props.name }</h1>;
  }
}
```

See documentation on [React.Component](https://reactjs.org/docs/react-component.html).

A more complex example with state. Manage state using `this.state` and `this.setState`.

```jsx
import React from "react";

export default class Foo extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      // 
    };
  }

  onClick() {
    this.setState(currentState => ({
      // ...
    }));
  }

  render() {
    return (
      <>
        <input
          id="value-input"
          value={ value }
          onChange={ onChange }
        />
        <br />
        <br />
        <div>{ value }</div>
      </>
    );
  }
}
```


## Choosing an approach

See blog post [Functional vs Class-Components in React](https://medium.com/@Zwenza/functional-vs-class-components-in-react-231e3fbd7108)

> If you need a **state** in your component you will either need to create a **class** component or you lift the state up to the **parent** component and **pass** it down the functional component via props.

Though that advice may be outdated, since with React Hooks you can add state to a functional component.

Reasons to use functional components:

> 1. Functional component are much easier to read and test because they are plain JavaScript functions without state or lifecycle-hooks.
> 2. You end up with less code.
> 3. They help you to use best practices. It will get easier to separate container and presentational components because you need to think more about your component's state if you don’t have access to `setState()` in your component.
> 4. The React team mentioned that there may be a performance boost for functional component in future React versions.

Another reason against class components is that [Classes confuse both people and machines](https://reactjs.org/docs/hooks-intro.html#classes-confuse-both-people-and-machines) (React docs section on Hooks release).

