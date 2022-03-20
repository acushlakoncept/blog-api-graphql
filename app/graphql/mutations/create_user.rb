# frozen_string_literal: true

module Mutations
  class CreateUser < GraphQL::Schema::Mutation
    null true

    # argument :first_name, String, required: true
    # argument :last_name, String, required: true
    # argument :street, String, required: true
    # argument :number, Integer, required: true
    # argument :city, String, required: true
    # argument :postcode, String, required: true
    # argument :country, String, required: true

    argument :user, Types::UserInputType, required: true

    type Types::UserType

    # def resolve(first_name:, last_name:, street:, number:, city:, postcode:, country:)
    #   User.create!(
    #     first_name: first_name,
    #     last_name: last_name,
    #     street: street,
    #     number: number,
    #     city: city,
    #     postcode: postcode,
    #     country: country
    #   )
    # end

    def resolve(user:)
      User.create!(
        user.to_h
      )
    end

  end
end