# audit


## Check

Find packages which can be auto-upgraded, with supplied commands. And some that neeed manual changes.

```sh
$ npm audit
```

Sample output. There might be many packages listed, but just showing one under each of the two sections here.

You can run the suggested `npm update ...` command manually for each package, or skip to the next section and let the audit tool upgrade as many of them as possible for you.

```

                       === npm audit security report ===

# Run  npm update null --depth 2  to resolve 1 vulnerability
┌───────────────┬──────────────────────────────────────────────────────────────┐
│ Moderate      │ Regular expression denial of service                         │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ Package       │ glob-parent                                                  │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ Dependency of │ @babel/cli [dev]                                             │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ Path          │ @babel/cli > chokidar > glob-parent                          │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ More info     │ https://npmjs.com/advisories/1751                            │
└───────────────┴──────────────────────────────────────────────────────────────┘


┌──────────────────────────────────────────────────────────────────────────────┐
│                                Manual Review                                 │
│            Some vulnerabilities require your attention to resolve            │
│                                                                              │
│         Visit https://go.npm.me/audit-guide for additional guidance          │
└──────────────────────────────────────────────────────────────────────────────┘
┌───────────────┬──────────────────────────────────────────────────────────────┐
│ Moderate      │ Regular expression denial of service                         │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ Package       │ glob-parent                                                  │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ Patched in    │ >=5.1.2                                                      │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ Dependency of │ add-asset-html-webpack-plugin [dev]                          │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ Path          │ add-asset-html-webpack-plugin > globby > fast-glob >         │
│               │ glob-parent                                                  │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ More info     │ https://npmjs.com/advisories/1751                            │
└───────────────┴──────────────────────────────────────────────────────────────┘
```


## Fix

Apply the fixes where possible.

```sh
$ npm audit fix
```


## Force fix

To install breaking changes:

```sh
$ npm audit fix --force
```
