---
title: Repos
---

- Multiple repos
    - e.g.  [https://api.github.com/users/MichaelCurrin/repos](https://api.github.com/users/MichaelCurrin/repos)
- Single repo
    - e.g. [https://api.github.com/repos/MichaelCurrin/badge-generator](https://api.github.com/repos/MichaelCurrin/badge-generator)


Note that there are parameters like limit and page but these are not covered here.


## Single repo sample output

For Badge Generator single repo URL.

Summarized to the most interesting fields - commenting out or deleting the less interesting ones.


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

### URL notes


Note that homepage will use whatever is in the repo's URL section, not necessarily Github Pages.

e.g.

```
homepage": "https://artists-portfolio.netlify.app/",
```

Use `has_pages` to determine if Github Pages is active (then you can figure out the URL programmatically).


## Multiple repos sample output

```json
{
    "id": 147400032,
    "node_id": "MDEwOlJlcG9zaXRvcnkxNDc0MDAwMzI=",
    "name": "aggre-git",
    "full_name": "MichaelCurrin/aggre-git",
    "private": false,
    "owner": {
      "login": "MichaelCurrin",
      "id": 18750745,
      "node_id": "MDQ6VXNlcjE4NzUwNzQ1",
      "avatar_url": "https://avatars0.githubusercontent.com/u/18750745?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/MichaelCurrin",
      "html_url": "https://github.com/MichaelCurrin",
      "followers_url": "https://api.github.com/users/MichaelCurrin/followers",
      "following_url": "https://api.github.com/users/MichaelCurrin/following{/other_user}",
      "gists_url": "https://api.github.com/users/MichaelCurrin/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/MichaelCurrin/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/MichaelCurrin/subscriptions",
      "organizations_url": "https://api.github.com/users/MichaelCurrin/orgs",
      "repos_url": "https://api.github.com/users/MichaelCurrin/repos",
      "events_url": "https://api.github.com/users/MichaelCurrin/events{/privacy}",
      "received_events_url": "https://api.github.com/users/MichaelCurrin/received_events",
      "type": "User",
      "site_admin": false
    },
    "html_url": "https://github.com/MichaelCurrin/aggre-git",
    "description": "Report on aggregated Github activity data, based around PRs and users within your organization",
    "fork": false,
    "url": "https://api.github.com/repos/MichaelCurrin/aggre-git",
    "forks_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/forks",
    "keys_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/keys{/key_id}",
    "collaborators_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/collaborators{/collaborator}",
    "teams_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/teams",
    "hooks_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/hooks",
    "issue_events_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/issues/events{/number}",
    "events_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/events",
    "assignees_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/assignees{/user}",
    "branches_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/branches{/branch}",
    "tags_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/tags",
    "blobs_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/git/blobs{/sha}",
    "git_tags_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/git/tags{/sha}",
    "git_refs_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/git/refs{/sha}",
    "trees_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/git/trees{/sha}",
    "statuses_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/statuses/{sha}",
    "languages_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/languages",
    "stargazers_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/stargazers",
    "contributors_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/contributors",
    "subscribers_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/subscribers",
    "subscription_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/subscription",
    "commits_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/commits{/sha}",
    "git_commits_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/git/commits{/sha}",
    "comments_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/comments{/number}",
    "issue_comment_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/issues/comments{/number}",
    "contents_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/contents/{+path}",
    "compare_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/compare/{base}...{head}",
    "merges_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/merges",
    "archive_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/{archive_format}{/ref}",
    "downloads_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/downloads",
    "issues_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/issues{/number}",
    "pulls_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/pulls{/number}",
    "milestones_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/milestones{/number}",
    "notifications_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/notifications{?since,all,participating}",
    "labels_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/labels{/name}",
    "releases_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/releases{/id}",
    "deployments_url": "https://api.github.com/repos/MichaelCurrin/aggre-git/deployments",
    "created_at": "2018-09-04T19:16:24Z",
    "updated_at": "2020-03-08T12:59:46Z",
    "pushed_at": "2019-12-30T19:47:57Z",
    "git_url": "git://github.com/MichaelCurrin/aggre-git.git",
    "ssh_url": "git@github.com:MichaelCurrin/aggre-git.git",
    "clone_url": "https://github.com/MichaelCurrin/aggre-git.git",
    "svn_url": "https://github.com/MichaelCurrin/aggre-git",
    "homepage": "",
    "size": 151,
    "stargazers_count": 0,
    "watchers_count": 0,
    "language": "Python",
    "has_issues": true,
    "has_projects": true,
    "has_downloads": true,
    "has_wiki": false,
    "has_pages": false,
    "forks_count": 1,
    "mirror_url": null,
    "archived": false,
    "disabled": false,
    "open_issues_count": 3,
    "license": {
      "key": "mit",
      "name": "MIT License",
      "spdx_id": "MIT",
      "url": "https://api.github.com/licenses/mit",
      "node_id": "MDc6TGljZW5zZTEz"
    },
    "forks": 1,
    "open_issues": 3,
    "watchers": 0,
    "default_branch": "master"
  },
  {
    "id": 163117748,
    "node_id": "MDEwOlJlcG9zaXRvcnkxNjMxMTc3NDg=",
    "name": "alembic-kit",
    "full_name": "MichaelCurrin/alembic-kit",
    "private": false,
    "owner": {
      "login": "MichaelCurrin",
      "id": 18750745,
      "node_id": "MDQ6VXNlcjE4NzUwNzQ1",
      "avatar_url": "https://avatars0.githubusercontent.com/u/18750745?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/MichaelCurrin",
      "html_url": "https://github.com/MichaelCurrin",
      "followers_url": "https://api.github.com/users/MichaelCurrin/followers",
      "following_url": "https://api.github.com/users/MichaelCurrin/following{/other_user}",
      "gists_url": "https://api.github.com/users/MichaelCurrin/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/MichaelCurrin/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/MichaelCurrin/subscriptions",
      "organizations_url": "https://api.github.com/users/MichaelCurrin/orgs",
      "repos_url": "https://api.github.com/users/MichaelCurrin/repos",
      "events_url": "https://api.github.com/users/MichaelCurrin/events{/privacy}",
      "received_events_url": "https://api.github.com/users/MichaelCurrin/received_events",
      "type": "User",
      "site_admin": false
    },
    "html_url": "https://github.com/MichaelCurrin/alembic-kit",
    "description": "Copied from original alembic-kit repo using Deploy to Netlify button",
    "fork": false,
    "url": "https://api.github.com/repos/MichaelCurrin/alembic-kit",
    "forks_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/forks",
    "keys_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/keys{/key_id}",
    "collaborators_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/collaborators{/collaborator}",
    "teams_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/teams",
    "hooks_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/hooks",
    "issue_events_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/issues/events{/number}",
    "events_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/events",
    "assignees_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/assignees{/user}",
    "branches_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/branches{/branch}",
    "tags_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/tags",
    "blobs_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/git/blobs{/sha}",
    "git_tags_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/git/tags{/sha}",
    "git_refs_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/git/refs{/sha}",
    "trees_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/git/trees{/sha}",
    "statuses_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/statuses/{sha}",
    "languages_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/languages",
    "stargazers_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/stargazers",
    "contributors_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/contributors",
    "subscribers_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/subscribers",
    "subscription_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/subscription",
    "commits_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/commits{/sha}",
    "git_commits_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/git/commits{/sha}",
    "comments_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/comments{/number}",
    "issue_comment_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/issues/comments{/number}",
    "contents_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/contents/{+path}",
    "compare_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/compare/{base}...{head}",
    "merges_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/merges",
    "archive_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/{archive_format}{/ref}",
    "downloads_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/downloads",
    "issues_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/issues{/number}",
    "pulls_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/pulls{/number}",
    "milestones_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/milestones{/number}",
    "notifications_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/notifications{?since,all,participating}",
    "labels_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/labels{/name}",
    "releases_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/releases{/id}",
    "deployments_url": "https://api.github.com/repos/MichaelCurrin/alembic-kit/deployments",
    "created_at": "2018-12-25T23:39:04Z",
    "updated_at": "2018-12-26T15:05:51Z",
    "pushed_at": "2018-12-25T23:40:37Z",
    "git_url": "git://github.com/MichaelCurrin/alembic-kit.git",
    "ssh_url": "git@github.com:MichaelCurrin/alembic-kit.git",
    "clone_url": "https://github.com/MichaelCurrin/alembic-kit.git",
    "svn_url": "https://github.com/MichaelCurrin/alembic-kit",
    "homepage": "",
    "size": 28,
    "stargazers_count": 0,
    "watchers_count": 0,
    "language": "Ruby",
    "has_issues": true,
    "has_projects": true,
    "has_downloads": true,
    "has_wiki": true,
    "has_pages": false,
    "forks_count": 0,
    "mirror_url": null,
    "archived": false,
    "disabled": false,
    "open_issues_count": 0,
    "license": null,
    "forks": 0,
    "open_issues": 0,
    "watchers": 0,
    "default_branch": "master"
  }
]
```
