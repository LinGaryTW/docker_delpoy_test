module Types
  module BaseInterface
    include GraphQL::Schema::Interface

    field_class Types::BaseField
    field_class GraphQL::Cache::Field
  end
end
