# State

## Props vs state

- `props` get passed **to** the component - similar to function parameters.
- `state` is managed **within** the component - similar to variables declared within a function.


## Library for state management

- [When should I use Redux?](https://redux.js.org/faq/general#when-should-i-use-redux) in Redux docs FAQ.

> You'll know when you need Flux. If you aren't sure if you need it, you don't need it.

> don't use Redux until you have problems with vanilla React.


## Examples

See [State hook][] cheatsheet for more info.

[State hook]: {% link cheatsheets/javascript/packages/react/hooks/state.md %}

### Generic

```jsx
function Foo(props) {
  const [myValue, setMyValue] = useState("")

  const onInput = (event) => {
    setMyValue(event.target.value)
  }

  return (
    <>
      <h2>Controls</h2>
      <input type="text" value={myValue} onInput={onInput} />
      <br />
      <h2>Results</h2>
      <p>
        {myValue.toUpperCase()}
      </p>
    </>
  )
}

ReactDOM.render(<Parent />, document.querySelector("#app"))
```

If your state is an object, you can use `setState` with your key and value and React will modify the state for just that key.

```jsx
const [myObject, setMyObject] = useState({abc: 123, def: 456})

setMyObject({abc: 999})
```

### Timer

Here is how you use create an incrementing value based on a timer:

```jsx
class Timer extends React.Component {
  constructor(props) {
    super(props);
    this.state = { seconds: 0 };
  }

  tick() {
    this.setState(state => ({
      seconds: state.seconds + 1
    }));
  }

  componentDidMount() {
    this.interval = setInterval(() => this.tick(), 1000);
  }
```
