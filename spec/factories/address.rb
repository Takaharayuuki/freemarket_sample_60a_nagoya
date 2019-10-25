FactoryBot.define do
  factory :address do
    user_id {1}
    prefecture_id {24}
    post_address {1234567}
    city {Faker::Address.city}
    house_number {Faker::Address.street_address}
    building_name {Faker::Address.building_number}
  end
end