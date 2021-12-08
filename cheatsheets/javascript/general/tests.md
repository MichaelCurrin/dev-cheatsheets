---
description: Writing tests for your JavaScript app
---
# Tests


## Resources

For links around the frameworks and using them, see [Test Frameworks](https://michaelcurrin.github.io/dev-resources/resources/javascript/test-frameworks/) guide.


## Spec file

In a script `foo.spec.js` or `foo.test.js`. 

There are difference places to put tests: 

- `spec`
- `tests`
- `__tests__` 
- the same directory as script it tests.

Sample:

- `foo.spec.js`
    ```javascript
    import foo from "../foo.js"

    describe('#foo', () => {
      it('returns a correct foo when given a number', () => {
        const result = foo(12)

        expect(result).toEqual({ 'a': 12 })
      })
    })
    ```


## Methods

- `toBe` - for primitives.
- `toEqual` - for data structures.
- `toDeepEqual` - nested data structures (?)


## Frameworks

See example of tests in my projects, to get an idea of syntax in larger scripts.

### Mocha

See [src/test/](https://github.com/MichaelCurrin/auto-commit-msg/tree/master/src/test) directory in `auto-commit-msg`, a TypeScript application.

### Jest

The default view is short, so you might want to see a list of all tests that ran:

```sh
$ jest --verbose
```

Get a test coverage report:

```sh
$ jest --coverage
```

Target specific module or directory:

```sh
$ jest tests/foo.spec.js
$ jest tests/buzz
```

#### Watch

See also [tests/unit/](https://github.com/MichaelCurrin/badge-generator/tree/master/tests/unit) in my `badge-generator repo`, a Vue application.

In that project at least, the default is to run _interactive_ test mode - you get prompted which tests you want to run.

If use`--watchAll` flag, then the tests will rerun on changes and stay in interactive mode.

For builds and CI, use the `--watchAll=false` flag. The `react-scripts` package uses Jest internally so this used as an example.

```sh
$ react-scripts test --env=jsdom --watchAll=false
```
