# Repos

{% raw %}


## Endpoints

### Trees

List paths in a repo. Blobs as files and trees as directories.

```
api.github.com/repos/OWNER/REPO/git/trees/REFERENCE?recursive=1
```

e.g. This gets over 1000 paths in [Dev Cheatsheets](https://github.com/MichaelCurrin/dev-cheatsheets) without paging needed.

[api.github.com/repos/MichaelCurrin/dev-cheatsheets/git/trees/master?recursive=1](https://api.github.com/repos/MichaelCurrin/dev-cheatsheets/git/trees/master?recursive=1)

If you omit recursive, you get the top, which is just 17 paths in this case.

I have a [Gist][] on how to do something similar with GQL, but the REST solution seems better.

[Gist]: https://gist.github.com/MichaelCurrin/6777b91e6374cdb5662b64b8249070ea

### Single repo 

Get a single repo. There will be more URLs in the response to you navigate or automate request.

Example for Badge Generator single repo URL.

- [/repos/MichaelCurrin/badge-generator](https://api.github.com/repos/MichaelCurrin/badge-generator)


Summarized below as the most interesting fields - commenting out or deleting the less interesting ones.

```json5
{
  "name": "badge-generator",
  "full_name": "MichaelCurrin/badge-generator",
  "private": false,
  
  "owner": {
    "login": "MichaelCurrin",
    "id": 18750745,
    // ...
  },
  
  "html_url": "https://github.com/MichaelCurrin/badge-generator",
  "description": "Online tool to help you quickly generate tailor-made badges/shields for your repo docs and learn to work with badges",
  "fork": false,
  "url": "https://api.github.com/repos/MichaelCurrin/badge-generator",
  "forks_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/forks",
  
  // "keys_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/keys{/key_id}",
  // "collaborators_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/collaborators{/collaborator}",
  // "teams_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/teams",
  //"hooks_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/hooks",
  //"issue_events_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/issues/events{/number}",
  //"events_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/events",
  //"assignees_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/assignees{/user}",
  
  "branches_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/branches{/branch}",
  "tags_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/tags",
  "blobs_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/git/blobs{/sha}",
  "git_tags_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/git/tags{/sha}",
  //"git_refs_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/git/refs{/sha}",
  "trees_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/git/trees{/sha}",
  "statuses_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/statuses/{sha}",
  "languages_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/languages",
  "stargazers_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/stargazers",
  "contributors_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/contributors",

  //"subscribers_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/subscribers",
  //"subscription_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/subscription",
  "commits_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/commits{/sha}",
  "git_commits_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/git/commits{/sha}",

  //"comments_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/comments{/number}",
  //"issue_comment_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/issues/comments{/number}",
  "contents_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/contents/{+path}",
  //"compare_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/compare/{base}...{head}",
  //"merges_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/merges",
  "archive_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/{archive_format}{/ref}",
  "downloads_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/downloads",
  "issues_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/issues{/number}",
  "pulls_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/pulls{/number}",

  //"milestones_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/milestones{/number}",
  //"notifications_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/notifications{?since,all,participating}",
  //"labels_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/labels{/name}",
  
  "releases_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/releases{/id}",
  "deployments_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/deployments",

  "created_at": "2020-01-26T11:27:02Z",
  "updated_at": "2020-06-01T09:21:51Z",
  "pushed_at": "2020-06-01T09:21:48Z",

  "git_url": "git://github.com/MichaelCurrin/badge-generator.git",
  "ssh_url": "git@github.com:MichaelCurrin/badge-generator.git",
  "clone_url": "https://github.com/MichaelCurrin/badge-generator.git",
  "svn_url": "https://github.com/MichaelCurrin/badge-generator",
  "homepage": "https://michaelcurrin.github.io/badge-generator/",
  "size": 134,
  "stargazers_count": 0,
  "watchers_count": 0,
  "language": "JavaScript",
  "has_issues": true,
  "has_projects": false,
  "has_downloads": true,
  "has_wiki": false,
  "has_pages": true,

  "forks_count": 0,
  //"mirror_url": null,
  "archived": false,
  "disabled": false,
  "open_issues_count": 23,
  "license": {
    "key": "mit",
    "name": "MIT License",
    "spdx_id": "MIT",
    "url": "https://api.github.com/licenses/mit",
    "node_id": "MDc6TGljZW5zZTEz"
  },
  "forks": 0,
  "open_issues": 23,
  "watchers": 0,
  "default_branch": "master",
  //"temp_clone_token": null,
  //"network_count": 0,
  //"subscribers_count": 1
}
```
   

### Multiple repos

Get multiple repos for a user.

- [/users/MichaelCurrin/repos](https://api.github.com/users/MichaelCurrin/repos)

Note that there are also parameters like `limit` and `page` to set on repos, but these are not covered here.

```json5
{
    "id": 147400032,
    "node_id": "MDEwOlJlcG9zaXRvcnkxNDc0MDAwMzI=",
    "name": "aggre-git",
    "full_name": "MichaelCurrin/aggre-git",
    "private": false,
    
    // ...
  },
  
  {
    // ...
  }
]
```

### Downloads

Docs: 

- [Download a repository archive (tar)](https://docs.github.com/en/rest/reference/repos#download-a-repository-archive-tar)

```
https://api.github.com/repos/OWNER/REPO/tarball/REFERENCE
```

e.g.

[api.github.com/repos/MichaelCurrin/dev-cheatsheets/tarball/master](https://api.github.com/repos/MichaelCurrin/dev-cheatsheets/tarball/696ed154d5d59c4d33ac82fcf6f0326bc4fbaafc)


Without the API, from zip download button:

- [github.com/MichaelCurrin/dev-cheatsheets/archive/master.zip](https://github.com/MichaelCurrin/dev-cheatsheets/archive/master.zip)



## Fields

Here are notes on fields of interest found on a repo.

### Tags

All tags:

- [/repos/MichaelCurrin/badge-generator/tags](https://api.github.com/repos/MichaelCurrin/badge-generator/tags)

You'll see a field like `"tag_name": "v2.0.0"`.

Note using `\` doesn't work for pipe `|`, but using brackets allows you to wrap across lines.

```console
$ (curl -s 'https://api.github.com/repos/MichaelCurrin/badge-generator/releases/latest' |
  grep '"tag_name":' | 
  sed -E 's/.*"([^"]+)".*/\1/')
v2.19.0
```

Testing on a simplified case:

```console
$ echo '"tag_name": "v2.0.0"' | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/'
v2.0.0
```

I originally found this using `wget`, but that is unneccessary for handling text and not downloading a file.

```console
$ (wget -qO- 'https://api.github.com/repos/MichaelCurrin/badge-generator/releases/latest' | 
  grep '"tag_name":' | 
  sed -E 's/.*"([^"]+)".*/\1/')
v2.0.0
```

### Releases

You can't see all releases I don't think, but you can get target releases.

Latest release (does _not_ include those marked as "pre-release"):

- [/repos/MichaelCurrin/badge-generator/releases/latest](https://api.github.com/repos/MichaelCurrin/badge-generator/releases/latest)

Look up by ID e.g. `34552316`:

- [/repos/MichaelCurrin/badge-generator/releases/34552316](https://api.github.com/repos/MichaelCurrin/badge-generator/releases/34552316)

Sample response:

```json5
{
  "url": "https://api.github.com/repos/MichaelCurrin/badge-generator/releases/54486193",
  "assets_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/releases/54486193/assets",
  // ...
  "tarball_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/tarball/v2.19.0",
  "zipball_url": "https://api.github.com/repos/MichaelCurrin/badge-generator/zipball/v2.19.0",
  // ...
}
```

Note that if you use `latest`, that is just an alias to say `v2.19.0` and its matching ID, so your JSON repsonse will still have the actual tag number and ID in it.

### Homepage URL

Note that homepage field will use whatever is in the repo's URL section, not necessarily a GitHub Pages URL.

e.g.

```json
{
  "homepage": "https://artists-portfolio.netlify.app/"
}
```

Read `has_pages` to determine if GitHub Pages is active. Then you can figure out the URL programmatically.

{% endraw %}
