# JSX

This page is specific to React. For a more general guide, see the [JSX][] page.

[JSX]: {{ site.baseurl }}{% link cheatsheets/javascript/general/jsx.md %}


## Structuring JSX

Add parent element.

```jsx
return (
  <>
    <h1>Hello, World!</h1>
    <h2>Hi!</h2>
  </>
)
```

Comma to separate items.

```jsx
return (
  <h1>Hello, World!</h1>,
  <h2>Hi!</h2>
)
```


## With and without JSX

Example from [React docs](https://reactjs.org/docs/add-react-to-a-website.html)

Without JSX. Create an element using the `createElement` function. Here it is aliased to `e`.

```javascript
const e = React.createElement;

function LikeButton() {
  return e(
    'button',
    { onClick: () => this.setState({ liked: true }) },
    'Like'
  );
}
```

With JSX.

```jsx
function LikeButton() {
  return (
    <button onClick={() => this.setState({ liked: true })}>
      Like
    </button>
  );
}
```


## Allow JSX syntax in TypeScript

From [IntrinsicElements](https://www.typescriptlang.org/docs/handbook/jsx.html#intrinsic-elements) in JSX docs of TS.

You can try as `.d.ts` to match [shims-vue.d.ts](https://github.com/MichaelCurrin/vue-typescript-quickstart/blob/master/src/shims-vue.d.ts), but Deno + TypeScript gave a me warning that it could not import so I had to use `.ts` instead.

### Catch-all

- `src/shims-react.ts`
    ```typescript
    declare namespace JSX {
      interface IntrinsicElements {
        [elemName: string]: any;
      }
    }
    ```

### Verbose

- `src/shims-react.ts`
    ```typescript
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
