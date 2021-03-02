# Date and time


## Now

```javascript
> const date = new Date()
2021-03-02T11:47:43.759Z
```

String representation of the object. Same as using `.toISOString()`.

```javascript
> date
2021-03-02T11:47:43.759Z
```

```javascript
> typeof date
'object'
```


## Unix timestamp

```javascript
> const date = new Date(1000000000000)
2001-09-09T01:46:40.000Z
```


## Methods

Create a string from a `Date` instance.

```javascript
> date.toISOString()
'2001-09-09T01:46:40.000Z'
```

```javascript
> date.toString()
'Tue Mar 02 2021 13:47:43 GMT+0200 (South Africa Standard Time)'
```

```javascript
> date.toUTCString()
'Sun, 09 Sep 2001 01:46:40 GMT'
```

```javascript
> date.toDateString()
'Sun Sep 09 2001'
```

```javascript
> date.toTimeString()
'03:46:40 GMT+0200 (South Africa Standard Time)'
```

```javascript
> date.toLocaleString()
'09/09/2001, 03:46:40'
```
