require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) {User.create!(name: "User", email:"user@example.com", password: "password", confirmed_at: Time.now)}
  let(:item) {Item.create!(name: "New item name", user_id: user)}


  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(1) }


end
