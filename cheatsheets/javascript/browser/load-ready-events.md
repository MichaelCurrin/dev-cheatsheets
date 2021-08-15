# Load and ready events


## Resources

- [Document](https://developer.mozilla.org/en-US/docs/Web/API/Document) - specifically see [Load and unload events](https://developer.mozilla.org/en-US/docs/Web/API/Document#load_unload_events)


## Summary of sequence

Be careful - you'll override multiple events set up with the assignment approach - adding with `addEventListener` is better as it appends.

```javascript
document.ready = () => console.log('document ready')

window.addEventListener(
  'DOMContentLoaded', 
  () => console.log('DOM content loaded')
)

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


e.g. Using an arrow functions.

```javascript
window.addEventListener('DOMContentLoaded', (event) => {
  console.log('DOM fully loaded and parsed');
});
```

If you need access to `this`, then use a plain `function` instead.

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

Rather than a specific state or event, this event fires each time when moving between states.

- [readystatechange](https://developer.mozilla.org/en-US/docs/Web/API/Document/readystatechange_event)
    > Fired when the readyState attribute of a document has changed. Also available via the `onreadystatechange` property. 

e.g. Set this up early on your page.

```javascript
<head>
    <script>
        document.addEventListener('readystatechange', (event) => {
            console.debug('readystatechange', document.readyState, event)
        });
    </script>
</head>
```

This can be useful to undertand exactly when your page moves through each state, while also logging other messages.

Reminder to look at the browser's dev tools for a visual representation of when the ready events are hit, though it will be outside of your console.


## Check DOM ready

Check if DOM is available. 

- If it loaded already, you can't wait for DOM content loaded. So just wait 1 millsecond (I don't know why from the code snippet this is based on) and fire the function.
- If it isn't, then it is still coming, so add a function to the DOM content loaded event.

```javascript
const READY_STATES = ['complete', 'interactive']

function domReady(fn) {
  if (READY_STATES.includes(document.readyState) {
    setTimeout(fn, 1);
  } else {
    document.addEventListener('DOMContentLoaded', fn);
  }
}
```
