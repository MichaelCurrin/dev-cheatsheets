# Strict mode

[Strict mode](https://reactjs.org/docs/strict-mode.html) in the docs

> `StrictMode` is a tool for highlighting potential problems in an application. 
> 
> Like `Fragment`, `StrictMode` does not render any visible UI. It activates additional checks and warnings for its descendants.

> Strict mode checks are run in **development** mode only; they do not impact the production build.


Example of applying strict mode in the main section:

```jsx
import React from 'react';

function Example() {
  return (
    <>
      <Header />
      
      <React.StrictMode>        
        <main>
          <ComponentOne />
          <ComponentTwo />
        </main>
      </React.StrictMode>    
      
      <Footer />
    </>
  );
}
```
