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

      # use Ruby on Rails - ActiveSupport::MessageEncryptor, to build a token
      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      token = crypt.encrypt_and_sign("admin-id:#{ admin.id }")

      context[:session][:token] = token

      { admin: admin, token: token }
    end
  end
end