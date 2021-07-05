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


## Check coverage

```console
$ nyc check-coverage --lines 98
ERROR: Coverage for lines (95.02%) does not meet global threshold (100%)
```


## Commands

- `package.json`
    ```json
    {
      "scripts" {
        "cover": "nyc npm test",
        "cover:report": "nyc report --reporter=lcov",
        "cover:check": "nyc check-coverage --lines 90 ",

    }
    ```
