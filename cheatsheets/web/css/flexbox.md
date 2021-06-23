# Flexbox


## Align


### Align content

The `align-content` property modifies the behavior of the `flex-wrap` property.

It aligns flex lines.

There must be **multiple** lines of items for this property to have any effect!

### Align items

Aligns flex items.


### Difference

Summary from [flexbox froggy](https://flexboxfroggy.com/).

- `align-content` determines the spacing between lines
- `align-items` determines how the items as a whole are aligned within the container.


## Jusify content

```css
#pond {
  display: flex;
justify-content: flex-end
}
```

- `flex-start`: Items align to the left side of the container.
- `flex-end`: Items align to the right side of the container.
- `center`: Items align at the center of the container.
- `space-between: Items display with equal spacing between them.
- `space-around`: Items display with equal spacing around them.
