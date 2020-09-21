module Types
  class LinkType < Types::BaseObject
    field :id, ID, null: false
    field :url, String, null: false
    field :description, String, null: false
    # `posted_by` is automatically camelcased as `postedBy`
    # field can be nil, because we added admins relationship later
    # "method" option remaps field to an attribute of Link model
    field :posted_by, AdminType, null: true, method: :admin
    field :votes, [Types::VoteType], null: false
    field :admin, Types::AdminType, null: true do
      argument :id, ID, required: false
    end

    def admin(id:)
      Loaders::PrimaryKeyLoader.for(Admin).load(id)
    end
  end
end
