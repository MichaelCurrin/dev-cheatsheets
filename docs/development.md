# Development
> Notes for developers working on this project


First follow the install and usage docs to get this project setup locally.


## Editing

Recommended tool for markdown editing:

- [stackedit.io](https://stackedit.io/)


## Structure

The menus are auto-generated at each level to make it easy to nest content several layers down and not change a menu manually each time. The approach is in this project comes from this prototype project:

- [github.com/MichaelCurrin/nested-jekyll-menus](https://github.com/MichaelCurrin/nested-jekyll-menus/)

Put content in the [cheatsheets](/cheatsheets/) directory.

This helps when iterating over `site.pages` to separate unrelated page which do not have a prefix - see for example:

- `cheatsheets/base64.md`
- `sitemap.xml`
- `feed.xml`
- `assets/main.scss`
- `cheatsheets/shell/zsh.md`


## Find files with bad layout

Each `index.md` file needs to have `layout: listing` set manually but this can be forgotten. And setting is programmatically has a serious negative impact on memory and therefore build time.

Find all `index.md` files which do not match the layout.

```sh
$ grep -L listing $(find . -type f -name index.md )
```
Sample output before these were fixed:

```
cheatsheets/python/configs/index.md
cheatsheets/javascript/linting/index.md
cheatsheets/javascript/general/index.md
```
