# Dev container

Based on support from GitHub Actions and VS Code - run the same container locally and in CI for consistent running of tasks like testing and building.

See [devcontainers README.md](https://github.com/devcontainers/ci/blob/main/README.md).

> `devcontainers/ci` contains a GitHub action and Azure DevOps task aimed at making it easier to re-use a Visual Studio Code dev container in a GitHub workflow or Azure DevOps pipeline.

From VS Code release notes:

> A GitHub Action and an Azure DevOps Task are available for running a repository's dev container in continuous integration (CI) builds. This allows you to reuse the same setup that you are using for local development to also build and test your code in CI.


e.g.

```yaml
- name: Build and run dev container task
  uses: devcontainers/ci@v0.2
  with:
    imageName: ghcr.io/example/example-devcontainer
    runCmd: make ci-build
```
