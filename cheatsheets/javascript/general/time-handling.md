---
title: Time handling
description: Working with dates, times and current time in JS
---

## Unix timestamp

Convert unix timestamp to datetime.

```javascript
> const datetime = new Date(1000000000000)
```

Create unix timestamp from string.

```javascript
> Date.parse('1970-01-02')
86400000

> Date.parse('1970-01-01 02:00') // Currently at GMT+2
0

> Date.parse('1970-01-01 03:00')
3600000

> Date.parse('2021-02-03 04:05:01')
1612317901000
```

## Date construction

### Get attribute from datetime

```javascript
> const datetime = new Date()
```

Just a few of the methods available.

```javacript
> datetime.getFullYear()
2021
```

```javacript
> datetime.getMonth()
3
```

```javascript
> datetime.getDate()
17
```

Day of week.

```javascript
const datetime.getDay()
1  // Monday
```

### Represent datetime

```javascript
> const datetime = new Date()
```

Convert a `Date` instance to a string.

```javascript
> datetime.toISOString()
'2001-09-09T01:46:40.000Z'
```

```javascript
> datetime.toString()
'Tue Mar 02 2021 13:47:43 GMT+0200 (South Africa Standard Time)'
```

```javascript
> datetime.toUTCString()
'Sun, 09 Sep 2001 01:46:40 GMT'
```

```javascript
> datetime.toDateString()
'Sun Sep 09 2001'
```

```javascript
> datetime.toTimeString()
'03:46:40 GMT+0200 (South Africa Standard Time)'
```

```javascript
> datetime.toLocaleString()
'09/09/2001, 03:46:40'
```


## Now

Create an `Date` object with type `object. If you don't pass a value to the constructor, you get the current date and time.

```javascript
> const datetime = new Date()
```

Then use methods on it.

```javascript
> datetime.toISOString()
2021-03-02T11:47:43.759Z
```

Without using `new` keyword, it still works but you just get a string. Note so usable.

```javascript
> Date()
"Mon Apr 19 2021 10:43:22 GMT+0200 (South Africa Standard Time)"
```

Create unix timestamp.

```javascript
> Date.now()
1618822230513
```
