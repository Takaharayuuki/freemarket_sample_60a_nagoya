FactoryBot.define do
  factory :user do
    sequence(:email) {Faker::Internet.email}
    password         {"password"}
    nickname         {"test"}
    firstname        {"ああああ"}
    lastname         {"いいいい"}
    firstname_kana   {"アアアア"}
    lastname_kana    {"イイイイ"}
  end
end