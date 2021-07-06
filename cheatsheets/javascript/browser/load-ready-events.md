# Load and ready events


## Resources

- [Document](https://developer.mozilla.org/en-US/docs/Web/API/Document) - specifically see [Load and unload events](https://developer.mozilla.org/en-US/docs/Web/API/Document#load_unload_events)


## Summary of sequence

Be careful - you'll override multiple events set up with the assignment approach - adding with `addEventListener` is better as it appends.

```javascript
document.ready = () => console.log('document ready')

window.addEventListener('DOMContentLoaded', () => console.log('DOM content loaded'))

window.onload = () => console.log('window loaded')
```

jQuery:

```javascript
$(document).ready(() => 'document ready')

$(window).load(() => 'window loaded')
```


## DOM content loaded event

- [Window: DOMContentLoaded event](https://developer.mozilla.org/en-US/docs/Web/API/Window/DOMContentLoaded_event)
    > The `DOMContentLoaded` event fires when the initial HTML document has been completely loaded and parsed, without waiting for stylesheets, images, and subframes to finish loading.
- [Document : DOMContentLoaded](https://developer.mozilla.org/en-US/docs/Web/API/Window/DOMContentLoaded_event)
    > The `DOMContentLoaded` event fires when the initial HTML document has been completely loaded and parsed, without waiting for stylesheets, images, and subframes to finish loading.
    > 
    > A different event, `load`, should be used only to detect a fully-loaded page. It is a common mistake to use load where DOMContentLoaded would be more appropriate.


e.g.

```javascript
window.addEventListener('DOMContentLoaded', (event) => {
  console.log('DOM fully loaded and parsed');
});
```

If you need access to `this`, then don't use an arrow function.

```javascript
window.addEventListener('DOMContentLoaded', function(event) {
  console.log('DOM fully loaded and parsed');
  console.log(event)
  console.log(this)
})
```

I tried doing that on `document` and got an error if using `this`:

> Error: Promised response from onMessage listener went out of scope

It looks like `window.DOMContentLoaded` is _not_ valid but you can add a event listener as above.


## Load event

- [load](https://developer.mozilla.org/en-US/docs/Web/API/Window/load_event) event
    > The load event is fired when the whole page has loaded, including all dependent resources such as stylesheets and images. This is in contrast to `DOMContentLoaded`, which is fired as soon as the page DOM has been loaded, without waiting for resources to finish loading.
- [onload](https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers/onload) 
    > The onload property of the GlobalEventHandlers mixin is an EventHandler that processes load events on a Window, XMLHttpRequest, <img> element, etc.
    > 
    > The `load` event fires when a given resource has loaded.

```javascript
TARGET.onload = FUNCTION;

// OR
TARGET.addEventListener('DOMContentLoaded', FUNCTION)
```

e.g.

```javascript
window.onload = function() {
  init();
  doSomethingElse();
};
```


## Ready state change

Not a specific state or event, but fires each time when moving between states.

- [readystatechange](https://developer.mozilla.org/en-US/docs/Web/API/Document/readystatechange_event)
    > Fired when the readyState attribute of a document has changed. Also available via the `onreadystatechange` property. 

e.g.

```javascript
document.addEventListener('readystatechange', (event) => {
  console.log(event)
  console.log(document.readyState)
});
```
