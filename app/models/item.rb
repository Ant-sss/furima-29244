class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :deliveryfee
  belongs_to_active_hash :shipfrom
  belongs_to_active_hash :day

  PRICE_REGEX = /[0-9]/
  validates :name, :text, :price, presence: true
  validates :price, presence: true, format: { with: PRICE_REGEX }, 
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :category_id, :status_id, :deliveryfee_id, :shipfrom_id, :day_id, numericality: { other_than: 1 }
end
