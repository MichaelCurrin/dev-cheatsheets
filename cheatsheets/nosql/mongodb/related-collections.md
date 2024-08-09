# Related collections

MongoDB's flexible schema allows you to represent relationships between data in different ways. One common approach is to use separate collections for related entities and establish relationships using references or embedded documents.

## Users and Posts

Let's consider an example where we have a `users` collection and a `posts` collection, representing user profiles and blog posts, respectively.


### Create

```javascript
db.users.insertOne({
  "_id": 2,
  "name": "John Doe",
  "email": "john@example.com"
})

db.posts.insertOne({
  "_id": 2,
  "title": "My First Post",
  "content": "This is the content of my first blog post.",
  "author": 2,
  "comments": [
    {
      "content": "Great post!",
      "timestamp": ISODate("2023-04-11T10:30:00Z")
    }
  ]
})
```

### Find

Get a post for a specific user.

```javascript
db.posts.find({ "author": 1})
```

Find comments for a specifc user, returning comments data only for a post:

```javascript
db.posts.find(
  { "author": 1 },
  { "comments": 1, "_id": 0 }
)
```
