# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :body, String, null: false
    field :comments, [Types::CommentType], null: false
    field :errors, [Types::ErrorType], null: true
  end

end
