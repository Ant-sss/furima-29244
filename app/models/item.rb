class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image

  validates :name, :text, :category, :delivery_fee, :ship_from, :days, :price, presence: true
end
