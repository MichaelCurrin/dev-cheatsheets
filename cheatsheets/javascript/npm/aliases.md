# Aliases

Sometimes you need to replace your package on NPM  with a fork which is published under another user's name on NPM.


## Plain replace

For example, from:

```diff
{
  "dependencies": {
-  "foo": "^1.0.0"
+  "@bar/foo": "^1.0.0"
  }
}
```

This means you have to change all your imports:

```diff
- import Foo from 'foo'
+ import Foo from '@buzz/foo'
```


## Replace and use alais

Or, you can leave the imports untouched by installing as an alias.

```sh
$ npm i foo@npm:@buzz/foo@^1.0.0
```

Which makes this change:

```diff
{
  "dependencies": {
-  "foo": "^1.0.0"
+  "foo": "npm:@buzz/foo@^1.0.0"
  }
}
```

The `npm` part indicates to download from the NPM registry. You can also install from GitHub instead.
