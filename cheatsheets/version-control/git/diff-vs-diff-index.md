# git diff vs git diff-index

## Related cheatsheets

- [git diff]{% link cheatsheets/version-control/git/commands/diff.md %}
- [git diff-index]{% link cheatsheets/version-control/git/commands/diff-index.md %}


## Differences

- Purpose:
  * `git diff`: General-purpose command for showing differences between various Git trees, working directory, and index
  * `git diff-index`: Specific command for comparing the current index (staging area) with another tree
- Common usage:
  * `git diff`: Often used without arguments to show changes between working directory and index (staged changes)
  * `git diff-index`: Typically used to compare the index with the HEAD commit
- Flexibility:
  * `git diff`: Can be used in a variety of scenarios to compare different states of files
  * `git diff-index`: More targeted, focused on comparisons involving the index
- Typical use cases:
  * `git diff`: Viewing unstaged changes, comparing branches, commits, or any two Git trees
  * `git diff-index`: Seeing what changes are staged for the next commit compared to a specific tree-ish object
- Scope:
  * `git diff`: Broader comparison capabilities across different Git states
  * `git diff-index`: More specific, primarily for index-based comparisons
- Arguments:
  * `git diff`: Can take various arguments to specify what to compare (commits, branches, files)
  * `git diff-index`: Typically takes a tree-ish object (usually HEAD) to compare against the index

