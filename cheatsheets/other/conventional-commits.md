# Conventional Commits

About the standard for writing commit messages. These can be validated with tools like commitlint and even auto-generated - see [Auto Commit Message](https://github.com/MichaelCurrin/auto-commit-msg) for VS Code.

<!-- TODO move out to another area -->

## Overview 

From the homepage:

> A specification for adding human and machine readable meaning to commit messages

```
<type>[optional scope]: <description>

[optional body]

[optional footer]
```

### Resources

- [Conventional Commits](https://www.conventionalcommits.org/) homepage
    - See this to learn more on writing Conventional Commits messages. The _Summary_ section covers the prefixes used here.
- Angular
   - [Type](https://github.com/angular/angular/blob/master/CONTRIBUTING.md#type) on the Angular repo. This is linked from the Conventional Commits website as "Angular Convention" and explains what `build` etc. means.
- [Gitmoji](https://gitmoji.dev/) site
   - For a standard of using emojis in commits. 
- [udacity.github.io/git-styleguide](https://udacity.github.io/git-styleguide/)


## Type

A prefix for the commit message describing the type of the change.

### Type values allowed

This should be only one of the types defined in the standard.

See [allowed types](https://github.com/conventional-changelog/commitlint/tree/master/%40commitlint/config-conventional#type-enum) defined in the docs of the `config-conventional` section of the `commitlint` repo.

I've grouped them as they make sense to me.

- Core
    - `feat` - feature
    - `fix`
    - `style`
    - `refactor`
    - `build`
    - `perf` - performance
- Supplemental (the app can still run locally without these)
    - `ci` - update workflow for CI.
    - `docs`
    - `test` - relating to running tests.
- `chore` - like configs and file renames or moves.
- `revert`

### Resources 

See links for more details:

- [seesparkbox.com/foundry/semantic_commit_messages](https://seesparkbox.com/foundry/semantic_commit_messages)
- [hackwild.com/article/semantic-git-commits](https://hackwild.com/article/semantic-git-commits/)
- [karma-runner.github.io/1.0/dev/git-commit-msg.html](https://karma-runner.github.io/1.0/dev/git-commit-msg.html)

### Examples

Here is an example of the feature type used as a prefix.

```
feat: add foo
```

A documentation change:

```
docs: fix typo in foo.md and bar.md
```

From the docs:

> Commits MUST be prefixed with a type, which consists of a noun, feat, fix, etc., followed by a colon and a space.


## Scope

The standard defines use of an optional scope, which is used in additional to the required type.

From the docs:

> An optional scope MAY be provided after a type.
>
> A scope is a phrase describing a section of the codebase enclosed in parenthesis.
>
> e.g. 'fix(parser):'
This would be specific to a particular project, so you cannot know the generalize scopes for all projects. The standard says you should agree in your team what the scopes would be. Perhaps based on features, projects or directories.

I believe there are some scope values which do generalize well.

All dependency changes can have scope of `deps`.

Some possible examples.

```
build(deps): upgrade packages
style(deps): remove whitespace in requirements.txt
fix(deps): correct typo in package.json package name
```

Perhaps updating test dependencies would be under test rather than build.
