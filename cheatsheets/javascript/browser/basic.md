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
const el = document.getElementById('my-id');

el.getAttribute('src',);
el.setAttribute('src', 'https://example.com');
```

I think there is a cleaner way to do this with remove and no check, or toggle class. 

```js
// classList is now widely supported https://caniuse.com/#search=classList
if (el.classList.contains('my-class')) {
    el.classList.remove('my-class');
}
```

See [video](https://youtube.com/shorts/06u4AtF-M04?feature=share).

```js
el.innerHTML = "<b>Hello</b>"

// Safe for security issues.
el.innerContent = "<b>Hello</b>"

el.innerText = "Hello"
```


## Create list

```html
<select id='my-id'></select>
```

```javascript
const selectInput = document.getElementById('my-id');

for (let value of ['a', 'b', 'c']) {
    const option = document.createElement('option');
    option.setAttribute('value', value);
    option.text = value;
    selectInput.appendChild(option);
}
```
