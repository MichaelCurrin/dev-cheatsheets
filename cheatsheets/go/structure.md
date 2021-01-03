---
description: Explaining layout that this project follows, which is best practice
---
# Structure

## Template projects

Templates in `golang-standards` on GitHub:

- [Project layout](https://github.com/golang-standards/project-layout)
- [Project template](https://github.com/golang-standards/project-template)


## Project layout

- `cmd/` - entrypoint. Code can be minimal here.
- `pkg/` - code to be imported in other projects (directory is optional).
- `internal/` - code that is used only for the project.

See [.gitignore](https://github.com/golang-standards/project-template/blob/master/.gitignore) of the official template.
