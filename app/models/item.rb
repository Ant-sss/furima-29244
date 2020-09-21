class Item < ApplicationRecord
  belongs_to :user
  has_one :buy, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :deliveryfee
  belongs_to_active_hash :shipfrom
  belongs_to_active_hash :day
  has_many :commentsk dependent: :destroy

  PRICE_REGEX = /[0-9]/
  with_options presence: true do
    validates :name, :text, :price, :image
    validates :price, format: { with: PRICE_REGEX }, 
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
  validates :category_id, :status_id, :deliveryfee_id, :shipfrom_id, :day_id, numericality: { other_than: 1 }

end
