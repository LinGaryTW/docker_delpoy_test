require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:all) do 
    @user1 = User.create(name: "aaa")
  end

  it "#index" do
    get :index
    expect(response).to have_http_status(200)
  end

  it "#new" do
    get :new
    expect(response).to have_http_status(200)
  end

  it "#edit" do
    get :edit, params: { id: @user1[:id] }
    expect(response).to have_http_status(200)
  end

  it "#create" do
    post :create, params: { user: { name: "abc" } }
    expect(response).to have_http_status(302)
    expect(User.last.name).to eq("abc")
    expect(User.last.emai).to eq(nil)
  end

  it "#update" do
    post :update, params: { id: @user1.id, user: { name: "bbb" }}
    @user1.reload
    expect(@user1.name).to eq("bbb")
    expect(response).to have_http_status(302)
  end

  it "#destroy" do
    delete :destroy, params: { id: @user1.id}
    expect(response).to have_http_status(302)
    expect(User.find_by(id: @user1.id)).to eq(nil)
  end
end