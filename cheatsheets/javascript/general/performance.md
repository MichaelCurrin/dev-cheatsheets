# Performance

## Window.performance

See [Window.performance](https://developer.mozilla.org/en-US/docs/Web/API/Window/performance) in Mozilla dev docs.

> The Window interface's `performance` property returns a Performance object, which can be used to gather performance information about the current document. It serves as the point of exposure for the Performance Timeline API, the High Resolution Time API, the [Navigation Timing API][], the [User Timing API][], and the [Resource Timing API][].

[Navigation Timing API]: https://developer.mozilla.org/en-US/docs/Web/API/Navigation_timing_API
[User Timing API]: https://developer.mozilla.org/en-US/docs/Web/API/User_Timing_API
[Resource Timing API]: https://developer.mozilla.org/en-US/docs/Web/API/Resource_Timing_API

```javascript
const performanceData = window.performance;
```

### Calculate measures

#### Total page load time

```javascript
const perfData = window.performance.timing;
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
