
module Types
  class CommentInputType < GraphQL::Schema::InputObject
    graphql_name 'CommentInputType'
    description 'All attributes to create/update a new comment'

    argument :id, ID, required: false
    argument :body, String, required: false
    argument :post_id, ID, required: true
  end
end