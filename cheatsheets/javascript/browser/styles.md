# Styles


### Get styles

```javascript
el.style
```

Or

```javascript
el.getAttribute("style")
// "left: 321px; top: 69px; visibility: hidden;"
```


## Get style

```javascript
el.style.left
```

Or

```javascript
el.getStyle('left')
// "321px"
```


## Set style

From [setProperty](https://developer.mozilla.org/en-US/docs/Web/API/CSSStyleDeclaration/setProperty) docs MDN.

```javascript
el.style.setProperty('color', 'red')
```

I could not get `el.setStyle('color', 'red')` to work.
