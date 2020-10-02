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
