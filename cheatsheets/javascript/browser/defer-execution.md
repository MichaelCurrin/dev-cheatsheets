# Defer execution


## Defer attribute

Add the `defer` attribute to your `script` tag in the `head` tag.

The JS will be fetched early on but will only execute when the body is finished loading. Useful if you are targeting elements in the body which will not exist when only `head` has loaded.

Note - only works on tags with `src`, not on inline JS.

```html
<head>
  <script src="main.js" defer></script>
</head>

<body>
  <div id="app">
  </div>
</body>
```

Old style, which is slower as the JS is only fetched once the body content is finished.

```html
<head>
</head>

<body>
  <div id="app">
  </div>

  <script src="main.js"></script>
</body>
```

The unsafe way - it will cause JS errors because the body cannot be found.

```html
<head>
  <script src="main.js"></script>
</head>

<body>
  <div id="app">
  </div>

</body>
```


## Add event to body

<head>
</head>

<body onload="foo()">
  <div id="app">
  </div>

</body>


## Add event listener

Put your code inside a function that only loads when the body is done loading - when the `load` event fires.

This works great as you can put it anywhere on the page and as an inline or external script but it won't run too soon.

Related section - [Load and ready events][].

Load and ready events]: {% link cheatsheets/javascript/browser/events/load-ready.md %}

### Set onload

Warning - this will override all existing onload triggers set up by you or other scripts.

```javascript
window.onload = function() {
  foo();
}
```

### Add to onload events

Add one or more `load` listeners like this:

```javascript
window.addEventListener('load', function () {
  foo();
}

window.addEventListener('load', function () {
  bar();
}
```
