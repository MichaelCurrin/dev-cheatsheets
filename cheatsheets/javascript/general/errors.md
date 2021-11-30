# Errors


## Throw

```javascript
throw new Error("My message")
```


## Try catch

Catch an error, log it, then throw it again.

```javascript
try {
  // ...
} catch (err) {
  console.log(`Cannot foo the bar - ${err.toString()})
  
  throw Err
}
```



## Getting details of an error.

Note that using `${err}` will show _nothing_ in the string, and the whole trace will be printed afterwards.

So do one of these below.

Given error:

```javascript
new Error("My message")
```

Convert to string - with error type and the message.

```javascript
> err.toString()
'Error: My message'
```

Get just the message:

```javascript
> err.message
'My message'
```

Get just the stack traceback.

```javascript
> err.stack
'Error: My message\n' +
  '    at REPL2:1:11\n' +
  '    at Script.runInThisContext (vm.js:120:18)\n' +
  '    at REPLServer.defaultEval (repl.js:442:29)\n' +
  '    at bound (domain.js:427:14)\n' +
  '    at REPLServer.runBound [as eval] (domain.js:440:12)\n' +
  '    at REPLServer.onLine (repl.js:777:10)\n' +
  '    at REPLServer.emit (events.js:326:22)\n' +
  '    at REPLServer.EventEmitter.emit (domain.js:483:12)\n' +
  '    at REPLServer.Interface._onLine (readline.js:329:10)\n' +
  '    at REPLServer.Interface._line (readline.js:658:8)'
```


## Create

const x = 
> x
Error: My message
    at REPL2:1:11
    at Script.runInThisContext (vm.js:120:18)
    at REPLServer.defaultEval (repl.js:442:29)
    at bound (domain.js:427:14)
    at REPLServer.runBound [as eval] (domain.js:440:12)
    at REPLServer.onLine (repl.js:777:10)
    at REPLServer.emit (events.js:326:22)
    at REPLServer.EventEmitter.emit (domain.js:483:12)
    at REPLServer.Interface._onLine (readline.js:329:10)
    at REPLServer.Interface._line (readline.js:658:8)
