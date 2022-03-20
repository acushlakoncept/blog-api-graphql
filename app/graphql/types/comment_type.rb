# frozen_string_literal: true

module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :post, PostType, null: false
    field :body, String, null: false
    
    
    field :errors, [Types::ErrorType], null: true

    def errors
      object.errors.map { |e| { field_name: e.attributes, errors: object.errors[e.attribute] } }
    end
  end
end
