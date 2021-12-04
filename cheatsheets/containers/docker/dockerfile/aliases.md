# Aliases

Given an image an alias and then use it later.

```Dockerfile
FROM IMAGE AS ALIAS
```

Example:

`Dockerfile`
```Dockerfile
FROM python:alpine AS base

FROM base AS dev
CMD ["mkdocs", "serve", "-a", "0.0.0.0:8000"]

FROM base AS build
COPY . .
RUN mkdocs build
```
