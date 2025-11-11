# Clipboard

## Copy to clipboard

[Source](https://stackoverflow.com/questions/33855641/copy-output-of-a-javascript-variable-to-the-clipboard) 

```javascript
function copyToClipboard(text) {
  var dummy = document.createElement("textarea");
  document.body.appendChild(dummy);
  dummy.value = text;
  dummy.select();
  document.execCommand("copy");
  document.body.removeChild(dummy);
}
copyToClipboard('hello\nworld')
```
