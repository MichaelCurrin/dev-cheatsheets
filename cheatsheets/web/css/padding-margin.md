# Padding and margin


These apply for padding and margin but mostly shown for padding.


Use values like `1px`, `1em`, or `1rem`. Or `1.5` of something.

```css
selector {
  padding: 1px;
  marging: 1px;
}
```


## Top or bottom

```css
selector {
  padding-top: 1px;
}
```

```css
selector {
  padding-bottom: 1px;
}
```


## Same for all sides

```css
selector {
  padding: 1px;
}
```


## Set top and bottom separately to sides

Set for TOP_BOTTOM LEFT_RIGHT.

```css
selector {
  padding: 1px 2px;
}
```


## Set for each side

Set for TOP, BOTTOM, LEFT, RIGHT.

```css
selector {
  padding: 1px 2px 3px 4px;
}
```

Or


```css
selector {
  padding-top: 1px;
  padding-bottom: 2px;
  padding-left: 3px;
  padding-right: 4px;
}
```
