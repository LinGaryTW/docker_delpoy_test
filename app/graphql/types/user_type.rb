module Types
  class UserType < Types::BaseObject
    field :name, String, null: true
    field :emai, String, null: true
    field :ammount, Integer, null: true
    field :id, ID, null: false
  end
end
