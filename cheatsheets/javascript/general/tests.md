---
description: Writing tests for your JavaScript app
---
# Tests

For resources and links, see [Tests](https://github.com/MichaelCurrin/learn-to-code/blob/master/en/topics/scripting_languages/JavaScript/tests.md) guide.


## Spec file

In a script `foo.spec.js` or `foo.test.js`. 

There are difference places to put tests: in `spec`, `tests`, `__tests__` or in the same directory as script it tests.

```javascript
import foo from "../foo.js"

describe('#foo', () => {
  it('returns a correct foo when given a number', () => {
    const result = foo(12)

    expect(result).toEqual({ 'a': 12 })
  })
})


## Methods

- `toBe` - for primitives.
- `toEqual` - for data structures.
- `toDeepEqual` - nested data structures (?)


## Frameworks

### Mocha

See [/src/test/](https://github.com/MichaelCurrin/auto-commit-msg/tree/master/src/test) directory in `auto-commit-msg`, a TypeScript application.

### Jest

See [/tests/unit/](https://github.com/MichaelCurrin/badge-generator/tree/master/tests/unit) in `badge-generator`, a Vue application.
