module Types
  class AGary < BaseInputObject
    # the name is usually inferred by class name but can be overwritten
    graphql_name 'A_Gary'

    argument :aa, String, required: false
    argument :b_gary, Types::BGary, required: false
  end
end