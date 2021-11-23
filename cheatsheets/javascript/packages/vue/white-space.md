# Whitespace

Show a value as multi-line text.

```javascript
text = "abc\n\ndef"
```

Use CSS.

```html
<div style="white-space: pre-line">
  {{ text }}
</div>
```

Or you can replace `\n` with `<br>` and also use `v-html` so it sets as `innerHTML` rather than just as literal `\n` text. But it has a security concern if you use user-generated data.

```javascript
text.replace(/(?:\r\n|\r|\n)/g, '<br />');
```
