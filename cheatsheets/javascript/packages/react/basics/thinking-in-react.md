# Thinking in React

See [Thinking in React](https://reactjs.org/docs/thinking-in-react.html) doc.


## Steps

Follow this when setting up a React app.

1. Break the UI into a component hierarchy.
    - Draw boxes around every component in the visual mock. The design of the UI might even have name for the components which you can use in your model.
    - A component should do one thing. If it does more, break it up into subcomponents.
    - The data and UI should adhere to the same _information architecture_. One component for each piece of the data model.
    - Set up a hierarchy of your components, based on the UI.
1. Build a static version in React.
    - Render the data as UI. But no state - all static (does not change over time), no interactivity.  
    - This requires a lot of code but no thinking, while the later around UI state is a lot of thinking and little code changes.
    - Don't use any methods to add events or state, for now just render.
    - What order to build components?
        - Build components top-down (useful in simple apps). 
        - Or bottom-up, with low-level components and tests first (useful in larger projects).
    - Data flows one way, which is fast and modular. Change your data model and render again such as with page refresh to see the UI changes.
1. Identify the minimal (but complete) representation of UI state.
    - Avoid duplication. Use the DRY principle.
    - Think of the minimal set of mutable state. And compute everything else.
    - e.g. Don't keep the length of the array in a variable as a separate count in state, just compute it from the array.    
    - The following apply to state and if one does not apply then it probably is not state.
        - Set intenerally (data passed in externally from a parent via `props` is not state)
        - Changes over time
        - Cannot be computed (state is original data. If you can compute a filtered list from original data, that has some unnecessary duplication if you were to make the filtered data state)
1. Identify where the state should live
1. Add inverse data flow
    
    
## Applying steps to an example

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

### Figure out components and hierarchy

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

### Figure out what is state

Here are the pieces of data:

Data | State | Reason
--- | --- | ---
Original product list | No | Passed in via `props`
User's search text. | Yes | Change over time and cannot be computed
Checkbox value. | Yes | Same as above
Filtered product list. | No | It can be computed by combining the three pieces above


