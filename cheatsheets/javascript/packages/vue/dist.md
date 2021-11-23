# Distributions

Which build / distribution file to use?

See the release notes of the latest build. e.g. [3.1.1](https://www.npmjs.com/package/vue/v/3.1.1) on NPM.


 
## Available files:

### From CDN or without a Bundler

- `vue(.runtime).global(.prod).js:`
    - `vue.global.js`
    - `vue.runtime.global.js`
- `vue(.runtime).esm-browser(.prod).js`

e.g. On the frontend, without  build step.

```javascript
import { createApp } from "https://unpkg.com/vue@3.0.7/dist/vue.esm-browser.js";
```

### With a Bundler

- `vue(.runtime).esm-bundler.js:`
    - `vue.runtime.esm-bundler.js` - runtime only.
    - `vue.esm-bundler.js` - runtime and compiler.
