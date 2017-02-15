class Item < ApplicationRecord
  belongs_to :user

  validates :name, length: {minimum: 1}, presence: true
end
