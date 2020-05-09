# Tokens cheatsheet
> Instructions to set a Github token for CI builds

A Github action needs permissions to push to your `gh-pages` branch. 

There are a few approachs:


## Personal Access Token

aka "PAT" or "authentication token".

- Create manually this at the Github **account** level, then and use for one or more repos. 
- Uses
     - Can be used in actions
     - For other cases such as manual or automated REST requests, if you put it in your URL or enter as your password. The PAT is actually _necessary_ if you use two-factor authenticator or single sign-on (otherwise you have to enter those a number on the command-line).
- Permissions are granted per token based on your choices.
- Read it in anction with this, or whatever name action uses:
     ```yaml
     ${{ secrets.ACCESS_TOKEN }}
     ```
- Docs - [Creating a Personal Access Token for the Command-line](https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line)

See [Access Token](access_token.md) cheatsheet for more info.

_**Warning:** Treat your tokens like passwords and keep them secret. When working with the API, use tokens as environment variables instead of hardcoding them into your programs._

Github will also scan to find accidentally committed secrets - [doc](https://help.github.com/en/github/administering-a-repository/about-secret-scanning).


## Github Token

- Generated **automatically** - Github creates this for you on an action run.
- You can use it in actions only.
- Read it in an action:
     ```yaml
     ${{ secrets.GITHUB_TOKEN }}
     ````
- Docs
    - [Authenticating with the Github Token](https://help.github.com/en/actions/configuring-and-managing-workflows/authenticating-with-the-github_token)
        - > GitHub automatically creates a GITHUB_TOKEN secret to use in your workflow. You can use the GITHUB_TOKEN to authenticate in a workflow run.
        - Includes use in REST API request (such as for Jekyll build), which not straightforward to setup from what I read before.
        - See the [Permissions](https://help.github.com/en/actions/configuring-and-managing-workflows/authenticating-with-the-github_token#permissions-for-the-github_token) section.


## Deploy key

- Generated manually.
- It is tied to a machine.
- A deploy key is an SSH public key.
- It takes more effort to setup than the other steps.
- To be researched if it is a good fit for actions (if the remote machine is note known).
- Read it in an action with:
    ```yaml
    ${{ secrets.DEPLOY_KEY }}
    ```
- It can be used to **read** from a Git repo (including a private one) and deploy it on a remote server.
- Optionally it can have **write** access - such as for writing to a deploy branch.


### How to generate and SSH key

- If the machine doesn't have an SSH key set, you'll have to generate one. 
- Even if it has one, you might choose to create a new one that is used specifically for Github, so you could delete if you want and leave behind one that you use for other SSH purposes.

Generate:

```sh
$ ssh-keygen
```

Or, according to [gist](https://gist.github.com/zhujunsan/a0becf82ade50ed06115) on using it on a Linux server - not in the GH Actions context.


```sh
$ ssh-keygen -t rsa -b 4096 -C "{email}"
```

View:

```sh
$ cat ~/.ssh/id_rsa.pub
```

[SSH guide](https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh) on Github docs.


### How to add a deploy key on Github

1. Go to repo Settings.
1. Go to Deploy Keys.
1. Create key.
    - Set **title** with convenient.
    - Paste into **key** as an SSH public key (so only that a certain machine can deploy).
    - Optionally tick **Allow write access**.
    
