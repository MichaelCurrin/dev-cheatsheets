# Elements

## Create element

```javascript
document.createElement("p")

const el = document.createElement("span")
el.innerHTML = "Hello <b>World</b>!"
```

Or create a document fragment which is empty, using [createDocumentFragment][]. 

```javascript
const el = document.createDocumentFragment()
const innerEl = document.createElement("p")
innerEl.innerText = "Hello, World!"
el.appendChild(innerEl)
```

I can't get this to work with `innerHTMl` though.

```javascript
const el = document.createDocumentFragment()
el.innerHTML = "<p>Hello <b>World</b>!</p>"
```


[createDocumentFragment]: https://developer.mozilla.org/en-US/docs/Web/API/Document/createDocumentFragment
 
## Insert

```javascript
el.append(...)
```

```javascript
el.appendChild(...)
```

Based on [source](https://stackoverflow.com/questions/4793604/how-to-insert-an-element-after-another-element-in-javascript-without-using-a-lib).

To insert before an element.

```javascript
function insertBefore(currentEl, newEl) {
    currentEl.parentNode.insertBefore(newEl, currentEl);
}
```

To insert after an element.

```javascript
function insertAfter(currentEl, newEl) {
    currentEl.parentNode.insertBefore(newEl, currentEl.nextSibling);
}
```


## Inner text

```javascript
el.innerText = "Hello, World!"
```


### Inner HTML

Note case.

```javascript
el.innerHTML = "<p>Hello, <b>World</b>!</p>"
```

Using JS template literals:

```javascript
const link = "https://example.com"
const el = document.createElement('p')
el.innerHTML = `See more info <a href="${link}">here</a>`
```


## Codeblock

Example of creating a code snippet of options and adding it to the page as stringified JSON data.

```javascript
const pre = document.createElement('pre')
const code = document.createElement('code')
code.innerText = JSON.stringify(options, null, 4)
pre.append(code)
insertAfter(el, pre)
```
