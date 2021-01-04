# Workflow


## Basic

Here we use a standard [Checkout](https://github.com/actions/checkout) action and some install and build steps without installing any extra Actions.

You might use a more specific name at the top, like `Node CI` or `GH Pages deploy`.

```yaml
name: Build

on: push

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout 🛎️
        uses: actions/checkout@master

      - name: Install 🔧
        run: # Your install command

      - name: Build 🏗️
        run: # Your build command
```

Alternatively specify a version e.g. `actions/checkout@v2`.


## Clear credentials

If you do anything with secret data such as tokens, it recommended to add this paramter:

```yaml
steps:
  - name: Checkout 🛎️
    uses: actions/checkout@master
    with:
      persist-credentials: false
```


## Submodules

If you have a submodules to checkout, add this for the relevant step:

```yaml
steps:
  - name: Checkout 🛎️
    uses: actions/checkout@master
    with:
      submodules: true
```
