# Conditional rendering

## Resources

- [Conditional Rendering][] in the React docs
    > Use JavaScript operators like if or the conditional operator to create elements representing the current state, and let React update the UI to match them.
- [Conditional (Ternary) Operator][] on Mozilla docs. e.g. `isMember ? '$2.00' : '$10.00'`


[Conditional Rendering]: https://reactjs.org/docs/conditional-rendering.html
[Conditional (Ternary) Operator]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Conditional_Operator


## Approaches

### Standalone if statement

```jsx
if (CONDITION) {
  return <A />;
}

return <B />;
```

e.g. Return one of two components depending on a boolean value.

```jsx
function Greeting(props) {
  const { isLoggedIn } = props;
  
  if (isLoggedIn) {
    return <UserGreeting />;
  } 
  
  return <GuestGreeting />;
}

ReactDOM.render(
  <Greeting isLoggedIn={false} />,  
  document.getElementById('root')
);
```

### Inline if statement with ternary operator

We either get a truthy value and return an element. Or get a falsey value and return nothing.

```jsx
{CONDITION &&
  JSX_EXPRESSION
}
```

The condition might be true or false like with `unreadMessages.length > 0`. Note that even if the value was `false`, nothing would show up as you have to be explicit to show a boolean with `myBoolean.toString()`.

```jsx
function Mailbox(props) {
  const { unreadMessages } = props;

  return (
    <div>
      <h1>Hello!</h1>
      
      {unreadMessages.length > 0 &&
        <h2>
          You have {unreadMessages.length} unread messages.
        </h2>
      }
    </div>
  );
}

const messages = ['Foo', 'Bar', 'Bazz'];

ReactDOM.render(
  <Mailbox unreadMessages={messages} />,
  document.getElementById('root')
);
```

Or the condition might be a value like a string or number which could be truthy or falsey. Note that even if the value of `count` is zero, something will still be returned - the value in the `div` will be `0`.

```jsx
const count = 0;  
  
return (
  <div>
    { count && <h1>Messages: { count }</h1> } 
  </div>
)  ;
```

### Ternary

Inline in the JSX:

```jsx
return (
  <div>
    The user is <b>{ isLoggedIn ? 'currently' : 'not' }</b> logged in.    
  </div>
);
```

Or as a separate variable.

```jsx
const loggedInMsg = isLoggedIn ? 'currently' : 'not'

return (
  <div>
    The user is <b>{ loggedInMsg }</b> logged in.    
  </div>
);
```

If your logic is long enough to wrap over multiple lines, you could probably move it out of the JSX and make a separate variable.

Harder to read:

```jsx
return (
  <div>
    {isLoggedIn
      ? <LogoutButton onClick={this.handleLogoutClick} />
      : <LoginButton onClick={this.handleLoginClick} />}
  </div>
);
```

Easier to read:

```jsx
const loggedIn = isLoggedIn
  ? <LogoutButton onClick={this.handleLogoutClick} />
  : <LoginButton onClick={this.handleLoginClick} />;

return (
  <div>
    {loggedIn}
  </div>
);
```

### Add null return for component

Here we a warning banner as per the docs example. We use the property `warn` as a `true` value to show some content or `false` to hide it.

```jsx
function WarningBanner(props) {
  if (!props.warn) {   
    return null; 
  }
  
  return (
    <div className="warning">
      Warning!
    </div>
  );
}
```

That could be used like this:

```jsx
<WarningBanner warn={showWarning} />
```
