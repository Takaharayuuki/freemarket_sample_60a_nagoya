FactoryBot.define do
  factory :item do
    id {1}
    name {Faker::Superhero.name}
    price {5000}
    condition {"新品"}
    shipping_method {"ゆうゆうメルカリ便"}
    indication {"1~2日"}
    burden {"出品者が負担"}
    description {Faker::ChuckNorris.fact}
    category_id {518}
    saler_id {1}
    delivery_area {"愛知県"}
    brand {"シャネル"}
  end
end