# Config files

See [Configuration file](https://prettier.io/docs/en/configuration.html) in the docs.


## Filenames

Set up a config file:

- Main config
    - `.prettierrc.json`
    - `prettier.config.js` or `.prettierrc.js`
- Ignore config
    - `.prettierignore`
- Editor config
    - Prettier uses `.editorconfig` by default. You can ignore this with `--no-editorconfig` if you need it.
    
You might want to edit VS Code settings too if you use a Prettier extension.


## Format

### Main config

Example config with one rule in it:

- `.prettierrc.json`
    ```json
    {
      "arrowParens": "avoid"
    }
    ```

### Ignore config

See the [Ignoring rules][] cheatsheet for more info.

[Ignoring rules]: {{ site.baseurl }}{% link cheatsheets/javascript/format-and-lint/prettier/ignoring-rules.md %}


## Alternative

You can also pass command line flags to change Prettier behavior. See the [Prettier CLI][] section of the cheatsheets for more info.

[Prettier CLI cheatsheet]: {{ site.baseurl }}{% link cheatsheets/javascript/format-and-lint/prettier/cli.md %}
