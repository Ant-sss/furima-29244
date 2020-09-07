FactoryBot.define do
  factory :item do
    name           { Faker::Lorem.sentence }
    text           { Faker::Lorem.sentence }
    category_id    { 4 }
    status_id      { 2 }
    deliveryfee_id { 2 }
    shipfrom_id    { 15 }
    day_id         { 2 }
    price          { 2000 }
    association :user
  end
end
