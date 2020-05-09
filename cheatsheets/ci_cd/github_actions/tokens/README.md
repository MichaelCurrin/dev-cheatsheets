# Tokens cheatsheet
> Instructions to set a Github token for CI builds

A Github action needs permissions to push to your `gh-pages` branch. 

There are a few approachs:


## Personal Access Token

Or simply authentication token.

- Create this at the user level and use for one or more repos, not just for actions.
- Read it in anction with this, or whatever name action uses:
     ```yaml
     ${{ secrets.ACCESS_TOKEN }}
     ```
- Docs - [Creating a Personal Access Token for the Command-line](https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line)


## Github Token

- Github creates this for you on a workflow run and you can use it in actions.
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

- A deploy key is an SSH public key.
- Read it in an action with:
    ```yaml
    ${{ secrets.DEPLOY_KEY }}
    ```
- It can be used to **read** from a Git repo (including a private one) and deploy it on a remote server.
- Optionally it can have **write** access - such as for writing to a deploy branch.


### How to generate and SSH key

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
    
