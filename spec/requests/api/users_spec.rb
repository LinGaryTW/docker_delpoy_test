require 'swagger_helper'
# reference saple
# https://medium.com/@clarkjohnson_85334/adding-swagger-docs-to-a-rails-6-api-using-rswag-a3e8bc577986
RSpec.describe 'api/users', type: :request do
  path '/users' do

    post 'create a user' do
      tags 'users'
      consumes 'application/jason'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          emai: { type: :string },
          ammount: {type: :integer }
        },
        required: [ 'name', 'emai', 'ammount' ]
      }
      response '201', 'user created' do
        let(:user) { { name: 'gary', emai: 'asdf@123', ammount: 123} }
        run_test!
      end
      response '422', 'invalid' do
        let(:user) { { name: 'gary' } }
        run_test!
      end
    end
  end
end
