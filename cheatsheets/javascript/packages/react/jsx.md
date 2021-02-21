# JSX

## Allow JSX syntax in TypeScript

From [IntrinsicElements](https://www.typescriptlang.org/docs/handbook/jsx.html#intrinsic-elements) in JSX docs of TS>

### Verbose

```js
declare namespace JSX {
  interface IntrinsicElements {
    h1: any;
    h2: any;
    div: any;
    p: any;
    // ...
  }
}
```

### Catchall

```js
declare namespace JSX {
  interface IntrinsicElements {
    [elemName: string]: any;
  }
}
```
