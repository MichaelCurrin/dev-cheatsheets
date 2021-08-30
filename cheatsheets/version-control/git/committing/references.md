---
description: References to commits
---
# References


## Current commit

`HEAD` or `@`


## One back

`HEAD~`

`abcd123~`


## Multiple commits back

`HEAD~~` or `HEAD~2`

`HEAD~~~` or `HEAD~3`


## Next commit

`HEAD^`

Or multiple commits ahead, as per multiple commits back style.


## Branch

`main`

Remote 

`origin/main`



## Pushing

From docs:

> `HEAD` is a symbolic ref, and it can be seen with `git symbolic-ref HEAD`

```sh
git push

git push origin

git push origin HEAD

git push origin CURRENT_BRANCH_NAME
```
