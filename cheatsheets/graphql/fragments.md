# Fragments

A fragment is a reusasble piece of code, like a function. It has fields and can take parameters. A fragment does not affecte nature of the JSON output but makes your code lighter.


## Basic

Define and use a fragment.

```graphql
fragment comparisonFields on Character {
  name
  appearsIn
  friends {
    name
  }
}

{
  leftComparison: hero(episode: EMPIRE) {
    ...comparisonFields
  }
  rightComparison: hero(episode: JEDI) {
    ...comparisonFields
  }
}
```


## GitHub example

Repos from GitHub GraphQL. If you use the wrong type for `on TYPE`, the explorer will warn you in the query and recommend a type.

```graphql
fragment Repos on RepositoryConnection {
  nodes {
    name
    updatedAt
  }
}

query {
  viewer {
    login
    latest: repositories(first: 3, orderBy: {field: CREATED_AT, direction: DESC}) {
      ...Repos
    }
    oldest: repositories(last: 3, orderBy: {field: CREATED_AT, direction: DESC}) {
      ...Repos
    }
  }
}
```

<details>
<summary>Result</summary>

```json
{
  "data": {
    "viewer": {
      "login": "MichaelCurrin",
      "latest": {
        "nodes": [
          {
            "name": "table-sniffer",
            "updatedAt": "2020-09-28T13:26:12Z"
          },
          {
            "name": "territories",
            "updatedAt": "2020-09-21T15:49:06Z"
          },
          {
            "name": "delize.github.io",
            "updatedAt": "2020-09-22T08:43:10Z"
          }
        ]
      },
      "oldest": {
        "nodes": [
          {
            "name": "track-my-life",
            "updatedAt": "2020-03-08T12:57:41Z"
          },
          {
            "name": "git-sandbox",
            "updatedAt": "2020-01-23T13:24:55Z"
          },
          {
            "name": "python-flask-app-2016",
            "updatedAt": "2020-05-31T17:22:32Z"
          }
        ]
      }
    }
  }
}
```

</details>


Here is an alternative fragment setup, which gives the same response.

```graphql
fragment RepoData on Repository {
  name
  updatedAt
}

{
  viewer {
    login
    latest: repositories(first: 3, orderBy: {field: CREATED_AT, direction: DESC}) {
      nodes {
        ...RepoData
      }
    }
    oldest: repositories(last: 3, orderBy: {field: CREATED_AT, direction: DESC}) {
      nodes {
        ...RepoData
      }
    }
  }
}
```


## Variables

Using a variable inside a fragment.

```graphql
fragment comparisonFields on Character {
  name
  friendsConnection (first: $first) {
    totalCount
    # ...
  }
}

query HeroComparison ($first: Int = 3) {
  leftComparison: hero(episode: EMPIRE) {
    ...comparisonFields
  }
  rightComparison: hero(episode: JEDI) {
    ...comparisonFields
  }
}
```

Here we pass on `to` and `from` params to a fragment without having specify them in the fragment.

```graphql
fragment weekStats on ContributionsCollection {
	totalCommitContributions
	# ...
}

{
	viewer {
		_2015: contributionsCollection(from: "2015-01-01T00:00:00", to: "2016-01-01T00:00:00") {
			...weekStats
		}
		_2016: contributionsCollection(from: "2016-01-01T00:00:00", to: "2017-01-01T00:00:00") {
			...weekStats
		}
	}
}
```

From [weekly.gql](https://github.com/MichaelCurrin/github-graphql-tool/blob/master/ghgql/queries/contributions/weekly.gql)
