require 'rails_helper'

RSpec.describe Admin, type: :model do

  def singin(args = {})
    Mutations::SignInAdmin.new(object: nil, field: nil, context: { session: {} }).resolve(args)
  end

  def create_admin
    Admin.create(name: 'Test Admin', email: 'email@example.com', password: '[omitted]')
  end

  it "create admin" do
    args = { name: 'Test User',
             auth_provider: {
               credentials: {
                 email: 'email@example.com',
                 password: '[omitted]'
                 }
               }
             }
    admin = Mutations::CreateAdmin.new(object: nil, field: nil, context: {}).resolve(**args)
    expect(admin.persisted?).to be(true)
    expect(admin.name).to eq('Test User')
    expect(admin.email).to eq('email@example.com')
  end

  it "sign in admin" do
    admin = create_admin
    result = singin(
      credentials: {
        email: admin.email,
        password: admin.password
      }
    )

    expect(result[:token].present?).to be(true)
    expect(result[:admin]).to eq(admin)
  end

  it "failure because no credentials" do
    expect(singin).to be_nil
  end

  it "failure because wrong email" do
    create_admin
    expect(singin(credentials: {email: 'wrong'})).to be_nil
  end

  it "failure because wrong password" do 
    admin = create_admin
    expect(singin(credentials: {email: admin.email, password: 'wrong'})).to be_nil
  end
end