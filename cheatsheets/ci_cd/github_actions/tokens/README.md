# Tokens cheatsheet
> Instructions to set a Github token for CI builds

A Github action needs permissions to push to your `gh-pages` branch. 

There are a few approachs:


## Personal Access Token

Or simply authentication token.

- Create this at the user level and use for one or more repos, not just for actions.
- Access with `${{ secrets.ACCESS_TOKEN }}` or whatever the action needs.
- Docs - [Creating a Personal Access Token for the Command-line](https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line)


## Github Token

- Github creates this for you on a workflow run and you can use it in actions.
- Access with `${{ secrets.GITHUB_TOKEN }}`
- Docs -[Authenticating with the Github Token](https://help.github.com/en/actions/configuring-and-managing-workflows/authenticating-with-the-github_token)
    > GitHub automatically creates a GITHUB_TOKEN secret to use in your workflow. You can use the GITHUB_TOKEN to authenticate in a workflow run.


## Deploy key

1. Go to repo Settings.
1. Go to Deploy Keys.
1. Create key.
1. Set title for convenience and key as an SSH public key (so only that a certain machine can deploy).

