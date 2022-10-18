# Configure

```yaml
version: 3

services:
  foo-service:
    # ...
  bar-service:
    # ...
```


## Context and Dockerfile

For more info, see [Build definition](https://github.com/compose-spec/compose-spec/blob/master/build.md#build-definition) in the docs.

```yaml
services:
  my-service:
    build:
      context: .
```

```yaml
services:
  my-service:
    image: user/foo
    build:
      context: ../my-dir
      dockerfile: foo.Dockerfile
```

Warning as per the docs - never use `/` as context as it will copy everything on your hard drive to the image.
