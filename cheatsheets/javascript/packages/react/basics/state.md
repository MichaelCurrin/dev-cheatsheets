---
title: State

description: Lifting state up so to a parent so it can be used in two child components
---

See [CodePen demo][] and [Lifting state up][] tutorial.

[CodePen demo]: https://codepen.io/gaearon/pen/WZpxpz?editors=0010
[Lifting state up]: https://reactjs.org/docs/lifting-state-up.html

In this example we have a form for inputting temperature in two inputs and then allow the values to change across both of them as well as an output component. Instead of storing two temperatue values, we just store one value and the current scale in use (Celcius or Fahrenheit).

Set up your global variable and conversion functions.

```jsx
const scaleNames = {
  c: 'Celsius',
  f: 'Fahrenheit'
};

function toCelsius(fahrenheit) {
  return (fahrenheit - 32) * 5 / 9;
}

function toFahrenheit(celsius) {
  return (celsius * 9 / 5) + 32;
}

function tryConvert(temperature, convert) {
  const input = parseFloat(temperature);
  if (Number.isNaN(input)) {
    return '';
  }
  const output = convert(input);
  const rounded = Math.round(output * 1000) / 1000;
  
  return rounded.toString();
}
```

Set up the display-only component:

```jsx
function BoilingVerdict(props) {
  let msg;
  if (props.celsius >= 100) {
    msg = "The water would boil"
  } else {
    msg = "The water would not boil."
  }
  
  return <p>{ msg }</p>
}
```

Set up the child component e.g. `TemperatureInput`. 

We'll have two instances controlling the same data.

Note we expect the handler function as `onTemperatureChange` on the properties. And call it within the child components handler function.

Note also that when we render, we get values from props and not from state. The state exists in the parent component and the child component only cares about properties passed to it.

```jsx
class TemperatureInput extends React.Component {
  constructor(props) {
    super(props);
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(e) {
    this.props.onTemperatureChange(e.target.value); 
  }

  render() {
    const temperature = this.props.temperature;    
    const scale = this.props.scale;
    
    return (
      <fieldset>
        <legend>Enter temperature in {scaleNames[scale]}:</legend>
        
        <input value={temperature}
          onChange={this.handleChange} />
      </fieldset>
    );
  }
}
```

Set up the calculator app. 

Note the handler functions are defined on the parent level here and passed down as a functions to the child components as `onTemperatureChange={ this.handleCelsiusChange }`.

```jsx
class Calculator extends React.Component {
  constructor(props) {
    super(props);
    
    this.state = {
      temperature: '', 
      scale: 'c' 
    };
    
    this.handleCelsiusChange = this.handleCelsiusChange.bind(this);
    this.handleFahrenheitChange = this.handleFahrenheitChange.bind(this);
  }
  
  handleCelsiusChange(temperature) {
    this.setState({scale: 'c', temperature});  
  }

  handleFahrenheitChange(temperature) {
    this.setState({scale: 'f', temperature}); 
  }

  render() {
    const scale = this.state.scale;    
    const temperature = this.state.temperature;    
    
    const celsius = scale === 'f' ? tryConvert(temperature, toCelsius) : temperature;    
    const fahrenheit = scale === 'c' ? tryConvert(temperature, toFahrenheit) : temperature;
    
    return (
      <div>
        <TemperatureInput
          scale="c"
          temperature={celsius}          
          onTemperatureChange={ this.handleCelsiusChange } />        
          
        <TemperatureInput
          scale="f"
          temperature={fahrenheit}          
          onTemperatureChange={ this.handleFahrenheitChange } />    
          
        <BoilingVerdict
          celsius={ parseFloat(celsius) } />      
        </div>
    );
  }
}
```

Render the app.

```jsx
ReactDOM.render(
  <Calculator />,
  document.getElementById('root')
);
```
