---
title: Variables
---


## Basic

Define and use a param. 

```graphql
query Foo ($name: String) {
	  foo (name: $name) {
}
```

Use `!` for required - may not be `null` or omitted.

```graphql
query Foo ($name: String!, $is_released: Boolean!) {
	foo (name: $name) {
		# ...
	}
	bar (released: $is_released) {
		# ...
	}
}
```

The `$name` can be anything but must match the key in the JSON data. The `name` here is an argument for `foo`, which is dependent on the external schema.

## Sending JSON data

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
	

## Default

```graphql
query Foo ($name: String = "Bar") {
	  foo (name: $name) {
}
```

You might reference a type instead.

```
($episode: Episode = JEDI) 
```
