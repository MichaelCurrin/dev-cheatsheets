# NYC


## Examples

From the CLI help.

```sh
  nyc npm test                            instrument your tests with coverage
  nyc --require @babel/register npm test  instrument your tests with coverage
                                          and transpile with Babel
  nyc report --reporter=text-lcov         output lcov report after running your
                                          tests
```


## Flags

See [Common Configuration Options](https://github.com/istanbuljs/nyc/blob/master/README.md#common-configuration-options) in the docs.

### All

Perform test coverage analysis on all files, even those not covered by tests. Do this at the test step as you'll get the table in the CLI, plus then you'll also update how the reporter works.

```
  --all, -a                   whether or not to instrument all files of the
                              project (not just the ones touched by your test
                              suite)                  [boolean] [default: false]
```

Remember to add flags _before_ the commands you pass.

```sh
$ nyc --all npm test
```

By testing more files, you might down your test coverage. Also note that there might be some files you cannot or don't write unit tests for and then consider excluding them by name so they are excluded from the coverage report and percent check.

### Note

I found that setting `all` was too broad - it checked `.eslintrc` for example.

And I could not get the `include` value to be good enough. It ended up testing nothing, or only the TS files in `test`. Perhaps I need to keep the default values and not replace them all.

Another option is to use the coverage report _with_ `all` set to provide clues on the files that need coverage. Then add placeholder test files for those and then turn `all` off again.


## Check coverage

Pass a percentage value and get an error status if you fall below this.

```console
$ nyc check-coverage --lines 100
ERROR: Coverage for lines (95.02%) does not meet global threshold (100%)
```


## Sample configuration

My solution based on use in one of my projects.

- `package.json`
    ```json
    {
      "scripts" {
        "cover": "nyc --all npm test",
        "cover:report": "nyc report --reporter=lcov",
        "cover:check": "nyc check-coverage --lines 80",

    }
    ```

## Config file

See [Configuration files](https://github.com/istanbuljs/nyc/blob/master/README.md#configuration-files) in the docs.

Example from the docs:

- `.nycrc.json`
    ```json
    {
      "all": true,
      "include": [
        "src/**/*.js"
      ],
      "exclude": [
        "**/*.spec.js"
      ]
    }
    ```
  
