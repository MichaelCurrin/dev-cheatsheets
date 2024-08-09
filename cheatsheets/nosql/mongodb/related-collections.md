# Related Collections

MongoDB's flexible schema allows you to represent relationships between data in different ways. One common approach is to use separate collections for related entities and establish relationships using references or embedded documents.

## Users and Posts

Let's consider an example where we have a `users` collection and a `posts` collection, representing user profiles and blog posts, respectively.

### Sample of related data

```javascript
// users collection
{
  "_id": ObjectId("6436e9c8d9f6b3c8e7f9d9e3"),
  "name": "John Doe",
  "email": "john@example.com"
}

// posts collection
{
  "_id": ObjectId("6436e9c8d9f6b3c8e7f9d9e4"),
  "title": "My First Post",
  "content": "This is the content of my first blog post.",
  "author": ObjectId("6436e9c8d9f6b3c8e7f9d9e3"),
  "comments": [
    {
      "author": ObjectId("6436e9c8d9f6b3c8e7f9d9e5"),
      "content": "Great post!",
      "timestamp": ISODate("2023-04-11T10:30:00Z")
    }
  ]
}
```

In this example, we have separate collections for `users` and `posts`. The `posts` collection contains an `author` field that references the `_id` of the corresponding user document in the `users` collection. Additionally, the `comments` field in the `posts` collection is an array of embedded documents, where each comment references the `_id` of the user who posted the comment.

This approach allows you to query and update users and posts independently while maintaining the relationship between them. You can use MongoDB's query operators and aggregation framework to perform complex operations involving related data.

### Create collections

To create these related collections, you can use the `db.createCollection()` method in the MongoDB shell or the appropriate driver method in your programming language of choice.

```javascript
// Create the users collection
db.createCollection("users")

// Create the posts collection
db.createCollection("posts")
```

Once the collections are created, you can insert documents and establish relationships between them using references or embedded documents, as shown in the example above.

This is just one way to represent relationships in MongoDB. Depending on your data model and requirements, you may choose to use different approaches, such as embedding documents within other documents or using more advanced techniques like application-level joins or data denormalization.

### Get all posts for a user

To get all posts for a specific user, you can use the `find` method and filter the `posts` collection based on the `author` field, which references the user's `_id`.

```javascript
// Get the user's _id
var userId = ObjectId("6436e9c8d9f6b3c8e7f9d9e3");

// Find all posts where the author field matches the user's _id
db.posts.find({ author: userId });
```

This query will return all documents in the `posts` collection where the `author` field matches the provided `userId`.

### Get a user given a comment

To get the user who posted a specific comment, you can use the `$unwind` operator to deconstruct the `comments` array in the `posts` collection, and then perform a lookup to the `users` collection based on the `author` field in the comment document.

```javascript
// Get the comment's author _id
var commentAuthorId = ObjectId("6436e9c8d9f6b3c8e7f9d9e5");

// Find the user document based on the comment author _id
db.posts.aggregate([
  { $unwind: "$comments" },
  { $match: { "comments.author": commentAuthorId } },
  {
    $lookup: {
      from: "users",
      localField: "comments.author",
      foreignField: "_id",
      as: "commentAuthor"
    }
  },
  { $unwind: "$commentAuthor" },
  { $project: { _id: 0, commentAuthor: 1 } }
]);
```

Here's what this query does:

1. `$unwind`: Deconstructs the `comments` array, creating a separate document for each comment.
2. `$match`: Filters the documents to only include those where the `author` field in the comment matches the provided `commentAuthorId`.
3. `$lookup`: Performs a left outer join with the `users` collection, matching the `author` field in the comment with the `_id` field in the `users` collection. The matched user documents are stored in the `commentAuthor` field.
4. `$unwind`: Deconstructs the `commentAuthor` array, which should contain at most one document.
5. `$project`: Excludes the `_id` field and includes only the `commentAuthor` field, which contains the user document for the comment author.

This query will return the user document for the author of the specified comment.

Note that these queries assume that you have properly set up the relationships between the `users` and `posts` collections using references or embedded documents, as shown in the previous example.
