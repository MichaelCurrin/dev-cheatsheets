---
logo: docker
description: Guide to synax for a `Dockerfile` file
---
# Dockerfile

See [Dockerfile reference](https://docs.docker.com/engine/reference/builder/) doc.


### Overview

<!-- Syntax highlighting breaks in Jekyll if indenting Dockerfile codeblock -->

`Dockerfile`
```Dockerfile
FROM image-name

ENV foo=bar
ARG fizz=buzz

RUN apt-get update
RUN apt install -q -y foo

RUN echo "Hello"
```



