# Basic


## Inline

### Syntax
`style` tag with CSS as contnet.

### Example

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

### Syntax

A self-closing HTML tag. End with `>`, or even `/>`.

```html
<link rel="stylesheet" href="MY_URL">
```

On older websites, you might see `type="text/css"` added explicitly.

### Example

```html
<head>    
    <link rel="stylesheet" href="https://unpkg.com/primevue@2.2.3/resources/primevue.min.css" />
    
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
