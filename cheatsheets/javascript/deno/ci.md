---
title: CI
---

Reference for deploying a Deno project with Github Actions:

```yaml
name: CI

on: [push, pull_request]

jobs:
  build:
    name: Server tests

    runs-on: ubuntu-latest

    steps:
      - name: Checkout repo
        uses: actions/checkout@v2

      - name: Download deno
        uses: denolib/setup-deno@master
        with:
          deno-version: v1.1.2

      - name: Check format
        run: deno fmt --check

      - name: run tests
        run: deno test --allow-read --allow-write
```
