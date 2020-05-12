# Deploy key

## About

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


## How to generate and SSH key

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


## How to add a deploy key on Github

1. Go to repo Settings.
1. Go to Deploy Keys.
1. Create key.
    - Set **title** with convenient.
    - Paste into **key** as an SSH public key (so only that a certain machine can deploy).
    - Optionally tick **Allow write access**.
    
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTI0NDM3NTIwN119
-->