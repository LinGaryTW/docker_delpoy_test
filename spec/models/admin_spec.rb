require 'rails_helper'

RSpec.describe Admin, type: :model do
  it "is accessible" do
    args = { name: 'Test User',
             auth_provider: {
               credentials: {
                 email: 'email@example.com',
                 password: '[omitted]'
                 }
               }
             }
    admin = Mutations::CreateAdmin.new(object: nil, field: nil, context: {}).resolve(args)
    expect(admin.persisted?).to be(true)
    expect(admin.name).to eq('Test User')
    expect(admin.email).to eq('email@example.com')
  end
end