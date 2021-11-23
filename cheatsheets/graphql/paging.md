# Paging


## Commits

Here we do a query against GitHub's GraphQL.

- Query.
	```graphql
	query CommitsForRepo($owner: String!, $repo_name: String!, $since: GitTimestamp, $cursor: String) {
		repository(owner: $owner, name: $repo_name) {
			defaultBranchRef {
				name
				target {
					... on Commit {
						history(since: $since, first: 100, after: $cursor) {
							totalCount

							nodes {
							  committedDate
							}

							pageInfo{
							  endCursor
							}
						}
					}
				}
			}
		}
	}
	```
- Sample data.
	```json
	{
	    "owner": "MichaelCurrin",
  		"repo_name": "aggre-git",
		"since": "2020-06-01T00:00:00Z",
		"cursor": null
	}
	```

### Since

To get the format for the timestamp, check an output value such as for `committedDate`.


### Cursor

The cursor is optional but if set should be a value from `endCursor` for the previous query.

Unfortunately, for GitHub at least, the cursor must be a value returned from the server which is a hash and an index from `0` to `99`, usually one less than your `first` value.

Example of a shortened value: `"72cf1cc...204 99"`.

A way to get all queries in one query without waiting for a response, is using `since` and `after` to change the date range. For example, get repos in 2019 only (or 2019 and before) and then 2020 onwards. But that assumes there are not more than 100 in 2019 (which you'll miss), but you'll have to watch the latest group in case in maxes out. And then modify the query.
