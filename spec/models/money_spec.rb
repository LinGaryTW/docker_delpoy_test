require 'rails_helper'

RSpec.describe Money, type: :model do
  it "is accessible" do
    user = User.create!
    money = Money.create!(user_id: user.id)
    expect(money).to eq(Money.last)
  end
  
  it "belongs_to user" do
    money = Money.create
    expect(money.valid?).to eq(false)
    user = User.create
    money.user_id = user.id
    money.save
    expect(money.valid?).to eq(true)
  end

  it "has columes" do
    columes = Money.column_names
    expect(columes).to include("user_id")
    expect(columes).to include("amount")
    expect(columes).not_to include("lalalilalu")
  end
end