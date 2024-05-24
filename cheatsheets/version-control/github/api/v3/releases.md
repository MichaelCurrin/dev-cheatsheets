# Releases and tags

Some repos only have tags and no releases, so check if there are releases in the GitHub UI for a specific repo before looking for its release in the API. 

A release is specific to GitHub, while a tag is in the Git repo and also stored on GitHub.

The latest release, if there are releases.

e.g. [https://api.github.com/repos/octokit/core.js/releases/latest](https://api.github.com/repos/octokit/core.js/releases/latest)

For tags, you cannot use `latest`, you have to use a specific value.


## Go example

- Releases - empty list [https://api.github.com/repos/golang/go/releases](https://api.github.com/repos/golang/go/releases), and `latest` gives an error as not found.
- Tags - [https://api.github.com/repos/golang/go/tags](https://api.github.com/repos/golang/go/tags)

I got this from the API could could not get it to work with a SHA.

```
git_tags_url	"https://api.github.com/repos/golang/go/git/tags{/sha}"
```

Tried: [https://api.github.com/repos/golang/go/git/tags/cdd3d6932853ec2fb2ac0a693143b22098adb012](https://api.github.com/repos/golang/go/git/tags/cdd3d6932853ec2fb2ac0a693143b22098adb012)
