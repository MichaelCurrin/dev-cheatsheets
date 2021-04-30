# Load and ready events


## Resources

- [Document](https://developer.mozilla.org/en-US/docs/Web/API/Document) - specifically see [Load and unload events](https://developer.mozilla.org/en-US/docs/Web/API/Document#load_unload_events)


## DOM content loaded

- [DOMContentLoaded](https://developer.mozilla.org/en-US/docs/Web/API/Window/DOMContentLoaded_event)
    > Fired when the document has been completely loaded and parsed, without waiting for stylesheets, images, and subframes to finish loading.

e.g.

```javascript
window.addEventListener('DOMContentLoaded', (event) => {
    console.log('DOM fully loaded and parsed');
});
```


## Load

- [load](https://developer.mozilla.org/en-US/docs/Web/API/Window/load_event) event
    > The load event is fired when the whole page has loaded, including all dependent resources such as stylesheets and images. This is in contrast to `DOMContentLoaded`, which is fired as soon as the page DOM has been loaded, without waiting for resources to finish loading.

- [onload](https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers/onload) 
    > The onload property of the GlobalEventHandlers mixin is an EventHandler that processes load events on a Window, XMLHttpRequest, <img> element, etc.
    > 
    > The `load` event fires when a given resource has loaded.


```javascript
TARGET.onload = FUNCTION;
```

e.g.

```javascript
window.onload = function() {
  init();
  doSomethingElse();
};
```


## Ready state change

Not a single state or event, but fires when moving between states.

- [readystatechange](https://developer.mozilla.org/en-US/docs/Web/API/Document/readystatechange_event)
    > Fired when the readyState attribute of a document has changed. Also available via the `onreadystatechange` property. 


e.g.

```javascript
document.addEventListener('readystatechange', (event) => {
  console.log(event)
  console.log(document.readyState)
});
```

