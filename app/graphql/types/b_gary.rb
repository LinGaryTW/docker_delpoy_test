module Types
  class BGary < BaseInputObject
    # the name is usually inferred by class name but can be overwritten
    graphql_name 'B_Gary'

    argument :aa, String, required: false
    argument :content, String, required: false
  end
end