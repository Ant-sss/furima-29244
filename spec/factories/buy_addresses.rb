FactoryBot.define do
  factory :buy_address do
    # number        { 4242424242424242 }
    # exp_month     { 3 }
    # exp_year      { 23 }
    # cvc           { 123 }
    token         { 'aaaaaaaaaaaaaaa' }
    postal_code   { '123-4567' }
    prefecture_id { 2 }
    city          { 'さいたま市' }
    house_num     { '大宮1-1' }
    building_name  { '柳ビル102' }
    phone_num     { '09012345678' }

  end
end
