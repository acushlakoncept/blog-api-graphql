
module Types
  class PostInputType < GraphQL::Schema::InputObject
    graphql_name 'PostInputType'
    description 'All attributes to create/update a new post'

    argument :id, ID, required: false
    argument :body, String, required: true
    argument :user_id, ID, required: true
  end
end