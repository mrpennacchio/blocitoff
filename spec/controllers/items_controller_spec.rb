require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
let (:user){User.create(name: "User Name", email:"user@example.com", password:"password", confirmed_at: Time.now)}
let (:item){Item.create(name: "This is a new item") }

before :each do
  sign_in user
end

  describe "POST create" do
    it "increases the number of Item by 1" do
      expect{
        post :create, item: {name: "This is a new item", user_id: user.id}
        }.to change(Item,:count).by(1)
    end

    it "redirects to the root path" do
      post :create, item: {name:"This is a new item", user_id: user.id}
      response.should redirect_to root_path
    end

    it "assigns the new item to @item" do
      post :create, item: {name:"This is a new item", user_id: user.id}
      expect(assigns(:items)).to eq Item.last
    end
  end

  describe "DELETE destroy" do
    it "deletes the item" do
      delete :destroy, user_id: user.id, id: item.id
      count = Item.where(id: item.id).size
      expect(count).to eq 0
    end
  end

end
