class Buy < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address

  validates :token, presence: true
end
