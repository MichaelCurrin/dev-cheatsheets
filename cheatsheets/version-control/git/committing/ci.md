---
title: CI
description: How to commit and push with CI
---


{% raw %}

See [GH Actions Commit](https://michaelcurrin.github.io/code-cookbook/recipes/ci-cd/github-actions/workflows/commit.html) recipes for more info.

```sh
git config --global user.name 'Automated Publisher'
git config --global user.email 'actions@users.noreply.github.com'
git commit -am "Commit message..."

git remote set-url origin "https://x-access-token:${{ secrets.GITHUB_TOKEN }}@github.com/${{ github.repository }}"
git push
```

{% endraw %}
