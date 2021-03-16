---
title: Standalone usage
description: Quick reference for using Prettier in a JS project, without installing it

If you don't have Prettier installed globally or in a project, you can still download and run it on a project and then have the package discarded.

It will use the default Prettier options. plus any overrides you've set in Prettier configs.


## Wide

```sh
$ npx prettier -w .
```

That will include markdown files, which you might want to skip. Plus HTML files will use 2 space indentation, while I prefer 4.


## Target directories

Target `src` and `tests` directories:

```sh
$ npx prettier -w src tests
```


## Target extensions

Target JS, TS, JSON and CSS files. This will not affect HTML and markdown files.

```sh
$ npx prettier -w '**/*.{js,ts,json,css}'
```

You can actually leave off the quotes if you have glob matching enabled in Bash, or use ZSH.


If you project is has everything at the top-level:

```s
$ npx prettier -w '*.{js,css}'
```
