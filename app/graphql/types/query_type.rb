# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :users, [UserType], null: false, description: 'Find all users'

    def users
      User.all
    end

    field :posts, [PostType], null: false, description: 'Find all posts'

    def posts
      Post.all
    end

    field :comments, [CommentType], null: false, description: 'Find all comments'

    def comments
      Comment.all
    end

    field :login, String, null: true, description: 'Login a user' do
      argument :email, String, required: true
      argument :password, String, required: true
    end

    def login(email:, password:)
      if user = User.where(email: email).first&.authenticate(password)
        user.sessions.create.key
      end
    end

    field :current_user, UserType, null: true, description: 'The current logged in user' 

    def current_user
      context[:current_user]
    end

    field :logout, Boolean, null: true, description: 'Logout a user'

    def logout
      Session.where(id: context[:session_id]).destroy_all
      true
    end
    
  end
end
