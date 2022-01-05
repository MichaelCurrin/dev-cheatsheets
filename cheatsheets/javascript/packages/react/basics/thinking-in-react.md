# Thinking in React

{% raw %}

See [Thinking in React](https://reactjs.org/docs/thinking-in-react.html) doc.


## Steps

Follow this when setting up a React app.

### Break the UI into a component hierarchy

- Draw boxes around every component in the visual mock. The design of the UI might even have name for the components which you can use in your model.
- A component should do one thing. If it does more, break it up into subcomponents.
- The data and UI should adhere to the same _information architecture_. One component for each piece of the data model.
- Set up a hierarchy of your components, based on the UI.

### Build a static version in React

- Render the data as UI. But no state - all static (does not change over time), no interactivity.  
- This requires a lot of code but no thinking, while the later around UI state is a lot of thinking and little code changes.
- Don't use any methods to add events or state, for now just render.
- What order to build components?
    - Build components top-down (useful in simple apps). 
    - Or bottom-up, with low-level components and tests first (useful in larger projects).
- Data flows one way, which is fast and modular. Change your data model and render again such as with page refresh to see the UI changes.

### Identify the minimal (but complete) representation of UI state

- Avoid duplication. Use the DRY principle.
- Think of the minimal set of mutable state. And compute everything else.
- e.g. Don't keep the length of the array in a variable as a separate count in state, just compute it from the array.    
- The following apply to state and if one does not apply then it probably is not state.
    - Set intenerally (data passed in externally from a parent via `props` is not state)
    - Changes over time
    - Cannot be computed (state is original data. If you can compute a filtered list from original data, that has some unnecessary duplication if you were to make the filtered data state)
      
### Identify where the state should live

Now wee need to identify which component mutates, or owns, the state we decided on in the previous step.

Note that state changes are _internal_ to a component and we use `props` to change a component from the outside.

For each piece of state:

- Identify components which render using that state
- Find a common owner component. If you can't find one that makes sense, you can make a new component just for holdign state and add it above the common owner component.

### Add inverse data flow
    
So far we change can props and state values which are passed down.

Now we need add interactivity for nested components to change the higher component state.

    
## Apply steps to an example

See my [Thinking in React pen](https://codesandbox.io/s/thinking-in-react-0l67k).

### Source data

Here we use some data from the tutorial linked at the top and this will be used to render the UI.

This could come from an API but can just be a plain JS variable.

```javascript
[
  { category: "Sporting Goods", price: "$49.99",  stocked: true,  name: "Football" },
  { category: "Sporting Goods", price: "$9.99",   stocked: true,  name: "Baseball" },
  { category: "Sporting Goods", price: "$29.99",  stocked: false, name: "Basketball" },
  { category: "Electronics",    price: "$99.99",  stocked: true,  name: "iPod Touch" },
  { category: "Electronics",    price: "$399.99", stocked: false, name: "iPhone 5" },
  { category: "Electronics",    price: "$199.99", stocked: true,  name: "Nexus 7" }
];
```

### Design

Here the given design is:

![Diagram](https://reactjs.org/static/9381f09e609723a8bb6e4ba1a7713b46/90cbd/thinking-in-react-components.png)

### Break the UI into a component hierarchy

Figure out components and hierarchy

Components:

- `FilterableProductTable` (orange): container
- `SearchBar` (blue): receive all user input
- `ProductTable` (green): display and filter the data collection based on user input
- `ProductCategoryRow` (turquoise): display a heading for each category
- `ProductRow` (red): displays a row for each product

The docs say, you could make the table heading a separate component as well as `ProductTableHeader` if your situation was complex enough, like if you had sorting.

And the hierarchy:

- `FilterableProductTable`
    - `SearchBar`
    - `ProductTable`
        - `ProductCategoryRow`
        - `ProductRow`

### Identify the minimal (but complete) representation of UI state

Here are the pieces of data:

Data | State | Reason
--- | --- | ---
Original product list | No | Passed in via `props`
User's search text. | Yes | Change over time and cannot be computed
Checkbox value. | Yes | Same as above
Filtered product list. | No | It can be computed by combining the three pieces above

### Identify where the state should live

- The `SearchBar` needs to display the search text state and checked state.
- The `ProductTable` needs to filter the product list based on state set in `SearchBar`.
- The common owner component is `FilterableProductTable`. Conceptually it makes sense for the search text and checked state to live there.

Set up some initial values as state. e.g.

```javascript
this.state = {
  filterText: "",
  inStockOnly: false
};
```

Then change them to other hardcoded values to see how the app appears.

Here focusing on the user inputs with read-only values:

```jsx
class SearchBar extends React.Component {
  render() {
    return (
      <div className="SearchBar-component">
        <p>
          <input
            type="text"
            value={this.props.filterText}
            placeholder="Search..."
            readOnly={true}
          />
        </p>
        
        <p>
          <input
            type="checkbox"
            checked={this.props.inStockOnly}
            readOnly={true}
          />
          <label>Only show products in stock</label>
        </p>
      </div>
    );
  }
}
```

Here passing down state and modified state values to test with:

```jsx
class FilterableProductTable extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      filterText: "ball",
      inStockOnly: true
    };
  }

  render() {
    return (
      <div className="FilterableProductTable-component">
        <SearchBar
          filterText={this.state.filterText}
          inStockOnly={this.state.inStockOnly}
        />
        
        <br />
        
        <ProductTable
          filterText={this.state.filterText}
          inStockOnly={this.state.inStockOnly}
          products={this.props.products}
        />
      </div>
    );
  }
}
```

### Add inverse data flow

Change the inputs to be mutable and to pass values back up with events.

```jsx
class FilterableProductTable extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      filterText: "",
      inStockOnly: false
    };

    this.onFilterTextChange = this.onFilterTextChange.bind(this);   // <--
    this.onInStockOnlyChange = this.onInStockOnlyChange.bind(this); // <--
  }

  onFilterTextChange(value) {              // <--
    this.setState({ filterText: value });
  }

  onInStockOnlyChange(value) {             // <--
    this.setState({ inStockOnly: value });
  }

  render() {
    return (
      <div className="FilterableProductTable-component">
        <SearchBar
          filterText={this.state.filterText}
          inStockOnly={this.state.inStockOnly}
          onFilterTextChange={this.onFilterTextChange}   // <--
          onInStockOnlyChange={this.onInStockOnlyChange} // <--
        />
        
        <br />
        
        <ProductTable
          filterText={this.state.filterText}
          inStockOnly={this.state.inStockOnly}
          products={this.props.products}
        />
      </div>
    );
  }
}
```

{% endraw %}
