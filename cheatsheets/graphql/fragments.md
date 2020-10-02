---
title: Fragments
---


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

Here we pass a param to a fragment:

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

