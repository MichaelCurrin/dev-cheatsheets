# Context hook


```javascript
const value = useContext(MyContext);
```

> Accepts a context object (the value returned from `React.createContext`) and returns the current context value for that context. 
> 
> The current context value is determined by the value prop of the nearest `<MyContext.Provider>` above the calling component in the tree.

> When the nearest `<MyContext.Provider>` above the component updates, this Hook will trigger a rerender with the latest context value passed to that `MyContext` provider. 
> 
> Even if an ancestor uses `React.memo` or `shouldComponentUpdate`, a rerender will still happen starting at the component itself using useContext.

> Don't forget that the argument to `useContext` must be the context object itself:

> A component calling `useContext` will always re-render when the context value changes. 
> 
> If re-rendering the component is expensive, you can optimize it by using _memoization_.

Example from docs.

We call `useContext` with the context of `ThemeContext` (created with `React.createContext`). So then `theme` in the component is either `themes.light` or `themes.dark`, depending on which value is passed at the high level when we use `ThemeContext.Provider` in `App`.

{% raw %}

```jsx
const themes = {
  light: {
    foreground: "#000000",
    background: "#eeeeee"
  },
  dark: {
    foreground: "#ffffff",
    background: "#222222"
  }
};

const ThemeContext = React.createContext(themes.light);

function ThemedButton() {
  const theme = useContext(ThemeContext);  
  
  return (    
    <button style={{ background: theme.background, color: theme.foreground }}>     
      I am styled by theme context!    
    </button>  );
}


function Toolbar(props) {
  return (
    <div>
      <ThemedButton />
    </div>
  );
}

function App() {
  return (
    <ThemeContext.Provider value={themes.dark}>
      <Toolbar />
    </ThemeContext.Provider>
  );
}
```

{% endraw %}
