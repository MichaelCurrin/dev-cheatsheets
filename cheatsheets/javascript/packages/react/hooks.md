# Hooks

{% raw %}

## useState

See [Using the State Hook](https://reactjs.org/docs/hooks-state.html) in React docs.

Calling `useState` is a React hook to unpack a variable's value and its change handler to update it.

```javascript
const [ value, setValue ] = useState("my default value");
```

An example from the docs with multiple variables.

```javascript
function ExampleWithManyStates() {
  const [age, setAge] = useState(42);
  const [fruit, setFruit] = useState('banana');
  const [todos, setTodos] = useState([{ text: 'Learn Hooks' }]);
}
```

{% endraw %}
