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
    field :admin, Types::AdminType, null: true

    def admin
      Loaders::PrimaryKeyLoader.for(Admin).load(object.admin_id)
    end
  end
end
