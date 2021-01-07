# SCSS


## Nesting

Here we apply a rule to class `foo` and also to a `p` tag inside an element with class `foo`, as 
Make sure to use space after `&`.

```scss
.foo {
  color: blue;
  
  & p {
    color: red
  }
}
```

Compiled CSS:

```css
.foo {
  color: blue;
}

.foo p {
  color: red;
}
```
