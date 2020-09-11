class Address < ApplicationRecord
  belongs_to :buy

  POSTAL_REGEX = /\A\d{3}[-]\d{4}\z/
  PHONE_REGEX = /[0-9]{11}/
  with_options presence: true do
    validates :postal_code, format: { with: POSTAL_REGEX }
    validates :phone_num, format: { with: PHONE_REGEX }
    validates :city, :building_name
  end

  validates :prefecture_id, numericality: { other_than: 1 }
end