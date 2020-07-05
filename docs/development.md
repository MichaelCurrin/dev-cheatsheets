# Development

Follow the install and usage docs to get this project setup locally.


## Structure

The menus are auto-generated at each level to make it easy to nest content several layers down and not change a menu manually each time. The approach is in this project comes from this prototype project:

- https://github.com/MichaelCurrin/nested-jekyll-menus

Put content under the [cheatsheets](/cheatsheets/) directory.

This helps when iterating over `site.pages` to separate unrelated page which do not have a prefix - see for example:

- `cheatsheets/base64.md`
- `sitemap.xml`
- `feed.xml`
- `assets/main.scss`
- `cheatsheets/shell/zsh.md`
