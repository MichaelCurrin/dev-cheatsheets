# Access token cheatsheet

## Access token naming

aka "PAT" or "authentication token".

Depending on the workflow, the token should be named something like one of these:

- `ACCESS_TOKEN`
- `JEKYLL_PAT` or "Jekyll Personal Access Token" in the case of one project's convention.


## About

- Create manually this at the Github **account** level, then and use for one or more repos.
- Uses
     - Can be used in actions
     - For other cases such as manual or automated REST requests, if you put it in your URL or enter as your password. The PAT is actually _necessary_ if you use two-factor authenticator or single sign-on (otherwise you have to enter those a number on the command-line).
- Permissions are granted per token based on your choices.
- Read it in action with this, or whatever name action uses:
     ```yaml
     ${{ secrets.ACCESS_TOKEN }}
     ```
- Docs - [Creating a Personal Access Token for the Command-line](https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line)

See [Access Token](access_token.md) cheatsheet for more info.

_**Warning:** Treat your tokens like passwords and keep them secret. When working with the API, use tokens as environment variables instead of hardcoding them into your programs._

Github will also scan to find accidentally committed secrets - [doc](https://help.github.com/en/github/administering-a-repository/about-secret-scanning).


## How to use an access token in a workflow


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



## Using an access token directly

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
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTc1NTcwMzU2XX0=
-->
