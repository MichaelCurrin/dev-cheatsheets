# Formats


## JS

Plain JS.

```sh
$ esbuild --outfile=dist/main.js src/index.js
```


## JSX

It can handle `.jsx` for React apps.

```sh
$ esbuild --outfile=dist/main.js src/index.jsx
```


## TypeScript

It can handle `.ts` and `.tsx` files. Even without TypeScript installed.

It will not evaluate your types though. You'll need to install and run TypeScript for that.

```sh
$ esbuild --outfile=dist/main.js src/index.ts 

$ esbuild --outfile=dist/main.js src/index.tsx 
```

