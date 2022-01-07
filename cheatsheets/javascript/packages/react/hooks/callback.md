# Callback hook

> Returns a memoized callback.

> Pass an inline callback and an array of dependencies. 
> 
> `useCallback` will return a memoized version of the callback that only changes if one of the dependencies has changed. 
> 
> This is useful when passing callbacks to optimized child components that rely on reference equality to prevent unnecessary renders (e.g. shouldComponentUpdate).

Compare with `useMemo` - these are equivalent:

```javascript
useCallback(fn, deps)

useMemo(() => fn, deps)
```
