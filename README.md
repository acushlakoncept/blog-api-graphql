# BLOG API WITH GRAPHQL

A simple blog API using GraphQL


### Setup

~~~bash
$ git clone git@github.com:acushlakoncept/blog-api-graphql.git
$ cd blog-api-graphql
~~~

Install gems with:

```
bundle install
```

Setup database with:

> make sure you have postgress sql installed and running on your system

```
  rails db:create
  rails db:migrate
```

### Usage

Start server with:

```
  rails server
```

### Access the GraphQL 

Setup GraphQL playground to test your query by downloading [GraphiQL](https://github.com/skevy/graphiql-app/releases) 

Open `http://localhost:3000/graphql` in your GraphiQL app.


### Sample Query

Find all Users with Post and Comments

```js
{
  users {
    id
    fullName
    email
    fullAddress
    posts {
      id
      body
      comments {
        id
        body
      }
    }
  }
}
```

Create a new User

```js
mutation createUser($user: UserInputType!) {
  createUser(user: $user) {
    id
    fullName
    fullAddress
  }
}
```

Query Variables

```js
{
  "user": {
    "firstName": "John",
    "lastName": "Doe",
    "email": "john.doe@mail.com",
    "password": "123456",
    "street": "john avenue",
    "number": 123,
    "city": "Uyo",
    "postcode": "340032",
    "country": "Nigeria"
  }
}
```

Login User

```js
{
	login(email: "john.doe@mail.com", password: "123456")
}
```

Successful login returns a token
```js
{
  "data": {
    "login": "d96e8699713be14a872aefa66ddf679eee90e71f24d7e09851a9fb14cc969a7e4c0c2395caea3f8f"
  }
}
```
You can add the login token by editing the http headers using 
Header name => `Authorization` 
Header value => `d96e8699713be14a872aefa66ddf679eee90e71f24d7e09851a9fb14cc969a7e4c0c2395caea3f8f`


Access current user

```js
{
	currentUser {
    email
  }
}
```

Logout

```js
{
	logout
}
```

You can use the code below to show or hide query type base on user Authorization

Visibility
```ruby
  def self.visible?(context)
    !!context[:current_user]
  end
```


# Authors

👤 **Uduak Essien**

- Github: [@acushlakoncept](https://github.com/acushlakoncept/)
- Twitter: [@acushlakoncept](https://twitter.com/acushlakoncept)
- Linkedin: [acushlakoncept](https://www.linkedin.com/in/acushlakoncept/)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

