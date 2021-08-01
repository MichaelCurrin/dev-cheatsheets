# Flexbox

See [Flexbox](https://www.w3schools.com/css/css3_flexbox.asp) tutorial on W3 Schools.


## Flex

From [Flex](https://www.w3schools.com/cssref/css3_pr_flex.asp) on W3 Schools.

```css
el {
  flex: 1;
}
```

Values:

- `flex-grow flex-shrink flex-basis|auto|initial|inherit`


### Example

> Using `flex` together with media queries to create a different layout for different screen sizes/devices:

```css
.flex-container {
  display: flex;
  flex-wrap: wrap;
}

.flex-item {
  flex: 50%;
}

@media (max-width: 800px) {
  .flex-item {
    flex: 100%;
  }
}
```

The media query is for a responsive layout - makes a one column layout (100%) instead of a two-column layout (50%).


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
  justify-content: flex-end;
}
```

- `flex-start`: Items align to the left side of the container.
- `flex-end`: Items align to the right side of the container.
- `center`: Items align at the center of the container.
- `space-between: Items display with equal spacing between them.
- `space-around`: Items display with equal spacing around them.
