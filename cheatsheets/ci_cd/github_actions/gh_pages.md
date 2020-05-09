# Github Pages deploy
> How to use an action to build and deploy a site to Github Pages

This skips the standard GH Pages build so you don't have to use Jekyll.

## Basic example

Here we build an NPM project. Such as React or Vue or Gatsby.


Using [Github Pages Deploy Action](https://github.com/marketplace/actions/deploy-to-github-pages) and based on the sample there.


```yaml
name: Build and Deploy

on: push

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout 🛎️
        uses: actions/checkout@v2
        with:
          persist-credentials: false

      - name: Install 🔧 
        run: |
          npm install

      - name: Build 🏗️
        run: |
          npm run build

      - name: Deploy 🚀
        uses: JamesIves/github-pages-deploy-action@releases/v3
        with:
          ACCESS_TOKEN: ${{ secrets.ACCESS_TOKEN }}
          BRANCH: gh-pages
```

Notes:

- More emojis: ⚙️🧱
- If you're using actions/checkout@v2 you must set persist-credentials to false in most cases for the deployment to work correctly.
- See [Tokens](tokens/) guide on Access Tokens.
- The branch is required.


## Full example

Here we use Yarn and several versions of Node to deploy a React app. From [explooosion/react-build-with-github-actions](https://github.com/explooosion/react-build-with-github-actions).

```yaml
name: Build and Deploy
on:
  push:
    branches:
      - master
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

  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@master

      - name: Build and Deploy
        uses: JamesIves/github-pages-deploy-action@master
        env:
          ACCESS_TOKEN: ${{ secrets.ACCESS_TOKEN }}
          BRANCH: gh-pages
          FOLDER: build
          BUILD_SCRIPT: yarn && yarn build
```
