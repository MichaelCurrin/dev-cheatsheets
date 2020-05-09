# Generic Github Actions cheatsheet

Here we use a standard Checkout action and some install and build steps without extra actions. These steps can be replaced with other shell commands.

You could also make install and build separate steps for easy debugging.

```
name: Build and Deploy
on: [push]
jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout 🛎️
        uses: actions/checkout@v2

      - name: Install and Build 🔧 
        run: |
          npm install
          npm run build
```
