# setTimeout
> Wait a given time in millesecond then perform a function call, using argumemnts


- [setTimeout](https://developer.mozilla.org/en-US/docs/Web/API/setTimeout) in MDN docs.


## Set a timeout

Here waiting 2 seconds.

```javascript
setTimeout(function(){
    console.log("World");
}, 2000);

console.log("Hello");
```

Output:

```
Hello
World
```


## Clear a timeout

Cancel a timeout in progress.

Pass the ID to `clearTimeout`.

```javascript
const timeoutId = setTimeout(function(){
    console.log("Hello World");
}, 2000);

clearTimeout(timeoutId);
console.log(`Timeout ID ${timeoutId} has been cleared`);
```


## Set multiple timeouts

```javascript
setTimeout(() => {console.log("this is the first message")}, 5000);
setTimeout(() => {console.log("this is the second message")}, 3000);
setTimeout(() => {console.log("this is the third message")}, 1000);
// this is the third message
// this is the second message
// this is the first message
```


