# Yarn

From Github Actions samples.

[action](https://github.com/marketplace/actions/github-action-for-yarn)

````yaml
name: CI
on: [push]
jobs:
  build:
    name: Test
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - uses: borales/actions-yarn@v2.0.0
        with:
          cmd: install # will run `yarn install` command
      - uses: borales/actions-yarn@v2.0.0
        with:
          cmd: build # will run `yarn build` command
      - uses: borales/actions-yarn@v2.0.0
        with:
          cmd: test # will run `yarn test` command
  ```
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTQ1NjYzNjQ4NV19
-->