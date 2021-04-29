# Classes


See also [TypeScript Classes][] cheatsheet.

[TypeScript Classes]: {{ site.baseurl }}{% link cheatsheets/typescript/classes.md %}


## Resources

- [constructor](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes/constructor) in Mozilla docs.


## Example class

```javascript
class Greeter {
  constructor(message) {
    this.greeting = message;
  }

  greet() {
    return `Hello, ${this.greeting}`;
  }
}

let greeter = new Greeter("world");
```


## Object accessors

Setting up setters and getters and a class.

See [JavaScript Object Accessors](https://www.w3schools.com/js/js_object_accessors.asp) guide.

```javascript
class Person {
  constructor() {
    this.language = 'n/a'
  }
  
  get lang() {
    return this.language 
  }
  
  set lang(lang) {
    this.language = lang
  }
}
```

```javascript
const p = new Person()

p
// Person { language: 'n/a' }

// Get
p.lang
// 'n/a'

// Set
p.lang = 'English'

p
// Person { language: 'English' }
```
