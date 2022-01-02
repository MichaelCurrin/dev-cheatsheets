# Set up index script


How to set up the index module of your React app. This is the entrypoint which loads your `App.jsx` file.

With `render` method and strict mode:

- `index.jsx`
    ```jsx
    ReactDOM.render(
      <React.StrictMode>
        <App />
      </React.StrictMode>,
      document.getElementById("root"),
    );
    ```
    
Or with `hydrate` method:

- `index.jsx`
    ```jsx
    ReactDOM.hydrate(
      <App />,
      document.getElementById('root')
    );
    ```
