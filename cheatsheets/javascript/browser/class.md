# Class


## Setup

```javascript
const el = document.getElementById("my-el")
```


## Set

```javascript
el.className = 'abc def open'
```


## View

```javascript
el.className
// 'abc def open'
```

```javascript
el.classList
// [ "abc", "def" ]
```


## Add

You can only add one class at a time like this. No spaces allowed. The class can only be added once and after that will be ignored.

```javascript
el.classList.add("xyz")

el.className
'abc def xyz'
```


## Remove

```javascript
el.classList.remove("abc")
```


## Toggle

Add or remove a class, depending on the current state.

```javascript
el.classList.toggle("abc")
```
