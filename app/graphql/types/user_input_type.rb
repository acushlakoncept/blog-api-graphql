module Types
  class UserInputType < GraphQL::Schema::InputObject
    graphql_name 'UserInputType'
    description 'All attributes to create/update a new user'

    argument :id, ID, required: true
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
    argument :is_superadmin, Boolean, required: true
    argument :street, String, required: true
    argument :number, Integer, required: true
    argument :city, String, required: true
    argument :postcode, String, required: true
    argument :country, String, required: true
  end
end