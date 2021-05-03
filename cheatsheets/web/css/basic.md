# Basic


## Inline

```html
<head>
    <style>
    p {
      color: blue;
    }
    </style>
</head>
```

## External

On older websites, you might see `type="text/css"` added explicitly.

```html
<head>
    <link rel="stylesheet" href="/assets/css/styles.css" />
</head>
```

- `assets/css/styles.css`
    ```css
    p {
      color: blue;
    }
    ```

See the [link](https://html.spec.whatwg.org/multipage/semantics.html#the-link-element) HTML spec - used not just for CSS.
