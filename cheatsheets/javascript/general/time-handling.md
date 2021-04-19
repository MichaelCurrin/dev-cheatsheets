---
title: Time handling
description: Working with dates, times and current time in JS
---


## Date constructor

See [Date](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date) object and methods in the Mozilla docs.

> A JavaScript date is fundamentally specified as the number of **milliseconds** that have elapsed since midnight on January 1, 1970, UTC.
> 
> This date and time are **not the same** as the UNIX epoch (the number of seconds that have elapsed since midnight on January 1, 1970, UTC), which is the predominant base value for computer-recorded date and time values.


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


## Get current date and time

### Using Date

Create an `Date` object with type `object. If you don't pass a value to the constructor, you get the current date and time.

```javascript
> const datetime = new Date()
```

Then use methods on it.

```javascript
> datetime.toISOString()
2021-03-02T11:47:43.759Z
```

If you omit `new` keyword, you get a string. This is not so useful to work with.

```javascript
> Date()
"Mon Apr 19 2021 10:43:22 GMT+0200 (South Africa Standard Time)"
```

It is a shortcut for calling `new Date().toString()`.

### Using Date.now

Create unix timestamp for current time.

Passing a param doesn't seem to make a difference.

```javascript
> Date.now()
1618822230513
```

## UTC constructor

From [Mozilla docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/UTC)

> The Date.UTC() method accepts parameters similar to the Date constructor, but treats them as UTC. It returns the number of milliseconds since January 1, 1970, 00:00:00 UTC.

Syntax:

```
Date.UTC(year[, month[, day[, hour[, minute[, second[, millisecond]]]]]])
```

Example:

```javascript
Date.UTC(2020, 1, 2, 3, 4, 5)
1580612645000
```

Example use with `Date` constructor:

```javascript
new Date(Date.UTC(2020, 1, 2, 3, 4, 5))
Date Sun Feb 02 2020 05:04:05 GMT+0200 (South Africa Standard Time)
```


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
