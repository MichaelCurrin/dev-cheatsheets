# Flexbox vs grid

From [Relationship of grid layout to other layout methods](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout/Relationship_of_Grid_Layout) on Mozilla docs.

> flexbox was designed for layout in one dimension - either a row or a column. 
> 
> Grid was designed for two-dimensional layout - rows, and columns at the same time. 
> 
> The two specifications share some common features, however, and if you have already learned how to use flexbox, the similarities should help you get to grips with Grid.


## Basic

The HTML

```html
<div class="wrapper">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
</div>
```

### Flexbox

The CSS:

```css
.wrapper {
  width: 500px;
  display: flex;
  flex-wrap: wrap;
}
.wrapper > div {
  flex: 1 1 150px;
}
```


### Grid

The CSS:

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
}
```


## Alignment

The HTML

```html
<div class="wrapper">
  <div class="box1">One</div>
  <div class="box2">Two</div>
  <div class="box3">Three</div>
</div>
```

### Flexbox

```css
.wrapper {
  display: flex;
  align-items: flex-end;
  min-height: 200px;
}
.box1 {
  align-self: stretch;
}
.box2 {
  align-self: flex-start;
}
```

### Grid

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(3,1fr);
  align-items: end;
  grid-auto-rows: 200px;
}
.box1 {
  align-self: stretch;
}
.box2 {
  align-self: start;
}
```



## Alternative

See also [CSS Multi-column Layout](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Columns).

This is in a working draft state in 2021. It looks like it serves the same purpose as Flexbox and Grid.

The HTML

```html
<div class="container">
  <p>Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion daikon amaranth tatsoi tomatillo melon azuki bean garlic.</p>

  <p>Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato. Dandelion cucumber earthnut pea peanut soko zucchini.</p>
            
  <p>Turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus winter purslane kale. Celery potato scallion desert raisin horseradish spinach carrot soko.</p>
</div>
```

The CSS

```css
.container {
  column-count: 3;
}
```

