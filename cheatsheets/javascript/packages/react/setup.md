# Setup index


How to setup the index module of your React app. This is the entrypoing which loads your `App.jsx` file.

- `index.jsx`
  ReactDOM.render(
    <React.StrictMode>
      <App />
    </React.StrictMode>,
    document.getElementById("root"),
  );
- `index.jsx`
    ```js
    ReactDOM.hydrate(
       <App />,
       document.getElementById('root')
    );
    ```
