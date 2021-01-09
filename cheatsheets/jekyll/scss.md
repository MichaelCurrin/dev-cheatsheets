# SCSS


## Nesting

### First example

Here we apply a rule to class `foo` and also to a `p` tag inside an element with class `foo`.

Make sure to use space after `&` if using tags - otherwise you'll end up with `foop`.

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

### Second example

If you are combining classes like `.foo.bar` then you don't need a space after `&`.

```scss
.site-nav {
  // Center
  margin: auto;
  width: 50%;
  text-align: center;

  .page-link {
    color: white;
    background-color: $grey-color-dark;
    padding: 10px 10px;
    margin: 0px 5px;

    &:hover {
      background-color: $grey-color;
    }

    &.current {
      background-color: $brand-red;
    }
  }
}
```

Compiled:

```css

.site-nav .page-link {
  color: white;
  background-color: #424242;
  padding: 10px 10px;
  margin: 0px 5px;
}

.site-nav .page-link:hover {
  background-color: #828282;
}

.site-nav .page-link.current {
  background-color: #e8262d;
}
```
