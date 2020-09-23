module Mutations
  class SignInAdmin < BaseMutation
    null true

    argument :credentials, Types::AuthProviderCredentialsInput, required: false

    field :token, String, null: true
    field :admin, Types::AdminType, null: true

    def resolve(credentials: nil)
      # basic validation
      return unless credentials

      admin = Admin.find_by email: credentials[:email]

      # ensures we have the correct admin
      return unless admin
      return unless admin.authenticate(credentials[:password])

      # use JWT token
      payload = { data: admin.id }
      token = JWT.encode(payload, Rails.application.secrets.secret_key_base)

      context[:session][:token] = token

      { admin: admin, token: token }
    end
  end
end