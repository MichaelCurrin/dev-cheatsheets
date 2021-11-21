# Performance


## Related

See also [Load and ready events][] cheatsheet.

[Load and ready events]: {{ site.baseurl }}{% link cheatsheets/javascript/browser/events/load-ready.md %}


## Resources

- [Page performance metrics](https://gist.github.com/MichaelCurrin/74f7147658da5f24fc6f6cc66c07009a) - my gist.
- [Window.performance](https://developer.mozilla.org/en-US/docs/Web/API/Window/performance) in Mozilla dev docs.


## Browser performance timings

Browsers have a built-in JS object which contains performance-related timings, which you can use to calculate performance metrics.

> The Window interface's `performance` property returns a Performance object, which can be used to gather performance information about the current document. It serves as the point of exposure for the Performance Timeline API, the High Resolution Time API, the [Navigation Timing API][], the [User Timing API][], and the [Resource Timing API][].

```javascript
window.performance
```

[Navigation Timing API]: https://developer.mozilla.org/en-US/docs/Web/API/Navigation_timing_API
[User Timing API]: https://developer.mozilla.org/en-US/docs/Web/API/User_Timing_API
[Resource Timing API]: https://developer.mozilla.org/en-US/docs/Web/API/Resource_Timing_API

### How to calculate metrics

The examples below come from the Mozilla docs and use this object:

```javascript
const perfData = window.performance.timing;
```

The metrics are in milliseconds but you can divide by 1000 to get to seconds.

#### Total page load time

```javascript
const pageLoadTime = perfData.loadEventEnd - perfData.navigationStart;
// 4208

pageLoadTime / 1000;
// 4.208
```

#### Request response time

```javascript
const connectTime = perfData.responseEnd - perfData.requestStart;
```

#### Page render time

```javascript
const renderTime = perfData.domComplete - perfData.domLoading;
```


## Log events

Reminder to look at the browser's dev tools for a visual representation of when the ready events are hit, though it will be outside of your console.

Time in seconds since the page started loading.

```javascript
(new Date() - window.performance.timing.navigationStart) / 1000
```

Use it:

```javascript
function logWithDuration(msg) {
  const elapsed = (new Date() - window.performance.timing.navigationStart) / 1000;
  console.debug(elapsed, msg)
}

document.addEventListener('readystatechange', () => {
  logWithDuration(document.readyState)
});
```
