# Managing imports


## Deps file

There is Deno community convention of putting all dependencies in a central file, with second file for test dependencies:

- `deps.ts`
- `test_depts.ts`

Those act kind of like `package.json` for managing depenencies and versions centrally.


## Import maps

See also the experimental [Import Maps]({{ site.baseurl }}{% link cheatsheets/javascript/deno/import-maps.html %}) feature of Deno.

This means you need a file like for the mapping:

- `import_map.json`

And then all your imports can be from a short URLs like `"react"`, without using the full URL and version all over.
