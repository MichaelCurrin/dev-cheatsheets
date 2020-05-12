# Tokens cheatsheet
> Instructions to set a Github token for CI builds

A Github action needs permissions to push to your `gh-pages` branch. 

Approaches, from simplest to most complex.

- [Github token](github_token.md)
	- Repo-specific API key
	- Auto-generated for a workflow
- [Access token](access_token.d)
	- Account-level API key.
	- Easy to generate and add to a workflow.
- [Deploy key](deploy_key.md)
	- Repo-specific API key.
	- Needs to be generated locally using SSH tool and your email address then pasted in.

<!--stackedit_data:
eyJoaXN0b3J5IjpbMTcxNjIzMjEyN119
-->