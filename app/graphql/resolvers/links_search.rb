require 'search_object'
require 'search_object/plugin/graphql'

class Resolvers::LinksSearch
  # include SertchObject for graphQL
  include SertchObject.module(:graphQL)
  
  # scope is starting point for search
  scope { Link.all }
end