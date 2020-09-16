module Types
  class VoteType < Types::BaseObject
    field :id, ID, null: false
    field :admin, Types::AdminType, null: false
    field :link, Types::LinkType, null: false
  end
end
