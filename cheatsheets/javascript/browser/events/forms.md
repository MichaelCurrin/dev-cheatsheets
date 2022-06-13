# Forms

See [Click][] for the click event.

[Click]: {% link cheatsheets/javascript/browser/events/click.md %}


## On input

Execute when a user writes something in an `input` field.

> The `oninput` is useful if you want to detect when the contents of a `textarea`, `input:text`, `input:password` or `input:search` element have changed, because the `onchange` event on these elements fires when the element loses focus, not immediately after the modification. [source](http://rakshasingh.weebly.com/difference-in-oninput-and-onchange-event.html)


```javascript
el.oninput = myFunction()
```

Or

```html
<input type="text" oninput="myFunction()">
```


## On change

Execute when a user changes the value of an input field. This is more precise as I think it doesn't fire if you choose the same option in the droplist as before and it only fires when you've click a droplist option or change focus away from a text field and not on every interaction to click or type.

> `onchange` occurs when the selection, the checked state or the contents of an element have changed. In some cases, it only occurs when the element loses the focus. The onchange attribute can be used with: `<input>`, `<select>`, and` <textarea>`. [source](http://rakshasingh.weebly.com/difference-in-oninput-and-onchange-event.html)
    
```javascript
el.onchange = myFunction()
```

Or

```html
<input type="text" onchange="myFunction()">
```
