# Button

See [Button Generator](https://www.bestcssbuttongenerator.com/) tool to customize a button, preview it and copy the code.


## Default

```html
<a href="#" class="myButton">
   Green
</a>

<style>
    .myButton {
      color: #ffffff;
      background-color: #44c767;
  
      border-radius: 28px;
      border:1px solid #18ab29;
  
      display: inline-block;
  
      cursor: pointer;
  
      font-family: Arial;
      font-size: 17px;
  
      padding: 16px 31px;
  
      text-decoration: none;
      text-shadow: 0px 1px 0px #2f6627;
    }

    .myButton:hover {
      background-color: #5cbf2a;
    }

    .myButton:active {
      position: relative;
      top: 1px;
    }
</style> 
```


## Hover

Darken slightly on hover:

```css
button: {
  background-color: green;
}

button:hover {
  background-color: darken(green, 5%);
}
```
