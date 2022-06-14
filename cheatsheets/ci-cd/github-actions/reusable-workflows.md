---
title: Reusable workflows
description: Call a workflow file within a repo or across repos
---

See docs - [Reusing workflows](https://docs.github.com/en/actions/using-workflows/reusing-workflows).

> Learn how to avoid duplication when creating a workflow by reusing existing workflows.
> 
> Rather than copying and pasting from one workflow to another, you can make workflows reusable. You and anyone with access to the reusable workflow can then call the reusable workflow from another workflow.



## Set trigger

```yaml
on:
  workflow_call:
```

Or

```yaml
on:
  workflow_call:
    inputs:
      username:
        required: true
        type: string
    secrets:
      envPAT:
        required: true
```


## Specify workflow

```yaml
jobs:
  call-workflow-passing-data:
    uses: octo-org/example-repo/.github/workflows/reusable-workflow.yml@main
    with:
      username: mona
    secrets:
      envPAT: ${{ secrets.envPAT }}
```

