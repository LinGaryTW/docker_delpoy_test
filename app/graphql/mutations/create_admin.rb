module Mutations
  class CreateAdmin < BaseMutation
    # often we will need input types for specific mutation
    # in those cases we can define those input types in the mutation class itself
    class AuthProviderSignupData < Types::BaseInputObject
      argument :credentials, Types::AuthProviderCredentialsInput, required: false
    end

    argument :name, String, required: true
    argument :a_gary, Types::AGary, required: false
    argument :auth_provider, AuthProviderSignupData, required: false

    type Types::AdminType

    def resolve(name: nil, auth_provider: nil, a_gary: nil)
      Admin.create!(
        name: name,
        email: auth_provider&.[](:credentials)&.[](:email),
        password: auth_provider&.[](:credentials)&.[](:password)
      )
    end
  end
end