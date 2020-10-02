---
title: Queries
---

From [Queries and Mutations](https://graphql.org/learn/queries/) section of the GraphQL learn docs.


## Basic

### Field

```graphql
{
  hero {
    name
  }
}
```

```graphql
{
  hero {
    name
    friends {
      name
    }
  }
}
```

### Lists

Most of the time when you get a list, you'll have to specify pagination boundaries, which are covered below. See more in [Arguments](#arguments).

```graphql
{
	foo (first: 100) {
		edges {
      		node {
        		name
      		}
    	}
	}
}
```

Or, shorthand:

```graphql
{
	foo (first: 100) {
		nodes {
			name
    	}
	}
}
```


## Arguments

No arguments - use default values, or get an error if it is required.

```graphql
{
  human {
    name
    height
  }
}
```

```graphql
{
  human(id: "1000") {
    name
    height
  }
}
```

Here we change from metres to feet.

```graphql
{
  human(id: "1000") {
    name
    height(unit: FOOT)
  }
}
```


## Aliases

An alias is necessary to avoid an error on duplicate key. By default each one below would have the key `"hero"`.

```graphql
{
  empireHero: hero(episode: EMPIRE) {
    name
  }
  jediHero: hero(episode: JEDI) {
    name
  }
}
```


## Fragments

### Basic

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

### Variables

Using a variable inside a fragment.

```graphql
fragment comparisonFields on Character {
  name
  friendsConnection(first: $first) {
    totalCount
    # ...
  }
}

query HeroComparison($first: Int = 3) {
  leftComparison: hero(episode: EMPIRE) {
    ...comparisonFields
  }
  rightComparison: hero(episode: JEDI) {
    ...comparisonFields
  }
}
```


## Operation names

- Basic 
	- `query` is implied and there is no query name.
	```graphql
	{
	  hero {
		name
		friends {
		  name
		}
	  }
	}
	```
- Specific 
	- This helps in production apps including when viewing a debug message.
	```graphql
	query HeroNameAndFriends {
	  hero {
		name
		friends {
		  name
		}
	  }
	}
	```


## Variables

### Basic

Define and use a param. Here we have two and the second is required (`!` means may not be null).

```graphql
query Foo ($name: String, $bar: Boolean!) {
	  foo (name: $name) {
}
```

The `$name` can be anything but must match the key in the JSON data. The `name` here is an argument for `foo`, which is dependent on the external schema.

Example:

- Query.
	```graphql
	query HeroNameAndFriends ($episode: Episode) {
	  hero(episode: $episode) {
		name
		friends {
		  name
		}
	  }
	}
	```
- JSON data.
	```json
	{
	  "episode": "JEDI"
	}
	```
	
###
### Default

```graphql
query Foo ($name: String = "Bar") {
	  foo (name: $name) {
}
```

You might reference a type instead.

```
($episode: Episode = JEDI) 
```
