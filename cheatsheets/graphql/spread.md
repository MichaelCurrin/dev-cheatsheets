---
title: Spread
---


When there are multiples types available, you need to use `... on TYPE`. Some options here from the explorer are `Commit`, `Tree`, `Blob` and `Tag`.

Example:

```graphql
{
  repository(owner: "michaelcurrin", name: "aggre-git") {
    defaultBranchRef {
      target {
        ... on Commit {
          history(first: 3) {
            edges {
              node {
                committedDate
              }
            }
          }
        }
      }
    }
  }
}
```
