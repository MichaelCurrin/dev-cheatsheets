# Searches

Searching in the GitHub UI.


## Search in user

[Link](https://github.com/search?q=user%3AMichaelCurrin+javascript)

`user:MichaelCurrin javascript`


## Search in repo

[Link](https://github.com/MichaelCurrin/javascript-bundling-quickstarts/search?q=typescript)

`javascript`


## View Pull Requests

### All

[Pulls](https://github.com/pulls) default value

### Closed

[Closed](https://github.com/pulls?q=is%3Apr+author%3AMichaelCurrin+archived%3Afalse+is%3Aclosed)

`is:pr author:MichaelCurrin archived:false is:closed`

Includes merged and not merged.

### Merged

[Merged](https://github.com/pulls?q=is%3Apr+author%3AMichaelCurrin+archived%3Afalse+is%3Amerged+)

`is:pr author:MichaelCurrin archived:false is:merged `

### Merged in other people's repo

Excluding my own user for the target repo.

[Merged](https://github.com/pulls?q=is%3Apr+author%3AMichaelCurrin+archived%3Afalse+-user%3AMichaelCurrin+is%3Amerged)

`is:pr author:MichaelCurrin archived:false -user:MichaelCurrin is:merged`
