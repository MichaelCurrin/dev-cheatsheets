# Github Pages deploy
> How to use an action to build and deploy a site to Github Pages

This skips the standard GH Pages build so you don't have to use Jekyll.

Here we build an NPM project. Such as React or Vue or Gatsby.


Using [Github Pages Deploy Action](https://github.com/marketplace/actions/deploy-to-github-pages).

```
name: Build and Deploy

on: [push]

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout 🛎️
        uses: actions/checkout@v2 # If you're using actions/checkout@v2 you must set persist-credentials to false in most cases for the deployment to work correctly.
        with:
          persist-credentials: false

      - name: Install 🔧 
        run: |
          npm install

      - name: Build
        run: |
          npm run build

      - name: Deploy 🚀
        uses: JamesIves/github-pages-deploy-action@releases/v3
        with:
          ACCESS_TOKEN: ${{ secrets.ACCESS_TOKEN }}
          BRANCH: gh-pages
```
