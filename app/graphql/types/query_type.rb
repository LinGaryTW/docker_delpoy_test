module Types
  class QueryType < BaseObject
    # queries are just represented as fields
    # `all_links` is automatically camelcased to `allLinks`

    # field :all_links, [LinkType], null: false
    field :all_links, resolver: Resolvers::LinksSearch
    field :all_Users, [UserType], null: false
    # this method is invoked, when `all_link` fields is being resolved
    # def all_links
    #   Link.all
    # end
    def all_Users
      User.all
    end
  end
end
