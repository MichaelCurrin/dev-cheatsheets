---
description: tips for using git-log for data manipulation
---
# log tips


## Years

List the years where there were commits.

```sh
$ git log --date=format:'%Y' --pretty=format:'%ad' | sort -u -r
```

e.g.

```
2022
2020
2019
```

List the year with a count for each.

```sh
$ git log --date=format:'%Y' --pretty=format:'%ad' | uniq -c | awk '{print $2, $1}'
```

e.g.

```
2022 31
2020 230
2019 47
```

