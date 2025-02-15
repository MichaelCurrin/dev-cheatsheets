---
description: tips for using git-log for data manipulation
---
# log tips


## Years

List the years where there were commits.

```sh
$ git log --date=format:'%Y' --pretty=format:'%ad' | uniq
```

See this [Data manipulation][] page for how to apply grouping and counting to this.

[Data manipulation]: {% link cheatsheets/shell/data-manipulation.md %}
