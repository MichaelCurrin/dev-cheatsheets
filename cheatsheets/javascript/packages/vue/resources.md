# Resources

See also my [Resources](https://github.com/MichaelCurrin/learn-to-code/blob/master/en/topics/scripting_languages/JavaScript/libraries/vue.md) for Vue in Learn to Code.

See the [Vue](https://devhints.io/vue) Cheatsheet on DevHints.

- [vuejs.org](https://vuejs.org/) homepage
- Vue 3
    - [Homepage](https://v3.vuejs.org/)
    - [Installation](https://v3.vuejs.org/guide/installation.html)
        - Upgrade to Vue 3. Note you have to replace the compiler as per [discussion](https://stackoverflow.com/questions/63863222/after-upgrading-to-vue-3-cannot-find-module-vue-compiler-sfc-package-json). There are some code changes to make as well.
            ```sh
            $ yarn add vue@next
            $ yarn remove vue-template-compiler
            $ yarn add @vue/compiler-sfc -D
            ```
    - [TypeScript Support](https://v3.vuejs.org/guide/typescript-support.html) - this explains how to configure your project and how to add TypeScript to your Vue components.
- Vue 2
    - [Installation](https://vuejs.org/v2/guide/installation.html)
    - [TypeScript Support](https://vuejs.org/v2/guide/typescript.html)


See also my [Vue JS Quickstart](https://github.com/MichaelCurrin/vue-quickstart) repo.
