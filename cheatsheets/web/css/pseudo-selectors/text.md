## Text


## Selectors

- `::first-line`
- `::last-child`
- `::only-child`


## Examples

Instead of adding `span` with `first` as class, you can use a selector for the first line like this:

```css
/* The first line of every <p> element. */
p::first-line {
  color: blue;
  text-transform: uppercase;
}
```
