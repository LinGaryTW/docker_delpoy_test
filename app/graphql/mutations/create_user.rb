module Mutations
  class CreateUser < BaseMutation
    # arguments passed to the `resolve` method
    argument :emai, String, required: true
    argument :name, String, required: true
    argument :ammount, Integer, required: false

    # return type from the mutation
    field :result, String, null: true
    field :user, Types::UserType, null: true

    def resolve(emai: nil, name: nil, ammount: 0)
      user = User.create!(
        emai: emai,
        name: name,
        ammount: ammount
      )

      { result: "lalalala", user: user }
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end