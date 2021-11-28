# Built-in variables


{% raw %}

## Environment variables

See [Default environment variables][] in the docs.

[Default environment variables]: https://docs.github.com/en/actions/learn-github-actions/environment-variables#default-environment-variables


## Contexts

See [Contexts][] in the docs.

[Contexts]: https://docs.github.com/en/actions/learn-github-actions/contexts

Some contexts are covered below with some attributes.

### Print all

Dump contexts and attributes to the log. Be careful with logging sensitive info though.

Copied from [docs](https://docs.github.com/en/actions/learn-github-actions/contexts#example-printing-context-information-to-the-log-file).

```yaml
on: push

jobs:
  one:
    runs-on: ubuntu-latest
    steps:
      - name: Dump GitHub context
        env:
          GITHUB_CONTEXT: ${{ toJSON(github) }}
        run: echo "$GITHUB_CONTEXT"
        
      - name: Dump job context
        env:
          JOB_CONTEXT: ${{ toJSON(job) }}
        run: echo "$JOB_CONTEXT"
        
      - name: Dump steps context
        env:
          STEPS_CONTEXT: ${{ toJSON(steps) }}
        run: echo "$STEPS_CONTEXT"
        
      - name: Dump runner context
        env:
          RUNNER_CONTEXT: ${{ toJSON(runner) }}
        run: echo "$RUNNER_CONTEXT"
        
      - name: Dump strategy context
        env:
          STRATEGY_CONTEXT: ${{ toJSON(strategy) }}
        run: echo "$STRATEGY_CONTEXT"
        
      - name: Dump matrix context
        env:
          MATRIX_CONTEXT: ${{ toJSON(matrix) }}
        run: echo "$MATRIX_CONTEXT"
```

### Steps

- `steps.<step id>.outputs` - output of a step.

### GitHub

#### Actor

The user performing the action.

```liquid
${{ github.actor }}
```

e.g. When committing, you could use this as name and email.

```liquid
${{ github.actor }} <${{ github.actor }}@users.noreply.github.com>
```

### Token

- `github.token` - auth token. Same as using `${{ secrets.GITHUB_TOKEN }}`.

### Events

- `github.event_name` -	The name of the event that triggered the workflow run.
- `github.event_path` - The path to the full event webhook payload on the runner.


{% endraw %}
