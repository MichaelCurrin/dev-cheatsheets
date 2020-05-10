# Yarn

## Example 1

From Github Actions samples.

[Github Action for Yaraction](https://github.com/marketplace/actions/github-action-for-yarn) action.

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

## Example 2

From this [post](https://spin.atomicobject.com/2020/01/20/github-actions-react-node/) about deploying React/Node to Heroku.

Using 

- `checkout`
- `cache`
- `setup-node`.

```
jobs:
  test:
    name: Test
    runs-on: ubuntu-latest
    env:
      NODE_ENV: test

    steps:
    - name: Checkout
      uses: actions/checkout@v1

    - name: Get yarn cache
      id: yarn-cache
      run: echo "::set-output name=dir::$(yarn cache dir)"

    - uses: actions/cache@v1
      with:
        path: ${{ steps.yarn-cache.outputs.dir }}
        key: ${{ runner.os }}-yarn-${{ hashFiles('**/yarn.lock') }}
        restore-keys: |
          ${{ runner.os }}-yarn-

    - uses: actions/setup-node@v1.1.0
      with:
        node-version: '10.x'

    - run: yarn install
    
    - run: yarn lint
    - run: knex migrate:latest
    - run: yarn test:server
    
  deploy:
    name: Deploy
    runs-on: ubuntu-latest
    needs: test
```


## Example 3

From [react-build-with-github-actions](https://github.com/explooosion/react-build-with-github-actions) example app.

```
jobs:
  install-and-test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        node-version: [8.x, 10.x, 12.x]
    steps:
      - uses: actions/checkout@master
      - name: Use Node.js ${{ matrix.node-version }}
        uses: actions/setup-node@master
        with:
          node-version: ${{ matrix.node-version }}
      - name: Install and Test
        run: |
          yarn
          yarn test
        env:
          CI: true
```   
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTYwMzQ4NzA4XX0=
-->