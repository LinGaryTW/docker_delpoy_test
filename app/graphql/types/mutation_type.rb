module Types
  class MutationType < BaseObject
    field :create_link, mutation: Mutations::CreateLink
    field :create_admin, mutation: Mutations::CreateAdmin
    field :signin_admin, mutation: Mutations::SignInAdmin
  end
end
