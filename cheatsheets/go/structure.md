---
description: Explaining layout that this project follows, which is best practice
---
# Structure

## Template projects

Templates in `golang-standards` on GitHub:

- [Project layout](https://github.com/golang-standards/project-layout) - very simple
- [Project template](https://github.com/golang-standards/project-template) - very detailed


## Project layout

- `cmd/` - Entrypoint. Code can be minimal here.
- `pkg/` - Code to be imported in other projects (directory is optional).
- `internal/` - Code that is used only for the project.
- `go.mod` - Declare a go module at the root of your project.

See [.gitignore](https://github.com/golang-standards/project-template/blob/master/.gitignore) of the official template.
