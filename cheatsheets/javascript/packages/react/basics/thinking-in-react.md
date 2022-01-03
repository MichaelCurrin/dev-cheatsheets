# Thinking in React

See [Thinking in React](https://reactjs.org/docs/thinking-in-react.html) doc.

1. Break the UI into a component hierarchy
    - Draw boxes around every component in the visual mock.
    - A component should do one thing. If it does more, break it up into subcomponents.
    - The data and UI should adhere to the same _information architecture_. One component for each piece of the data model.
    - Set up a hierarchy. e.g. 
        - `FilterableProductTable`
            - `SearchBar`
            - `ProductTable`
                - `ProductCategoryRow`
                - `ProductRow`
1. Build a static version in React.
    - Render the data as UI. But no state - all static (does not change over time), no interactivity.  
    - This requires a lot of code but no thinking, while the later step is the opposite.
    - Build components top-down (useful in simple apps). Or bottom-up, with low-level components and tests first (useful in larger projects).
    - Data flows one way, which is fast and modular. Change your data model and render again such as with page refresh to see the UI changes.
    
    
## Code

### Source data

This could come from an API but can just be a plain JS variable.

```javascript
[
  {category: "Sporting Goods", price: "$49.99", stocked: true, name: "Football"},
  {category: "Sporting Goods", price: "$9.99", stocked: true, name: "Baseball"},
  {category: "Sporting Goods", price: "$29.99", stocked: false, name: "Basketball"},
  {category: "Electronics", price: "$99.99", stocked: true, name: "iPod Touch"},
  {category: "Electronics", price: "$399.99", stocked: false, name: "iPhone 5"},
  {category: "Electronics", price: "$199.99", stocked: true, name: "Nexus 7"}
];
```


