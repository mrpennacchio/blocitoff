require 'rails_helper'

RSpec.describe User, type: :model do
   let(:user) { User.create!(name: "user name", email: "username@example.com", password: "password", password_confirmation: "password", confirmed_at: Time.now) }

   # tests for name
   it { is_expected.to validate_presence_of(:name) }
   it { is_expected.to validate_length_of(:name).is_at_least(1) }

   it { is_expected.to have_many(:items) }

   describe "invalid user" do
     let(:user_with_no_name) {User.new(name:"", email: "username@example.com")}

     it "should be an invalid user if name is empty" do
       expect(user_with_no_name).to_not be_valid
     end
   end
 end
