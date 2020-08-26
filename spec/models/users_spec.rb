require 'rails_helper'

RSpec.describe User, type: :model do
  it "is accessible" do
    user = User.create!
    expect(user).to eq(User.last)
  end

  it "has columes" do
    columes = User.column_names
    expect(columes).to include("name")
    expect(columes).to include("emai")
    expect(columes).to include("ammount")
    expect(columes).not_to include("lalalilalu")
  end
end