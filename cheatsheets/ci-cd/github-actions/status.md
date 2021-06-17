# Status

Run depending on the status of previous steps.

## Syntax

The default behavior is that if a step exits with a non-zero status, all the steps after it will be **skipped**.

From [if](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjob_idstepsif) syntax, you can set a conditional check using one of these:

Short syntax:

```yaml
if: success()
```

Longer syntax using braces:

```yaml
if: ${{ success() }}
```


## Statuc check functions

See [Job status check functions](https://docs.github.com/en/actions/reference/context-and-expression-syntax-for-github-actions#job-status-check-functions) in the docs.

- `success()`
- `failure()` - if previous steps fail or the job is cancelled, run.
- `always()`
- `cancelled()`


## Example

Here the last step only runs if the steps it above failed. Here just printing but you could use an Action to post a message to Slack.

```yaml
steps:
  - name: Post to Slack - start
    
  - name: Build
    
  - name: Post to Slack - failure
    run: |
      echo ${{ job.status }}
    if: failure()
```

Or use `always()` to post either way, along with the status.

```yaml
- name: Post to Slack - failure
  run: |
    echo ${{ job.status }}
  if: failure()
```
