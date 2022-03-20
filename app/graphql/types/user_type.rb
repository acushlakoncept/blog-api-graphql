# frozen_string_literal: true
module Types
  class UserType < Types::BaseObject

    description "One user"

    field :id, ID, null: true
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :email, String, null: true
    field :is_superadmin, Boolean, null: true
    field :street, String, null: true
    field :number, Integer, null: true
    field :city, String, null: true
    field :postcode, String, null: true
    field :country, String, null: true
    field :full_name, String, null: true
    field :full_address, String, null: true
    field :posts, [Types::PostType], null: true

    field :errors, [Types::ErrorType], null: true

    def errors
      object.errors.map { |e| { field_name: e.attributes, errors: object.errors[e.attribute] } }
    end

    def self.visible?(context)
      !!context[:current_user]
    end



  end

end