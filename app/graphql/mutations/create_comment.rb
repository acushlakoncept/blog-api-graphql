# frozen_string_literal: true

module Mutations
  class CreateComment < GraphQL::Schema::Mutation
    null true

    argument :comment, Types::CommentInputType, required: true

    type Types::CommentType

    def resolve(comment:)
      Comment.create!(
        comment.to_h
      )
    end

    def self.visible?(context)
      !!context[:current_user]
    end

  end
end