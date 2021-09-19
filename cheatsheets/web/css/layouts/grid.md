# Grid

## Grid basic 

### Example

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
}
```


## Grid template layout

Define named areas in a grid with a pattern that must be a rectangle to be valid.

[Video](https://youtube.com/shorts/sYDQBfSQFRI?feature=share)

[Mozilla dev docs](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-template-areas)

### Example

```
.a {
  grid-template: a
}
```
```
grid-template-areas: 
            "a a a"
            "b c c"
            "b c c";
```

```
grid-template-areas: 
            "b b a"
            "b b c"
            "b b c";
```
```
grid-template-areas: 
            "a"
            "b"
            "c";
```
