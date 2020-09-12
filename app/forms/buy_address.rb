class BuyAddress
  include ActiveModel::Model
  
  attr_accessor :postal_code, :prefecture_id, :city, :house_num, :building_name, :phone_num, :token, :user_id, :item_id

  POSTAL_REGEX = /\A\d{3}[-]\d{4}\z/
  PHONE_REGEX = /[0-9]{11}/
  with_options presence: true do
    validates :postal_code, format: { with: POSTAL_REGEX }
    validates :phone_num, format: { with: PHONE_REGEX }
    validates :city, :house_num, :token
  end
  validates :prefecture_id, numericality: { other_than: 1 }


  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_num: house_num, building_name: building_name, phone_num: phone_num, buy_id: buy.id)
  end

end