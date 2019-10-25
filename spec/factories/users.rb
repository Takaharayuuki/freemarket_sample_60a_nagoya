FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    password = Faker::Internet.password(8)
    nickname {Faker::Name.last_name}
    password {password}
    birth_year {1999}
    birth_month {12}
    birth_day {7}
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    first_name_kana {Faker::Name.first_name}
    last_name_kana {Faker::Name.last_name}
  end
end