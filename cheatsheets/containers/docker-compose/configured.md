# Configure

## Context and Dockerfile

For more info, see [Build definition](https://github.com/compose-spec/compose-spec/blob/master/build.md#build-definition) in the docs.
```yaml
version: 3

services:
  my-service:
    image: user/foo
    build:
      context: ../my-dir
      dockerfile: foo.Dockerfile
```
