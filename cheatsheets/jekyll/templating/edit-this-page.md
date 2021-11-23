# Edit page button

Add a button for visitors to go to GitHub and edit the page.

Sample text:

- Improve this page
- Edit this page
- Edit on GitHub
- Edit this page on GitHub

For an icon, use one of:

- Unicode emoji, safe to use in HTML: 📝
- FontAwesome logo: `<i class="fa fa-pencil"></i>`

### Jekyll

```html
<a href="https://github.com/MichaelCurrin/dev-cheatsheets/edit/master/{{ page.path }}">
    Improve this page
</a>
```

See also the `_includes` folder of this repo.

### DocsifyJS

For DocsifyJS, use a plugin:

- [njleonzhang/docsify-edit-on-github](https://github.com/njleonzhang/docsify-edit-on-github)
