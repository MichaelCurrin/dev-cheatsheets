# Access token cheatsheet
> Instructions to set a Github token for CI builds

The action needs permissions to push to your `gh-pages` branch. So you need to create a GitHub
**authentication token** on your GitHub profile, then set it as an environment variable in your
build using _Secrets_.


## Resources

- [Creating a Personal Token for the Command-line](https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line)


## Token naming

Depending on the workflow, the token should be named something like one of these:

- `ACCESS_TOKEN`
- `GITHUB_TOKEN`
- `JEKYLL_PAT` - "Jekyll Personal Access Token".


## How to use a token in a workflow

### 1. Create token

1. Go to **Personal Access Tokens** section.
    - Shortcut URL: [https://github.com/settings/tokens](https://github.com/settings/tokens)
    - Navigation:
        1. Go to your Github profile.
        1. Go to **Developer Settings**
        1. Go to the **Personal Access Tokens** section.
1. **Create** a token - or use one you generated before.
    - Give it a name like "GitHub Actions"
    - Give it has permissions to `public_repos` (or the entire `repo` scope for private repository). Necessary for the action
   to commit to the `gh-pages` branch.
1. **Copy** the token value.


### 2. Set the token in secrets

1. Go to your repository's **Settings*
1. Go to **Secrets** tab.
1. **Create** a secret.
    - Use an appropriate name - see [Token names](#token-names)
    - Past the value copied in the section above.

### 3. Use the token in a workflow

Format:

```
${{ secrets.TOKEN_NAME }}
```

e.g.


```yaml
with:
  ACCESS_TOKEN: ${{ secrets.ACCESS_TOKEN }}
```

```yaml
env:
  JEKYLL_PAT: ${{ secrets.JEKYLL_PAT }}
```

### 4. Run build

- Push to the repo, or
- Go to your action and click rerun.



## Using a token directly

For cloning or pulling a private repo, or doing restricted actions such as push.


### Manual

Use token in place of a password. 

```sh
$ git clone https://github.com/USERNAME/REPO_NAME.git
Username: <token>
Password:
```

### Automation

Use token as part of the URL.

```
https://<token>@github.com/USERNAME/REPO_NAME.git
```

Or
```
https://<token>:x-oauth-basic@github.com/USERNAME/REPO_NAME.git
```


### Notes

From [blog post](https://github.blog/2012-09-21-easier-builds-and-deployments-using-git-over-https-and-oauth/)

> Tokens should be treated as passwords. Putting the token in the clone URL will result in Git writing it to the .git/config file in plain text. Unfortunately, this happens for HTTP passwords, too. 
