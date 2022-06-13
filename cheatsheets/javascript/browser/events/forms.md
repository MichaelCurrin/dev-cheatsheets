# Forms

See [Click][] for the click event.

[Click]: {% link cheatsheets/javascript/browser/events/click.md %}


## On input

Execute when a user writes something in an `input` field.

```javascript
el.oninput = myFunction()
```

Or

```html
<input type="text" oninput="myFunction()">
```


## On change

Execute when a user changes the value of an input field. This is more precise as I think it doesn't fire if you choose the same option in the droplist as before and it only fires when you've click a droplist option or change focus away from a text field and not on every interaction to click or type.

```javascript
el.onchange = myFunction()
```

Or

```html
<input type="text" onchange="myFunction()">
```
