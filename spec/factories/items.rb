FactoryBot.define do
  factory :item do
    id {1}
    name {Faker::Superhero.name}
    price {5000}
    condition {"新品"}
    delivery_fee {300}
    shipping_method {"ゆうゆうメルカリ便"}
    indication {"1~2日"}
    burden {"出品者が負担"}
    description {Faker::ChuckNorris.fact}
    category_id {518}
  end
end