# Configure


## How to configure

### Config file

Set up a config file:

- Main config
    - `.prettierrc.json`
    - `prettier.config.js` or `.prettierrc.js`
- Ignore config
    - `.prettierignore`
- Editor config
    - Prettier uses `.editorconfig` by default. You can ignore this with `--no-editorconfig` if you need it.
    
You might want to edit VS Code settings too if you use a Prettier extension.

Example config with one rule in it:

- `.prettierrc.json`
    ```json
    {
      "arrowParens": "avoid"
    }
    ```

### Flags

Pass command line flags to change Prettier behavior. See the [Prettier CLI cheatsheet][] for more info.

[Prettier CLI cheatsheet]: {{ site.baseurl }}{% link cheatsheets/javascript/format-and-lint/prettier/cli.md %}
