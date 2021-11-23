# Attributes


## Get attribute

If the attribute does not exist, you'll get `null`.

Examples:

```javascript
el.getAttribute("class")
// "btn"
```


## Set attribute

```javascript
el.setAttribute('class', 'btn')
```

If you want to add to the class without overwriting the whole value:

```javascript
el.addClassName('btn')
```


## Binary attributes

Note that some fields like `disabled` on a button should **not** be set to true and false. You must add the attribute (an empty string or `"true"` works) and _remove_ the attribute (not set it to `"false"`).

```javascript
const loginBtn = document.getElementById('login')
const logoutBtn = document.getElementById('logout')

if (isloggedIn()) {
  loginBtn.setAttribute('disabled', '')
  logoutBtn.removeAttribute('disabled')
} else {
  loginBtn.removeAttribute('disabled')
  logoutBtn.setAttribute('disabled', '')
}
```
