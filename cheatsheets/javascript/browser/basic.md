# Basic

## Selection

```javascript
document.getElementById('myid');
document.getElementsByClassName('my-class');
document.getElementsByName('my-name');
document.getElementsByTagName('div');

document.querySelector('div.my-class');
document.querySelectorAll('div.my-class');
```


## Edit

```javascript
var el = document.getElementById('my-id');

el.getAttribute('src',);
el.setAttribute('src', 'https://example.com');

// classList is now widely supported https://caniuse.com/#search=classList
if (el.classList.contains('my-class')) {
    el.classList.remove('my-class');
}
```


## Create list

```html
<select id='my-id'>
</select>
```

```javascript
var selectInput = document.getElementById('my-id');
for (var value of ['a', 'b', 'c']) {
    var option = document.createElement('option');
    option.setAttribute('value', value);
    option.text = value;
    selectInput.appendChild(option);
}
```
