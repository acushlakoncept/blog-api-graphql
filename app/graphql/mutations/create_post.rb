# frozen_string_literal: true

module Mutations
  class CreatePost < GraphQL::Schema::Mutation
    null true

    argument :post, Types::PostInputType, required: true

    type Types::PostType

    def resolve(post:)
      Post.create!(
        post.to_h
      )
    end

    def self.visible?(context)
      !!context[:current_user]
    end

    # def self.authorization?(object, context)
    #   !!context[:current_user]
    # end

  end
end